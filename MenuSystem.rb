class Reciept ### Is a default class that just holds the current reciept
  attr_accessor :receipt, :itemTotal
  def initialize(receipt, itemTotal)
    @receipt = []
    @itemTotal = itemTotal
  end
end

$currentReciept = Reciept.new(0,0)
### I know it's a sin to use global variables
### but I didn't want to pass currentReciept thru 5+ modules


def Init ### Sets up the values

  puts
  puts
  puts

  itemPrice = ["1.00","1.50","1.00","0.50","2.00","2.50","1.50","2.00","0.50","0.10"]
  item = ["Fountain Drink", "Frozen Drink", "Candy Bars", "Chips", "Hamburger", "Cheeseburger", "Hot Dog", "Chili Dog", "Pop Corn","Pickle Juice Ice Cube"]

  menuItems = item.zip(itemPrice) ### Holds all the values of the menu, not including item number

  Display(menuItems)

end


def Display(menu) ### This is what puts the menu everytime, it also controls where you go when you make your choice

  choices = ["1","2","3","4","5","6","7","8","9","10"] ### This is all the things that the until loop will accept as valid

  puts
  menuitem = 1 ### This is the menu number of the item
  for i,j in menu
    print "#{menuitem}): #{i} $#{j} \n"
    menuitem += 1
  end
  print "0): Exit \n" ### zero is not incuded in the items, I can't remember why I did it, but removing it makes it not work

  puts
  item = ""
  until choices.include?(item) or item == "0" ### Looks for zero because it's not included in the choices
    print "Please put your choice: "
    item = gets.chomp
  end
  if item != "0" ### Looks for all but zero, becuase all the other choices do the same thing
    Picker(menu, item)
    Display(menu)
  else
    Ending()
  end


end

def Picker(menu, item) ### This is what makes the receipt
=begin
  This function is crazy, it took me a long time
  to figure out how to make this, but it works.

  It takes the values of var x and checks it agains the value
  of var item - 1, because arrays start at zero this has to be done
  If they are the same, it takes the value of j and i and puts
  them in the Class.

  I originally tried to use index's, but I couldn't get them to work
  so this was the next best thing I could think of.
=end

  x = 0
  for i,j in menu
    if x == item.to_i - 1
      $currentReciept.itemTotal += j.to_f
      $currentReciept.receipt.append(i)
    end
    x += 1
  end
end

def Ending() ### This just makes the receipt

  puts
  print ":SALES RECEIPT: \n"

  print "Your items are: \n"

  x = 1
  for i in $currentReciept.receipt ### Lists out items you ordered
     print "#{x}:) - #{i} \n"
     x += 1
  end

  print "Subtotal: $",  $currentReciept.itemTotal.round(2), " " , "\n" ### Total before tax
  print "Tax: $", $currentReciept.itemTotal * 0.06, "\n" ### Calculates sales tax
  print "Total: $", ($currentReciept.itemTotal.round(2) + ($currentReciept.itemTotal * 0.06)).round(2)
  ### Line 95 Adds the tax and the subtotal, they arn't variables, because it was faster to just type them out

end

loop do ### Just goes thru it forever
  Init()
end
