def Init

  Display()

end

def Display()

  uScore = 0
  compScore = 0
  hort = ""
  until uScore == 5 || compScore == 5
    until hort.upcase == "H" or hort.upcase == "T"
      print "Please put heads or tails: \n"
      print "[H/T]: "
      hort = gets.chomp
    end

    if Play(hort) == 1
      uScore += 1
    else
      compScore += 1
    end

    print "Your score: #{uScore} \n"
    print "Comp Score: #{compScore} \n"

    hort = ""
  end

  End(uScore)

end

def End(uScore)

  if uScore == 5
    print "You win!"
  else
    print "Sorry, Technology wins this one"
  end

end

def Play(hort)

  x = rand(1..2)

  x == 1 ? (puts "The coin flipped was Heads") : (puts "The coin flipped was Tails")

  if x == 1 and hort.upcase == "H"
    return 1
  elsif x == 0 and hort.upcase == "T"
    return 1
  else
    return 0
  end

end

Init()
