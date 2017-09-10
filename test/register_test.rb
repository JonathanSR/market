require 'minitest/autorun'
require 'minitest/pride'
require './lib/register'
require 'pry'
require_relative '../lib/apples'
require_relative '../lib/chai'
require_relative '../lib/coffee'
require_relative '../lib/milk'
require_relative '../lib/basket'

class RegisterTest < Minitest::Test 
  def test_it_creates_an_instance_of_register
    register = Register.new

    assert_instance_of Register, register 
  end

  def test_it_initializes_with_a_basket
    register = Register.new

    assert_instance_of Basket, register.basket
  end

  def test_it_adds_discount_if_apples_are_greater_than_or_equal_to_three
    register = Register.new
    apple = Apples.new

    register.basket.add_item_to_inventory(apple)
    register.checks_for_discounts
    
    refute_equal true , register.basket.sheet[apple.product_code].key?(:APPL)
    
    register.basket.add_item_to_inventory(apple)
    register.checks_for_discounts
    
    refute_equal true , register.basket.sheet[apple.product_code].key?(:APPL)
    
    register.basket.add_item_to_inventory(apple)
    # binding.pry
    register.checks_for_discounts
    assert_equal true , register.basket.sheet[apple.product_code].key?(:APPL)
    assert_equal -1.50, register.basket.sheet[apple.product_code][:APPL]
  end


end