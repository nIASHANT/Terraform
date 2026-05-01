from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return {"message": "Hello from Flask Backend"}

@app.route("/api")
def api():
    return {"message": "Flask API Running"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)