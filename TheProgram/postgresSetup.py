

from configparser import ConfigParser
import psycopg2

def config(filename='../Postgresql/postgresDB.ini', section='postgresql'):
    # create a parser
    parser = ConfigParser()
    # read config file
    parser.read(filename)

    # get section, default to postgresql
    db = {}
    if parser.has_section(section):
        params = parser.items(section)
        for param in params:
            db[param[0]] = param[1]
    else:
        raise Exception('Section {0} not found in the {1} file'.format(section, filename))

    return db


def createDict(infoTuple, columnList, index):
    infoList = []
    for i in infoTuple:
        infoList.append(i)
        if (infoTuple.index(i) == index):
            break;
    return(dict(zip(columnList, infoList)))

fullUserDict= {}

def retrieveUserInfo(uId, cur):
    #Retrieving data
    cur.execute('SELECT * from users where user_id = '+str(uId))
    user = cur.fetchone()
    cur.execute('SELECT role from roles where role_id = '+str(user[6]))
    role = cur.fetchone()
    # Saving the user as a dict
    userTableColumns = ['user_id', 'firstName', 'lastName', 'age', 'email']
    userDict = createDict(user, userTableColumns, 4)
    userDict["role"] = role[0]
    
    return userDict

def retrieveAddressInfo(uId, cur):
    cur.execute('SELECT address_id from users where user_id = '+str(uId))
    address_id = cur.fetchone()
    cur.execute('SELECT * from address where address_id = '+str(address_id[0]))
    address = cur.fetchone()
    zipcode = address[2]
    cur.execute('SELECT * from cities where zipcode = '+str(zipcode))
    city = cur.fetchone()
    addressList = list(address)
    addressList.append(city[1])
    
    addressTableColumns = ['address_id', 'address', 'zipcode', 'city']
    addressDict = createDict(addressList, addressTableColumns, 3)

    return addressDict

def connect(uId):
    """ Connect to the PostgreSQL database server """
    conn = None
    try:
        # read connection parameters
        params = config()

        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(**params)
		
        # create a cursor
        cur = conn.cursor()
        
	# execute a statement
        addressDict = retrieveAddressInfo(uId, cur)

        fullUserDict = retrieveUserInfo(uId, cur)
        fullUserDict['address'] = addressDict
        
       
	# close the communication with the PostgreSQL
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.')
            #print(fullUserDict)
            return fullUserDict
            


if __name__ == '__main__':
    connect()

