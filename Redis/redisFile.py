
from flask import Flask, request, jsonify, render_template
import redis
import json
import pickle

app = Flask(__name__, template_folder='hmtl_documents')


r = redis.Redis(db=1)
#r.flushdb()

with open('./datasets/cars.json') as json_file:
    data = json.load(json_file)

read_dict = r.get(200000)
yourdict = pickle.loads(read_dict)
print(yourdict)

def getData2(n):
    dataList = []
    tic = time.perf_counter()
    d = r.get(n)
    yourdict = pickle.loads(d)
    dataList.append(yourdict)
    toc = time.perf_counter()
    dataList.append(toc - tic)
    return dataList

@app.route('/')
def start():
    #attributes = getAttributes()
    attributes = ['1', '2']
    return render_template('start.html', attributes=yourdict, time=attributes[-1])

if __name__ == '__main__':
    app.run(debug=True)
