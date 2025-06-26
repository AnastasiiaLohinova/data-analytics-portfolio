#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "\nWelcome to My Salon, how can I help you?"
#show the list of service 
SELECTION_MENU() {
  if [[ $1 ]]
  then 
  echo -e "\n$1"
  fi
SERVICE=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")
echo "$SERVICE" | while read SERV_ID BAR SERV_NAME
do
echo "$SERV_ID) $SERV_NAME"
done
read SERVICE_ID_SELECTED
SELECTION_ID=$($PSQL "SELECT service_id, name FROM services WHERE service_id=$SERVICE_ID_SELECTED;")
# if no service_id
if [[ -z $SELECTION_ID ]]
then
# send to selection menu 
SELECTION_MENU "I could not find that service. What would you like today?"
else
# ask phone number
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE
# get customer name
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")
CUSTOMER_NAME=$(echo "$CUSTOMER_NAME" | sed -E 's/^ *| *$//g')
# if customer doesn't exist
if [[ -z $CUSTOMER_NAME ]]
then
# det new customer name
echo -e "\nI don't have a record for that phone number, what's your name?"
read CUSTOMER_NAME
# insert new customer 
INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
fi
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
echo "$SERVICE_NAME" | while read SERV_NAME_SEL
do
echo -e "\nWhat time would you like your $SERV_NAME_SEL, $CUSTOMER_NAME?"
done
read SERVICE_TIME
#get customer_id
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
# insert time
INSERT_TIME=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
echo "$SERVICE_NAME" | while read SERV_NAME_SEL
do
echo -e "\nI have put you down for a $SERV_NAME_SEL at $SERVICE_TIME, $CUSTOMER_NAME."
done
fi
}
SELECTION_MENU