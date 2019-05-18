from flask import Flask
from flask import request
# from client_db import 
from admin_db import Client

client = Client()
client.GetOne(1)
result = client.GetResult()
for field in result:
    print field, result[field]


# app = Flask(__name__)

# @app.route("/", methods = ["GET"])
# def get_all_tasks():
#     pass

# @app.route("/<id>", methods = ["GET"])
# def get_task_by_id(task_id):
#     pass

# @app.route("/", methods = ["POST"])
# def add_assignement():
#     pass

# @app.route("/", methods = ["PUT"])
# def update_assignement():
#     pass

# @app.route("/", methods = ["DELETE"])
# def delete_assignment():
#     pass


# if __name__ == "__main__":
#     app.run(host="0.0.0.0", port=5122)
