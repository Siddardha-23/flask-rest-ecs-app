from flask_restful import Resource

class HealthCheck(Resource):
    """
    Health check resource to confirm the server is running.
    """
    def get(self):
        return {"msg": "Server is running"}, 200
    
    def post(self):
        return {"msg": "Server is running"}, 200
    
    def update(self):
        return {"msg": "Server is running"}, 200
    
    def put(self):
        return {"msg": "Server is running"}, 200
    