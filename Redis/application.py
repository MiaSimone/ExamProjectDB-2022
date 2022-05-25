
from flask import Flask, request, jsonify, render_template
from functions import *
from threading import Timer

app = Flask(__name__, template_folder='hmtl_documents')

connection_string = "mongodb://localhost:27017/"
database_name = "ExamProject"
collection_name = "Bookings"

@app.route('/')
def bookingEndpoint():
    return render_template('booking.html')

@app.route('/booked', methods=['GET', 'POST'])
def booked():
    if request.method == 'POST':
        uId = request.form['uId']
        cId = request.form['cId']
        
        createBookingLast(connection_string, database_name, collection_name, uId, cId)
          
        return render_template("booked.html", data=[uId, cId])

@app.route('/admin')
def admin():
    bookings = findBookingsLast(connection_string, database_name, collection_name)
    
    return render_template('admin.html', bookings=bookings)

@app.route('/adminAnalysis', methods=['GET', 'POST'])
def adminAnalysis():
    if request.method == 'POST':
        createAnalysisLast(connection_string, database_name, collection_name)
        
        return render_template("adminAnalysis.html")
    
if __name__ == '__main__':
    app.run(debug=True)
