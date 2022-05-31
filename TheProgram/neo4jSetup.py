
import logging
import sys

from neo4j import GraphDatabase
from neo4j.exceptions import ServiceUnavailable


def close(driver):
    driver.close()

def connectNeo(uri, user, password, db):
    driver = GraphDatabase.driver(uri, auth=(user, password), database=db)
    return driver

def create_relationsship_books(tx, user_id, 
                      firstName, 
                      lastName,
                      age,
                      email,
                      address,
                      zipcode,
                      city,
                      year,
                      mileage,
                      cityC,
                      state,
                      vin,
                      make,
                      model, books):
    query = (
            "MERGE (u:User { user_id: $user_id, firstName: $firstName, lastName: $lastName, age: $age, email: $email, address: $address, zipcode: $zipcode, city: $city}) "
            "MERGE (c:Car { year: $year, mileage: $mileage, cityC: $cityC, state: $state, vin: $vin, make: $make, model: $model }) "
            "MERGE (u)-[k:BOOKS { from: $books }]->(c) "
            "RETURN u, c, k"
        )
    result = tx.run(query, user_id=user_id, firstName=firstName, lastName=lastName, age=age, email=email, 
                    address=address, zipcode=zipcode, city=city, year=year, mileage=mileage, cityC=cityC, state=state,
                    vin=vin, make=make, model=model, books=books)
    try:
        return [{
                    "u": row["u"]["user_id"],
                    "c": row["c"]["year"],
                    "books": row["k"]["books"]
                }
                for row in result]
    # Capture any errors along with the query and data for traceability
    except ServiceUnavailable as exception:
        logging.error("{query} raised an error: \n {exception}".format(
            query=query, exception=exception))
        raise

def createNodes(driver, user_id, 
                      firstName, 
                      lastName,
                      age,
                      email,
                      address,
                      zipcode,
                      city,
                      year,
                      mileage,
                      cityC,
                      state,
                      vin,
                      make,
                      model, books):
    with driver.session() as session:
        session.write_transaction(create_relationsship_books, user_id, 
                      firstName, 
                      lastName,
                      age,
                      email,
                      address,
                      zipcode,
                      city,
                      year,
                      mileage,
                      cityC,
                      state,
                      vin,
                      make,
                      model, books)

def createAnalysis(mycol, driver):
    infoList = []
    for x in mycol.find():
        for key, values in x.items():
            if (key == 'user'):
                for k, v in values.items():
                    infoList.append(v)
                infoList.pop()
                infoList.pop()
                for k, v in values['address'].items():
                    infoList.append(v)
                del infoList[5]
            if (key == 'car'):
                for k, v in values.items():
                    infoList.append(v)

        createNodes(driver, infoList[0], infoList[1], infoList[2], infoList[3], infoList[4], infoList[5], 
                                infoList[6], infoList[7], infoList[8], infoList[9], infoList[10], infoList[11], 
                                infoList[12], infoList[13], infoList[14], 'books')

        infoList = []
