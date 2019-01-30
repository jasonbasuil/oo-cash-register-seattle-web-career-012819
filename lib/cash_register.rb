require "pry"

class CashRegister

  attr_reader :total, :discount, :items, :last_amount

  def initialize(discount=nil)
    @total = 0.00
    @discount = discount
    @items = []
  end

  def total=(total)
    @total = total
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    quantity.times do @items << title
    end
    @last_amount = @total

  end

  def apply_discount
    if @discount
      @discount = @discount/100.00
      @total = @total - (@discount * @total)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - @last_amount
  end

end
