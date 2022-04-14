# NESTED IF STATEMENTS
# integer=4

# if [[ $integer -lt 10 ]]
#   then 
#     echo $integer is less than 10.
#     if [[ $integer -lt 5 ]]
#       then
#         echo $integer is also less than 5
#     fi
# fi

# TWO CONDITIONAL BRANCHES

integer=9

if [[ $integer -lt 10 ]]
then 
  echo $integer is less than 10
else
  echo $integer is not less than 10
fi