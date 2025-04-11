from flask import Flask, jsonify, send_from_directory, request
from flask_cors import CORS
import requests
import logging
import uvicorn
import os
from google.auth.transport import requests as g_requests
from google.oauth2 import id_token
import re


app = Flask(__name__, static_folder='static')
CORS(app, origins="*")

logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)

# PREDICTION_ENGINE_URL = "http://localhost:8000"
PREDICTION_ENGINE_URL = os.getenv("PREDICTION_ENGINE_URL")
if not PREDICTION_ENGINE_URL:
    raise EnvironmentError("PREDICTION_ENGINE_URL is not set")


def clean_movie_title(title: str) -> str:
    """Remove content within brackets and the brackets themselves."""
    return re.sub(r'\(.*?\)', '', title).strip()


@app.route('/')
def serve_index():
    return send_from_directory(app.static_folder, 'index.html')


@app.route('/antirecommender', methods=['POST'])
def antirecommender():

    data = request.json
    query = data.get("query")
    query = re.sub(r'\(.*\)', '', query)

    json = {"movie_title": query.strip()}

    if data.get("year"):
        year = data.get("year")
        json.update({"year": year})

    try:
        token = id_token.fetch_id_token(g_requests.Request(), PREDICTION_ENGINE_URL)
    except Exception as e:
        logger.error(f"Failed to fetch ID token: {str(e)}")
        return jsonify({"error": "Authentication failed"}), 500

    # Make request to the recommender API
    response = requests.post(
        f"{PREDICTION_ENGINE_URL}/recommend",
        json=json,
        headers={"Authorization": f"Bearer {token}"}
    )

    logger.info(f"Response: {response.json()}")

    if "error" in response.json().keys():
        possible_matches = [
            f"Title: {result[0]}, year: {int(result[1])}"
            for result in response.json()["possible_matches"]
        ]

        result = jsonify({
            "query": query,
            "possible_matches": possible_matches[:3]
        })

        return result
    else:
        recommendations = [
            f"Title: {result['standardized_title']}, "
            f"year: {int(result['year'])}, "
            f"rating: {result['rating']:.2f}"
            for result in response.json()["recommendations"]
        ]
        result = jsonify({
            "query": query,
            "results": recommendations
        })

        return result


@app.route('/taste', methods=['POST'])
def taste():
    # Mock taste endpoint
    return jsonify({
        'preferences': [
            'Minimalistic design',
            'Clean code',
            'Dark mode everything',
            'Mechanical keyboards'
        ]
    })


@app.route('/antirecommender/search-suggestions', methods=['GET'])
def get_suggestions():
    query = request.args.get('query', '').lower()
    logger.info(f"Received search suggestions request for query: {query}")

    try:
        token = id_token.fetch_id_token(g_requests.Request(), PREDICTION_ENGINE_URL)
    except Exception as e:
        logger.error(f"Failed to fetch ID token: {str(e)}")
        return jsonify({"error": "Authentication failed"}), 500

    response = requests.get(
        f"{PREDICTION_ENGINE_URL}/search-suggestions",
        params={'query': query},
        headers={"Authorization": f"Bearer {token}"}
    )
    response_json = response.json()
    logger.info(f"Suggestions: {response_json}")
    suggestions = response_json['suggestions']
    return jsonify(suggestions)


if __name__ == '__main__':
    logger.info("Starting server...")
    # app.run(debug=True)
    uvicorn.run("app:app", host='0.0.0.0', port=8080, reload=True)
