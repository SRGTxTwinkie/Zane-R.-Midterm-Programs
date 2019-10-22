def Init

  print "Please put the number you wanna do the tables for: "
  num = gets.chomp
  if num.to_i.to_s == num
    Display(num)
  else
    print "Please put a number"
  end
end

def Display(number)

  for i in 1..100
    print "#{i} * #{number} = "
    print i * 5
    print "\n"
  end
end

Init()
