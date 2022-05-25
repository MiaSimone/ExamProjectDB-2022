
from flask import Flask, request, jsonify, render_template

app = Flask(__name__, template_folder='hmtl_documents')

@app.route('/')
def start():
    return render_template('start2.html')

@app.route('/data2', methods=['GET', 'POST'])
def data2():
    if request.method == 'POST':
        uId = request.form['uId']
        cId = request.form['cId']
          
        return render_template("data2.html", data=[uId, cId])

if __name__ == '__main__':
    app.run(debug=True)
