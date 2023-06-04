from flask import Flask, jsonify

app = Flask(__name__)
app.url_map.strict_slashes = False

@app.route("/home/")
def home():
    return jsonify({"message": "Welcome to my Home"})

@app.route("/healthz/")
def healthz():
    return jsonify({"message": "The api is up an running"})

def main():
    pass

if __name__ == "__main__":
    main()