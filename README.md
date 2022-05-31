# ExamProjectDB-2022

Mia - md291
<br>
Jacob - js441

### The Video:
https://www.youtube.com/watch?v=NpnTAfAKaLE

### To Run the Program:
1. You will have to create a database in MongoDB named Exam Project and a collection called Bookings.
2. Next you need to create a database in postgres, and then run the Database_Script.sql found in the folder Postgresql.
3. Third you have to start your redis server.
4. At last you need to create a Neo4j database called analysis.
5. Now you can run the Redis.ipynb LAST line and use the program. (You do not have to run the entire file because the important part is saved in application.py)

### Motivation for the Databases:
We chose Postgres because we needed a database where we could store relational data, so that the users can have a role and an address related to them. No matter how big og small Postgres handles the data well. This is also a reason why we chose this, because we might have a lot of users in our database.
We chose MongoDB because it handles big data very well and we might get a lot of bookings. Also the bookings will not be deleted after they expire, which means MongoDB needs to handle bigger and bigger amounts of data. We do not delete the data because we will do some data analysis.
We chose Neo4j because we would like to make data analysis with the car bookings, and get them visualized, so it will be easier to see what car model is more rented then the others. One of the good things about Neo4j is that, the database is good to navigate with large dataset which will be needed when there will come more and more bookings 
We chose Redis because we needed a database which could make easy and fast transactions for our customers. We wanted to store the cars data in Redis, so that the GET methods would run much faster. We also wanted to log every transaction, with their method (GET, POST…) and status code, so that we could see if any transaction failed based on their status code, and where it failed. 

