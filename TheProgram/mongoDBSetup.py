

import pymongo
import pickle
import time


def mongoConnection(connection_string, database_name, collection_name):
    myclient = pymongo.MongoClient(connection_string)

    #use database named "organisation"
    mydb = myclient[database_name]

    #use collection named "developers"
    mycol = mydb[collection_name]

    return mycol

def getDataFromMongo(r, n):
    dataList = []
    tic = time.perf_counter()
    d = r.get(n)
    yourdict = pickle.loads(d)
    dataList.append(yourdict)
    toc = time.perf_counter()
    dataList.append(toc - tic)
    return dataList

def createBooking(mycol, user, car):
    booking = {}
    booking['user'] = user
    booking['car'] = car
    
    mycol.insert_one(booking)

def findBookings(mycol):
    bookingList = []
    for x in mycol.find():
        bookingList.append(x)
    print(bookingList)
    return bookingList
