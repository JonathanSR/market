require 'minitest/autorun'
require 'minitest/pride'
require './lib/milk'
require 'pry'

class MilkTest < Minitest::Test 
  def test_it_creates_an_instance_of_milk
    milk = Milk.new({price: @price, name: @name, product_code: @product_code})

    assert_instance_of Milk, milk
  end

  def test_it_is_initialized_with_a_price
    milk = Milk.new({price: @price, name: @name, product_code: @product_code })

    assert_equal 4.75, milk.price
  end

  def test_it_is_initialized_with_a_name
    milk = Milk.new({price: @price, name: @name, product_code: @product_code })
    
    assert_equal "Milk", milk.name
  end

  def test_it_is_initialized_with_a_product_code
    milk = Milk.new({price: @price, name: @name, product_code: @product_code })

    assert_equal "MK1", milk.product_code 
  end

end