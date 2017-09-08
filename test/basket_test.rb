require 'minitest/autorun'
require 'minitest/pride'
require './lib/basket'
require 'pry'

class BasketTest < Minitest::Test 
  def test_it_creates_an_instance_of_basket
    basket = Basket.new

    assert_instance_of Basket, basket
  end

  def test_the_basket_is_a_hash
    basket = Basket.new

    assert_equal Hash, basket.sheet.class
  end
end