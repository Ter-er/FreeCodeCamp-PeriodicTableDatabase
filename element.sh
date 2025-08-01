# Periodic Table Information Script
#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only --no-align -c"

echo -e "\nPlease provide an element as an arguement.\n"


ELEMENT_INFO=$($PSQL "SELECT elements.atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties ON elements.atomic_number = properties.atomic_number;")

while IFS='|' read ATOMIC_NO NAME SYMBOL TYPE MASS MELTING_P BOILING_P 
do
  if [[ "$1" == "$ATOMIC_NO" ||  "$1" == "$SYMBOL" || "$1" == "$NAME" ]]
  then
    echo "The element with atomic number $ATOMIC_NO is $NAME ("$SYMBOL"). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_P celsius and a boiling point of $BOILING_P celsius." 
    FOUND=1
    break
  fi
done <<< "$ELEMENT_INFO"


if [[ -z $FOUND ]]
then
  echo I could not find that element in the database.
fi

