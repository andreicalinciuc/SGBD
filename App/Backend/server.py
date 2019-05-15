from flask import Flask
from flask import request
from db import DB

test = DB()
print test.get_active_routes()
print test.get_traseu_cursa(3)

app = Flask(__name__)

@app.route("/", methods = ["GET"])
def get_all_tasks():
    pass

@app.route("/<id>", methods = ["GET"])
def get_task_by_id(task_id):
    pass

@app.route("/", methods = ["POST"])
def add_assignement():
    pass

@app.route("/", methods = ["PUT"])
def update_assignement():
    pass

@app.route("/", methods = ["DELETE"])
def delete_assignment():
    pass


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5122)
