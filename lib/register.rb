class Register
  attr_reader :basket,
              :total

  def initialize
    @basket = Basket.new
    @total = 0 
  end

  def checks_for_apple_discounts
    if basket.sheet.key?("AP1") && basket.sheet["AP1"][:quantity] >= 3
       basket.sheet["AP1"].merge!(APPL: -1.50)
    else
    end
  end

  def checks_for_chai_discounts
    if basket.sheet.key?("CH1") && basket.sheet["CH1"][:quantity] == 1
      basket.add_item_to_inventory(Milk.new)
      basket.sheet["MK1"].merge!(CHMK: -4.75)
    else
    end
  end

  def checks_for_coffee_discounts
    if basket.sheet.key?("CF1")
      basket.add_item_to_inventory(Coffee.new)
      basket.sheet["CF1"].merge!(COFF: -11.23)
    else
    end
  end


  def checks_for_discounts
    checks_for_apple_discounts
    checks_for_chai_discounts
    checks_for_coffee_discounts
  end

  def get_total
    first = basket.sheet.values.map {|s| [s[:price], s[:quantity]]}
    second = first.map{|s| s.inject(:*)}
    @total = second.inject(0){|sum, x| sum + x}
  end

  def apply_coffee_discount
    if basket.sheet.key?("CF1") && basket.sheet["CF1"].key?(:COFF)
      first = (basket.sheet["CF1"][:price] * basket.sheet["CF1"][:quantity]) + ((basket.sheet["CF1"][:quantity] /2 ) * basket.sheet["CF1"][:COFF])
      @total = first
    else
      @total = basket.sheet["CF1"][:price] * register.basket.sheet["CF1"][:quantity]
    end
  end


  def apply_chai_discount
    if basket.sheet.key?("CH1") && basket.sheet["MK1"].key?(:CHMK)
      chai = basket.sheet["CH1"][:price] * basket.sheet["CH1"][:quantity]
      milk = (basket.sheet["MK1"][:price] * basket.sheet["MK1"][:quantity] + basket.sheet["MK1"][:CHMK])
      @total = chai + milk
    else
      @total = basket.sheet["CH1"][:price] * register.basket.sheet["CH1"][:quantity]    
    end
  end

  def apply_apples_discount
    if basket.sheet.key?("AP1") && basket.sheet["AP1"].key?(:APPL)
      original_price = basket.sheet["AP1"][:price] * basket.sheet["AP1"][:quantity]
      discount_amount  = basket.sheet["AP1"][:APPL] * basket.sheet["AP1"][:quantity]
      @total = original_price + discount_amount
    else
      @total = basket.sheet["AP1"][:price] * basket.sheet["AP1"][:quantity]
    end
  end  
end


#adds up total for basket
#adds up total for basket including promos