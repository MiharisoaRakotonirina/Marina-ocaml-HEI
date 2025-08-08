from flask import Flask, request
import subprocess

app = Flask(__name__)

@app.route("/marina")
def run_marina():
    laza = request.args.get('laza', 'a')  # Default value 'a'
    try:
        result = subprocess.run(["./marina", laza], capture_output=True, text=True)
        return result.stdout
    except Exception as e:
        return str(e), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)