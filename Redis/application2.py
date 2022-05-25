
from flask import Flask, request, jsonify, render_template
import redis
import json
import time
import pandas as pd
import pickle
from redisFile import getData2
#import redisFile.py as redisFile

app = Flask(__name__, template_folder='hmtl_documents')

# ---------------- THE CODE -------------------------
df_carList = pd.read_csv("./datasets/Car_listings.csv", delimiter=",")
df_carList = df_carList.drop(['Price'], axis = 1)

df_carList.to_json('./datasets/cars.json', orient='split', compression='infer', index='true')
df = pd.read_json('./datasets/cars.json', orient ='split', compression = 'infer')

r = redis.Redis(db=1)

with open('./datasets/cars.json') as json_file:
    data = json.load(json_file)
    
# Loop og give hver værdi en key som er deres kolonne navn
columns = list(df)
listOfDict = []

def smallDictFunction(co: [], di: {}) -> {}:
    smallDicts = {}
    for c in co:
        for d in di:
            if (columns.index(c) == dic.index(d)):
                smallDicts[c] = d
    return smallDicts
   
for dic in data['data']:
    listOfDict.append(smallDictFunction(columns, dic))
    if (data['data'].index(dic)+1 == 5):
        break    # break here

index_list = [*range(1, (len(listOfDict)+1), 1)]
fullDict = dict(zip(index_list, listOfDict))

with open("./datasets/carsDict.json", "w") as write_file:
    json.dump(fullDict, write_file, indent=4)

with open('./datasets/carsDict.json') as json_file:
    data = json.load(json_file)

for dic in data:
    p_mydict = pickle.dumps(data[dic])
    r.set(dic,p_mydict)

def getData3(n):
    dataList = []
    tic = time.perf_counter()
    d = r.get(n)
    yourdict = pickle.loads(d)
    dataList.append(yourdict)
    toc = time.perf_counter()
    dataList.append(toc - tic)
    return dataList

def getAttributes():
    tic = time.perf_counter()
    unPrettyList = list(r.get('1'))
    toc = time.perf_counter()
    prettyList = []
    for s in unPrettyList:
        txt = str(s).split("'")
        prettyList.append(txt[1])
    time2 = toc - tic
    prettyList.append(time2)
    return prettyList

def getBySpecificAtt(n, s):
    tic = time.perf_counter()
    string = r.get(n,s)
    toc = time.perf_counter()
    time2 = toc - tic
    txt = str(string).split("'")
    
    dataList = []
    dataList.append(txt[1])
    dataList.append(time2)
    return dataList


# ---------------- THE ENDPOINTS --------------------
@app.route('/')
def start():
    #attributes = getAttributes()
    attributes = ['1', '2']
    return render_template('start.html', attributes=attributes[1:-1], time=attributes[-1])

@app.route('/data', methods=['GET', 'POST'])
def data():
    if request.method == 'POST':
        n = request.form['n']
        data = getData2(n)
          
        return render_template("data.html", data=data[int(n)], time=data[-1])
    
@app.route('/specificData', methods=['GET', 'POST'])
def specificData():
    if request.method == 'POST':
        n = request.form['n']
        s = request.form['s']
        data = getBySpecificAtt(n, s)
          
        return render_template("specificData.html", data=data[0], time=data[1])

@app.route('/redis', methods=['GET', 'POST'])
def predict():
    if request.method == 'GET':
        data = request.data
    return render_template('redis.html', carsDict=data)

if __name__ == '__main__':
    app.run(debug=True)
