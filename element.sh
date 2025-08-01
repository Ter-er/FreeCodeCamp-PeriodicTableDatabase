# Periodic Table Information Script
#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only --no-align -c"

if [[ -z "$1" ]]
then 
  echo "Please provide an element as an arguement."
else

  # Queries database using both tables: elements and properties
  ELEMENT_INFO=$($PSQL "SELECT elements.atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties ON elements.atomic_number = properties.atomic_number;")

  # Reads database values into variables line by line
  while IFS='|' read ATOMIC_NO NAME SYMBOL TYPE MASS MELTING_P BOILING_P 
  do
    if [[ "$1" == "$ATOMIC_NO" ||  "$1" == "$SYMBOL" || "$1" == "$NAME" ]] # Checks if the first argument is valid and prints the information for the chosen element
    then
      echo "The element with atomic number $ATOMIC_NO is $NAME ("$SYMBOL"). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_P celsius and a boiling point of $BOILING_P celsius." 
      FOUND=1
      break
    fi
  done <<< "$ELEMENT_INFO"


  if [[ -z $FOUND ]] # If the first argument is not valid
  then
    echo I could not find that element in the database.
  fi
fi
