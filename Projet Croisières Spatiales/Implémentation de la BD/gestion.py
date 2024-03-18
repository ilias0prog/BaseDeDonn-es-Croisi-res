#Application that interect with our database

#Import the requiered libraries
from mysql.connector import (connection)
import random
#Create a connection to the database
cnx = connection.MySQLConnection(user='admin', password='password',
                                 host='127.0.0.1',
                                 database='northwind',
                                 port='3306')

#Creating the cursor to interact with the database
cursor = cnx.cursor()

#Main selector of the API
print('1. Inscription to the database \n 2. Access to personnal data \n 3. Modify data \n 4. Being delete from the database \n 5. Make a reservation \n 6.Sell report \n 7.Other')
Branch_choice=input('Enter the branch you want to access: ')

if Branch_choice == '1':
  #Inscription to the database
    try:
        #collecting Data 
        NCLI = str (random.randint(10000000, 99999999))
        Email = input('Enter your email: ')
        firs_name = input('Enter your first name: ')
        Species = input('Enter your species: ')
        Phone_number = input('Enter your phone number: ')

        #Request to the database
        cursor.execute("INSERT INTO Client (NclI, Mail,Nom, Espece, Tel) VALUES (%s, %s, %s, %s, %s)", (NCLI, Email, firs_name, Species, Phone_number))
        cnx.commit()
        print('You have been added to the database. Your client number is: %s' % (NCLI))
    
    except:
      print('An error occured when collecting your data please retry')
elif Branch_choice == '2':
    #Access to personnal data

    #Collecting NCLI
    NCLI=input('Enter your client number: ')
    try: 

        #Request to the database
        cursor.execute("SELECT * FROM Client WHERE NCLI = %s", (NCLI,))
        Client_data = cursor.fetchall()
        cursor.execute("SELECT count(*) FROM Reservation WHERE Ncli = %s", (NCLI,))
        number_of_reservation = cursor.fetchall()

        #Showing the result
        print('Here are your personnal information\n')
        print('NCLI: %s\n Email: %s\nFirst name: %s\nSpecies: %s\nPhone number: %s \nYou have %d reservation(s)' % (Client_data[0][0],Client_data[0][1],Client_data[0][2],Client_data[0][3],Client_data[0][4], number_of_reservation[0][0]))
    
    except:
        print('Client not found')
elif Branch_choice == '3':
    #Modify data
    pass
elif Branch_choice == '4':
    #Being delete from the database
    pass
elif Branch_choice == '5':
    #Make a reservation
    pass
elif Branch_choice == '6':
    #Sell report
    pass
elif Branch_choice == '7':
    #Other
    pass

#Close the connection
cnx.close()