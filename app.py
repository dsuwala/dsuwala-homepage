from flask import Flask, jsonify, send_from_directory, request
from flask_cors import CORS
import requests

app = Flask(__name__, static_folder='static')
CORS(app)
PREDICTION_ENGINE_URL = "http://localhost:8000"


@app.route('/')
def serve_index():
    return send_from_directory(app.static_folder, 'index.html')


@app.route('/antirecommender', methods=['POST'])
def antirecommender():
    # Mock antirecommender endpoint
    return jsonify({
        'recommendations': [
            'If you like coffee, try staying awake all night',
            'If you enjoy reading, try reading backwards',
            'If you like music, try listening to everything at 0.5x speed'
        ]
    })


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
    print(query)

    response = requests.get(f"{PREDICTION_ENGINE_URL}/search-suggestions", params={'query': query})
    response_json = response.json()
    print(response_json)
    matching_movies = [
        movie for movie in response_json.suggestions
        if query in movie.lower()][:10]  # limit to 10 suggestions
    return jsonify(matching_movies)


if __name__ == '__main__':
    app.run(debug=True) 