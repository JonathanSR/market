class Register
  attr_reader :basket

  def initialize
    @basket = Basket.new
  end

  def checks_for_discounts
    if @basket.sheet.key?("AP1") && basket.sheet["AP1"][:quantity] >= 3
       @basket.sheet["AP1"].merge!(APPL: -1.50)
    else
    end
  end
    #checks if basket has more than 3 apples
      #applies discount to apples
    #checks if basket has chai
      #adds a milk item to the basket
    #checks if basket has coffee
      #adds a coffee for every coffee originally added

end