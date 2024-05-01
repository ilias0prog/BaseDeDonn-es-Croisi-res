#Application that interect with our database

#Import the requiered libraries
from mysql.connector import (connection)
import random
import datetime

#Create a connection to the database
cnx = connection.MySQLConnection(user='admin', password='password',
                                 host='127.0.0.1',
                                 database='cruise',
                                 port='3306')

#Creating the cursor to interact with the database
cursor = cnx.cursor()
Branch_choice='x'
print('Welcome to the cruise management system')
while(Branch_choice!='8'):
    #Main selector of the API
    print('----------------------------------------')
    print('1. Inscription to the database \n2. Access to personnal data \n3. Modify data \n4. Being delete from the database \n5. Make a reservation \n6. Sell report \n7. All cruise and their stopovers \n8. Exit')
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
            cursor.execute("INSERT INTO Client (Ncli, Mail,Nom, Espece, Tel) VALUES (%s, %s, %s, %s, %s)", (NCLI, Email, firs_name, Species, Phone_number))
            cnx.commit()

            #Showing the result
            print('You have been added to the database. Your client number is: %s' % (NCLI))
        
        except:
            print('An error occured when collecting your data please retry')

    elif Branch_choice == '2':
        #Access to personnal data

        #Collecting NCLI
        NCLI=input('Enter your client number: ')
        try: 

            #Request to the database
            cursor.execute('SELECT * FROM Client WHERE NCLI = %s'% (NCLI,))
            Client_data = cursor.fetchall()
            cursor.execute('SELECT count(*) FROM Reservation WHERE Ncli = %s'% (NCLI))
            number_of_reservation = cursor.fetchall()

            #Showing the result
            print('----------------------------------------')
            print('Here are your personnal information\n')
            print('Ncli: %s\nEmail: %s\nFirst name: %s\nSpecies: %s\nPhone number: %s \nYou have %d reservation(s)' % (Client_data[0][0],Client_data[0][1],Client_data[0][2],Client_data[0][3],Client_data[0][4], number_of_reservation[0][0]))
        
        except:
            print('Client not found')

    elif Branch_choice == '3':
        #Modify data
        
        #Collecting user data
        NCLI=input('Enter your client number: ')
        Email = input('Enter your new email: ')
        firs_name = input('Enter your new first name: ')
        Species = input('Enter your new species: ')
        Phone_number = input('Enter your new phone number: ')
        
        
        try:
            cursor.execute('UPDATE Client  SET Mail=%s,Nom=%s, Espece=%s, Tel=%s WHERE Ncli=%s'% (Email, firs_name, Species, Phone_number,NCLI))
            cnx.commit()
            print('Your data has been updated')
        
        except:
            print('Client not found')


    elif Branch_choice == '4':
        #Being delete from the database
    
        #Collecting NCLI
        NCLI=input('Enter your client number: ')
        
        #Request to the database
        try:
            cursor.execute('UPDATE Client Set Mail= null ,Nom= null, Espece= null, Tel= null  WHERE Ncli = %s'% (NCLI))
            cnx.commit()
            print('You have been deleted from the database')
        except:
            print('Client not found')
     

    elif Branch_choice == '5':
        #Make a reservation
        
        #Collecting NCLI
        try:
            NCLI=input('Enter your client number: ')
        except:
            print('Client not found')

        #Request to the data base 
        query= """
                    SELECT Titre, Date_debut, Date_fin, Planete_depart, Planete_arrivee, Code, Capacite, Classe, Dispo, Prix_nuit 
                    FROM Croisiere, Vaisseaux, Cabine_spatiale 
                    WHERE Croisiere.Num_vai = Vaisseaux.Num_vai 
                    AND Cabine_spatiale.Num_vai = Vaisseaux.Num_vai 
                    AND Cabine_spatiale.Dispo = 0 
                    AND Cabine_spatiale.Espece = (
                        SELECT Espece 
                        FROM Client 
                        WHERE Ncli = %s
                    )"""
        cursor.execute(query %(NCLI))
        Cabine_data = cursor.fetchall()
        #Collecting user choice
        for cabine in Cabine_data:
         print ('Title: %s\n Start date: %s\n End date: %s\n Departure planet: %s\n Arrival planet: %s\n Code: %s\n Capacity: %s\n Class: %s\n Price per night: %s\n' % (cabine[0],cabine[1],cabine[2],cabine[3],cabine[4],cabine[5],cabine[6],cabine[7],cabine[9]))   
        Code_cabine = input('Enter the code of the cabin you want to reserve: ')
        
        #Request to the data base
        cursor.execute('SELECT * FROM Activite')
        activite_data = cursor.fetchall()
        
        #Collecting user choice
        for activite in activite_data:
            print ('Activity: %s\n Duration: %s\n Price: %s\n' % (activite[0],activite[1],activite[2]))
        name_activite = input('Enter the name of the activity you want to reserve: ')
         
        #collecting user choise
        print('Choose your payement methode: \n 1.Credit card \n 2.Stardust \n 3.Crypto')
        payement = input('Enter your choice: ')
        if payement == '1':
            payement = 'CarteBancaire'
        elif payement == '2':
            payement = 'Stardust'
        elif payement == '3':
            payement = 'Crypto'
        
        #Creating the reservation number
        Num_res='RES'+ str(random.randint(100, 999))
        
        #Making the commande
        cursor.execute('INSERT INTO Reservation VALUES (%s, %s, %s, %s, %s, %s, %s)', (Num_res, payement, 'Confirmee', datetime.date.today(), NCLI, Code_cabine, name_activite))
        cnx.commit()
    elif Branch_choice == '6':
        #Sell report
        
        #Making the Year report 
        Year=input('Enter the year you want to see the report: ')
        cursor.execute('SELECT Reservation.Num_res, Reservation.Date, Activite.Prix FROM Activite, Reservation WHERE Reservation.Nom_acti = Activite.Nom AND YEAR(Reservation.Date) = %s'% (Year))
        activity_price_data = cursor.fetchall()
        cursor.execute('SELECT Reservation.Num_res, Reservation.Date, (DATEDIFF(Date_fin,Date_debut)*Cabine_spatiale.Prix_nuit) AS Total FROM Vaisseaux,cruise.Croisiere,Reservation, Cabine_spatiale WHERE Cabine_spatiale.Num_vai=Vaisseaux.Num_vai AND Vaisseaux.Num_vai=Croisiere.Num_vai AND Reservation.Code_cabine = Cabine_spatiale.Code AND YEAR(Reservation.Date) = %s' % (Year))
        cabine_price_data=cursor.fetchall()
        print('INCOME REPORT FOR THE YEAR %s' % (Year))
        print('Activity income: %d' % (sum([activity[2] for activity in activity_price_data])))
        print('Cabin income: %d' % (sum([cabin[2] for cabin in cabine_price_data])))
        print ('Total income: %d' % (sum([activity[2] for activity in activity_price_data])+sum([cabin[2] for cabin in cabine_price_data])))

        #Making the month report for the year
        for month in range(1,13):
            cursor.execute('SELECT Reservation.Num_res, Reservation.Date, Activite.Prix FROM Activite, Reservation WHERE Reservation.Nom_acti = Activite.Nom AND YEAR(Reservation.Date) = %s AND MONTH(Reservation.Date) = %s'% (Year, month))
            activity_price_data = cursor.fetchall()
            cursor.execute('SELECT Reservation.Num_res, Reservation.Date, (DATEDIFF(Date_fin,Date_debut)*Cabine_spatiale.Prix_nuit) AS Total FROM Vaisseaux,cruise.Croisiere,Reservation, Cabine_spatiale WHERE Cabine_spatiale.Num_vai=Vaisseaux.Num_vai AND Vaisseaux.Num_vai=Croisiere.Num_vai AND Reservation.Code_cabine = Cabine_spatiale.Code AND YEAR(Reservation.Date) = %s AND MONTH(Reservation.Date) = %s' % (Year, month))
            cabine_price_data=cursor.fetchall()
            print('INCOME REPORT FOR THE YEAR %s AND THE MONTH %s' % (Year, month))
            print('Activity income: %d' % (sum([activity[2] for activity in activity_price_data])))
            print('Cabin income: %d' % (sum([cabin[2] for cabin in cabine_price_data])))
            print('Total income: %d' % (sum([activity[2] for activity in activity_price_data])+sum([cabin[2] for cabin in cabine_price_data])))
            if(month!=1):
             cursor.execute('SELECT Reservation.Num_res, Reservation.Date, Activite.Prix FROM Activite, Reservation WHERE Reservation.Nom_acti = Activite.Nom AND YEAR(Reservation.Date) = %s AND MONTH(Reservation.Date) = %s'% (Year, month-1))
             previous_activity_price_data = cursor.fetchall()
             cursor.execute('SELECT Reservation.Num_res, Reservation.Date, (DATEDIFF(Date_fin,Date_debut)*Cabine_spatiale.Prix_nuit) AS Total FROM Vaisseaux,cruise.Croisiere,Reservation, Cabine_spatiale WHERE Cabine_spatiale.Num_vai=Vaisseaux.Num_vai AND Vaisseaux.Num_vai=Croisiere.Num_vai AND Reservation.Code_cabine = Cabine_spatiale.Code AND YEAR(Reservation.Date) = %s AND MONTH(Reservation.Date) = %s' % (Year, month-1))
             previous_cabine_price_data=cursor.fetchall()
             last_month_income = sum([activity[2] for activity in previous_activity_price_data])+sum([cabin[2] for cabin in previous_cabine_price_data])
             print('Difference with the previous month: %d' % (sum([activity[2] for activity in activity_price_data])+sum([cabin[2] for cabin in cabine_price_data])-last_month_income))     
    elif Branch_choice == '7':
       #Showing all the cruse and their stopovers
         cursor.execute('SELECT * FROM CEP')
         CEP_data = cursor.fetchall()
         print('Here are all the croisieres and their stopovers')       
         for cep in CEP_data:
          print('----------------------------------------')
          print ('Cruise:%s\nStarting Date:%s\nEnding Date:%s\nStarting planet:%s\nEnding planet:%s\nStopover(s):%s\nChief Name:%s\nPilote Name:%s\n' % (cep[0],cep[1],cep[2],cep[3],cep[4],cep[5],cep[6],cep[8]))
#Close the connection
cursor.close()
cnx.close()