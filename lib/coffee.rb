class Coffee
attr_reader :price,
            :name,
            :product_code

  def initialize(price:, name:, product_code:)
    @price = 11.23
    @name = "Coffee"
    @product_code = "CF1"
  end
end