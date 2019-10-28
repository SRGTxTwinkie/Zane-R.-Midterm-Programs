def Init
  num = 0
  until num != 0
    print "Please put the bill amount: "
    num = gets.to_i
    if num == 0
      print "Your bill amount can't be zero \n"
      print "C'mon son \n"
    end
  end
  Display(num)

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
