class Apples
attr_reader :price,
            :name,
            :product_code

  def initialize(price:, name:, product_code:)
    @price = 6.00
    @name = "Apples"
    @product_code = "AP1"
  end
end