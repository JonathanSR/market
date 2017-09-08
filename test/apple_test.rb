require 'minitest/autorun'
require 'minitest/pride'
require './lib/apples'
require 'pry'

class ApplesTest < Minitest::Test 
  def test_it_creates_an_instance_of_apples
    apple = Apple.new({price: @price, name: @name, product_code: @product_code})

    assert_instance_of Apple, apple
  end

  def test_it_is_initialized_with_a_price
    apple = Apple.new({price: @price, name: @name, product_code: @product_code })

    assert_equal 6.00, apple.price
  end

  def test_it_is_initialized_with_a_name
    apple = Apple.new({price: @price, name: @name, product_code: @product_code })
    
    assert_equal "Apples", apple.name
  end

  def test_it_is_initialized_with_a_product_code
    apple = Apple.new({price: @price, name: @name, product_code: @product_code })

    assert_equal "AP1", apple.product_code 
  end
end