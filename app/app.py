
from flask import Flask, jsonify

import os

app = Flask (__name__)

# Root endpoint
@app.route("/")
def home():
    return jsonify({
        "status": "ok",
        "message": "aws-devops-demo app running",
        "version": os.getenv("APP_VERSION", "1.0.0")
    })

# Health check endpoint - liveness/readyness probe
@app.route("/health")
def health():
    return jsonify({"status": "healthy"}), 200

# Metrics endpoint - Prometheus
@app.route("/metrics-check")
def metrics():
    return jsonify({"status": "metrics endpoint ok"}), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)