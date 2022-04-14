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
# integer=9

# if [[ $integer -lt 10 ]]
# then 
#   echo $integer is less than 10
# else
#   echo $integer is not less than 10
# fi

# THREE CONDITIONAL BRANCHES
# integer=25
# if [[ $integer -lt 10 ]]
# then
#   echo $integer is less than 10
# elif [[ $integer -gt 20 ]]
# then
#   echo $integer is greater than 20
# else
#   echo $integer is between 10 and 20
# fi

# MATCHING TWO CONDITIONS
integer=15

if [[ $integer -gt 10 ]] && [[ $integer -lt 20 ]]
then
  echo $integer is between 10 and 20
fi