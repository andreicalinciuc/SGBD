from flask import Flask
from flask import request
import db

app = Flask(__name__)

@app.route("/", methods = ["GET"])
def get_all_tasks():
    return db.getAll()

@app.route("/<id>", methods = ["GET"])
def get_task_by_id(task_id):
    return db.getById(task_id)

@app.route("/", methods = ["POST"])
def add_assignement():
    return db.post_assignement(request.get_json())

@app.route("/", methods = ["PUT"])
def update_assignement():
    return db.put_assignement(request.get_json())

@app.route("/", methods = ["DELETE"])
def update_assignement():
    return db.put_assignement(request.get_json())



if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5122)
