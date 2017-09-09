class Basket
attr_reader :sheet,
            :item_count

  def initialize
    @sheet = Hash.new{0}
    @item_count = 0
  end

  def add_item_to_inventory(item, quantity)
    sheet[item.product_code] += quantity 
    
  end

  def add_up_count_of_items
    @item_count = sheet.values.inject(0){|quantity, x| quantity + x}
  end
end