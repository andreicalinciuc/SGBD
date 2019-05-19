from flask import Flask
from flask import request
from flask import jsonify
from flask_cors import CORS
from functions import get_active_routes, get_traseu_cursa, get_fastest_ride
from procedures import available_procedures, ExecuteProcedure

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

@app.route("/procedure/<procedure_name>", methods = ["POST"])
def exec_procedure(procedure_name):
    if procedure_name in available_procedures:
        print request.json
        if isinstance(request.json, list):
            param_types_list = [type(elem) for elem in request.json]
            if param_types_list == available_procedures[procedure_name]:
                result, msg = ExecuteProcedure(procedure_name, request.json)
                if result:
                    return "", 200
                else:
                    return msg, 400
            else:
                return "Parameters not in valid format!", 400
        else:
            return "Parameters list is missing!", 400
    else:
        return "Procedure not found.", 404

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
