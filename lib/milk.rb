class Milk
attr_reader :price,
            :name,
            :product_code

  def initialize(price:, name:, product_code:)
    @price = 4.75
    @name = "Milk"
    @product_code = "MK1"
  end

end