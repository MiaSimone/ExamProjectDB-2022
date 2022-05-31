
from flask import Flask, request, jsonify, render_template
from redisSetup import *
from postgresSetup import *
from mongoDBSetup import *
from neo4jSetup import *

# ---------- Redis -------------
r = redisSimpleConnection()
def getCar(n):
    read_dict = r.get(n)
    car = pickle.loads(read_dict)
    return car

# ---------- Postgres -------------
def getUser(n):
    user = connect(n)
    return user

# ---------- Mongo -------------
def createBookingLast(connection_string, database_name, collection_name, uId, cId):
    mycol = mongoConnection(connection_string, database_name, collection_name)
    user = getUser(uId)
    car = getCar(cId)
    createBooking(mycol, user, car)

def findBookingsLast(connection_string, database_name, collection_name):
    mycol = mongoConnection(connection_string, database_name, collection_name)
    return findBookings(mycol)

# ---------- Neo4j -------------
def createAnalysisLast(connection_string, database_name, collection_name):
    mycol = mongoConnection(connection_string, database_name, collection_name)
    bolt_url = "bolt://localhost:7687"
    user = "neo4j"
    password = "1234"
    db = 'analysis'
    
    driver = connectNeo(bolt_url, user, password, db)
    createAnalysis(mycol, driver)
    close(driver)
    return 'done'
