require 'minitest/autorun'
require 'minitest/pride'
require './lib/chai'
require 'pry'

class ChaiTest < Minitest::Test 
  def test_it_creates_an_instance_of_chai
    chai = Chai.new({price: @price, name: @name, product_code: @product_code})

    assert_instance_of Chai, chai
  end

  def test_it_is_initialized_with_a_price
    chai = Chai.new({price: @price, name: @name, product_code: @product_code })

    assert_equal 3.11, chai.price
  end

  def test_it_is_initialized_with_a_name
    chai = Chai.new({price: @price, name: @name, product_code: @product_code })
    
    assert_equal "Chai", chai.name
  end

  def test_it_is_initialized_with_a_product_code
    chai = Chai.new({price: @price, name: @name, product_code: @product_code })

    assert_equal "CH1", chai.product_code 
  end
end