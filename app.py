from flask import Flask, jsonify, send_from_directory, request
from flask_cors import CORS
import requests
import logging

app = Flask(__name__, static_folder='static')
CORS(app)
PREDICTION_ENGINE_URL = "http://localhost:8000"

logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)


@app.route('/')
def serve_index():
    return send_from_directory(app.static_folder, 'index.html')


@app.route('/antirecommender', methods=['POST'])
def antirecommender():

    data = request.json
    query = data.get("query")

    json = {"movie_title": query}

    if data.get("year"):
        year = data.get("year")
        json.update({"year": year})

    # Make request to the recommender API
    response = requests.post(
        f"{PREDICTION_ENGINE_URL}/recommend",
        json=json
    )

    logger.info(f"Response: {response.json()}")

    if "error" in response.json().keys():
        possible_matches = [f"Title: {result[0]}, year: {int(result[1])}" for result in response.json()["possible_matches"]]

        result = jsonify({
            "query": query,
            "possible_matches": possible_matches[:3]
        })

        return result
    else:

        recommendations = [f"Title: {result['standardized_title']}, year: {int(result['year'])}, rating: {result['rating']:.2f}" for result in response.json()["recommendations"]]
        result = jsonify({
            "query": query,
            "results": recommendations
        })

        return result
    # return jsonify({
    #     'recommendations': [
    #         'If you like coffee, try staying awake all night',
    #         'If you enjoy reading, try reading backwards',
    #         'If you like music, try listening to everything at 0.5x speed'
    #     ]
    # })


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

    response = requests.get(f"{PREDICTION_ENGINE_URL}/search-suggestions", params={'query': query})
    response_json = response.json()
    logger.info(f"Suggestions: {response_json}")
    suggestions = response_json['suggestions']
    return jsonify(suggestions)


if __name__ == '__main__':
    app.run(debug=True) 