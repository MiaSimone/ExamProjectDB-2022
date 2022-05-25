
from flask import Flask, request, jsonify, render_template

app = Flask(__name__, template_folder='hmtl_documents')

@app.route('/')
def start():
    return render_template('start2.html')

if __name__ == '__main__':
    app.run(debug=True)
