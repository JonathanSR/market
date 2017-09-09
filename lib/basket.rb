class Basket
attr_reader :sheet,
            :item_count, 
            :total_price

  def initialize
    @sheet = Hash.new{0}
    @item_count = 0
    @total_price = 0
  end

  def add_item_to_inventory(item)
    if sheet.key?(item.product_code)
      sheet[item.product_code][:quantity] += 1
    else
      sheet[item.product_code] = {name: item.name, price: item.price, quantity: 1}
    end
  end

  def add_up_items
    @item_count = sheet.values.map {|s| s[:quantity]}.reduce(0, :+)
  end

  def get_total_price
    @total_price = sheet.values.map {|s| s[:price]}.reduce(0, :+)
  end
end