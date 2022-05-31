
import redis
import json
import pickle

def redisSimpleConnection():
    r = redis.Redis(db=1)
    return r
    
def redisSetup(df):
    r = redisSimpleConnection()
    #r.flushdb()

    with open('./datasets/cars.json') as json_file:
        data = json.load(json_file)

    # Loop og give hver værdi en key som er deres kolonne navn
    columns = list(df)
    listOfDict = []

    def smallDictFunction(co, di):
        smallDicts = {}
        for c in co:
            for d in di:
                if (columns.index(c) == dic.index(d)):
                    smallDicts[c] = d

        return smallDicts


    for dic in data['data']:
        listOfDict.append(smallDictFunction(columns, dic))
        if (data['data'].index(dic)+1 == 200000):
            break    # break here

    index_list = [*range(1, (len(listOfDict)+1), 1)]
    len(index_list)


    zipped = zip(index_list, listOfDict)
    fullDict = dict(zipped)

    with open("./datasets/carsDict.json", "w") as write_file:
        json.dump(fullDict, write_file, indent=4)

    with open('./datasets/carsDict.json') as json_file:
        data = json.load(json_file)

    for dic in data:
        p_mydict = pickle.dumps(data[dic])
        r.set(dic,p_mydict)

    
