def Init

  print "Please put the bill amount: "
  num = gets.chomp
  if num.to_i.to_s == num
    num = num.to_i
    Display(num)
  else
    print "Please put a number"
  end
end

def Display(number)

  amounts = [0.15, 0.20, 0.25]
  amounts2 = ['15%', '20%', '25%']
  amount = amounts.zip(amounts2)

  print "Tip amounts: \n"
  for i,j in amount
    print j, ": " ,number * i , " \n"
  end
end

Init()
