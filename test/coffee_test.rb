require 'minitest/autorun'
require 'minitest/pride'
require './lib/coffee'
require 'pry'

class CoffeeTest < Minitest::Test 
  def test_it_creates_an_instance_of_coffee
    coffee = Coffee.new({price: @price, name: @name, product_code: @product_code})

    assert_instance_of Coffee, coffee
  end

  def test_it_is_initialized_with_a_price
    coffee = Coffee.new({price: @price, name: @name, product_code: @product_code })

    assert_equal 11.23, coffee.price
  end

  def test_it_is_initialized_with_a_name
    coffee = Coffee.new({price: @price, name: @name, product_code: @product_code })
    
    assert_equal "Coffee", coffee.name
  end

  def test_it_is_initialized_with_a_product_code
    coffee = Coffee.new({price: @price, name: @name, product_code: @product_code })

    assert_equal "CF1", coffee.product_code 
  end
end
