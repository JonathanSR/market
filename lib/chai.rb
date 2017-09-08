class Chai
attr_reader :price,
            :name,
            :product_code

  def initialize(price:, name:, product_code:)
    @price = 3.11
    @name = "Chai"
    @product_code = "CH1"
  end
end