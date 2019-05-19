from flask import Flask
from flask import request
from flask import jsonify
from flask_cors import CORS
from functions import get_active_routes, get_traseu_cursa, get_fastest_ride

app = Flask(__name__)
CORS(app)

@app.route("/get_active_routes", methods = ["GET"])
def active_routes():
    return jsonify(get_active_routes()), 200

@app.route("/get_traseu_cursa/<id_cursa>", methods = ["GET"])
def traseu_cursa(id_cursa):
    return jsonify(get_traseu_cursa(id_cursa)), 200

@app.route("/get_fastest_ride/<id_from>,<id_to>", methods = ["GET"])
def fastest_ride(id_from, id_to):
    return jsonify(get_fastest_ride(id_from, id_to)), 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
