from flask import Flask
from flask_restful import Api
from flask_cors import CORS
from flask_jwt_extended import JWTManager

from resources.healthcheck import HealthCheck


app = Flask(__name__)

cors = CORS(app, resources={r"/api/*": {"origins": "*"}})
api = Api(app)
app.config['JWT_SECRET_KEY'] ='123456'
jwt = JWTManager(app)

api.add_resource(HealthCheck,'/api/v1/')

if __name__ == "__main__":
    app.run(host="0.0.0.0",port = 5000, debug=True)