require 'pry'

class CashRegister
  attr_accessor :total, :discount, :last_transaction


  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @all_items = []
  end

  def add_item(title, price, quantity = 1)
    @total = total + (price * quantity)
    quantity.times do
      @all_items << title
    end
    @last_transaction = price * quantity
  end

  def apply_discount
    if discount > 0.to_f
      @total = total - (total * discount/100.to_f)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @all_items
  end

  def void_last_transaction
    @total = total - last_transaction
  end

end
