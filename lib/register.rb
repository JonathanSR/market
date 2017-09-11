class Register
  attr_reader :basket

  def initialize
    @basket = Basket.new
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
      basket.sheet["MK1"].merge!(CHMK: -4.50)
    else
    end
  end

  def checks_for_coffee_discount
    if basket.sheet.key?("CF1")
      basket.sheet["CF1"].merge!(COFF: -11.23)
    else
    end
  end

    #checks if basket has coffee
      #adds a coffee for every coffee originally added

end