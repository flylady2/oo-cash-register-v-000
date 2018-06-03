require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items, :transaction_amount     #returns the current total

  def initialize(discount = 0)     #sets an instance variable @total on initialization to zero
    @total = 0
    @discount = discount
    @items = []       #sets @items to an empty array
  end



  def add_item(title, price, quantity = 1)      #accepts a title, price and optional quantity
    self.total = @total + (price * quantity)   #increases the total, doesn't forget about previous total
    quantity.times{@items << title}
    last_transaction_array = [title, price, quantity]
    @transaction_amount = price * quantity
    binding.pry       #adds the correct number of each item to the array
  end

  def apply_discount                                        #applies discount if initialized with discount
    if self.discount > 0                                    #if initialized with discount
      discount_percentage = 1.0 - (self.discount/100.0)     #calculates percentage of full price after discount (discount_percentae)
      @total = self.total * (discount_percentage)           #calculates total by multiplying full price by discount_percentage
      @total                                                #returns total
      return "After the discount, the total comes to $#{@total.to_i}."    #returns success message
    end
    if self.discount == 0                                   #if initialization occurs wtihout discount
      return "There is no discount to apply."               #returns error message
    end
  end

  def items
    @items
  end

  def void_last_transaction
    last_transaction = @items[-1]

  end

end
