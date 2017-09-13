require 'minitest/autorun'
require 'minitest/pride'
require './lib/register'
require_relative '../lib/apples'
require_relative '../lib/chai'
require_relative '../lib/coffee'
require_relative '../lib/milk'
require_relative '../lib/basket'
require 'pry'

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
    register.checks_for_apple_discounts
    
    refute_equal true , register.basket.sheet[apple.product_code].key?(:APPL)
    
    register.basket.add_item_to_inventory(apple)
    register.checks_for_apple_discounts
    
    refute_equal true , register.basket.sheet[apple.product_code].key?(:APPL)
    
    register.basket.add_item_to_inventory(apple)
    register.checks_for_apple_discounts
    assert_equal true , register.basket.sheet[apple.product_code].key?(:APPL)
    assert_equal -1.50, register.basket.sheet[apple.product_code][:APPL]
  end

  def test_it_checks_for_chai_and_applies_milk_item
    register = Register.new
    chai = Chai.new

    register.basket.add_item_to_inventory(chai)
    register.checks_for_chai_discounts

    assert_equal ({"CH1"=>{:name=>"Chai", :price=>3.11, :quantity=>1}, "MK1"=>{:name=>"Milk", :price=>4.75, :quantity=>1, :CHMK=>-4.75}}), register.basket.sheet
  end

  def test_it_applies_chai_milk_discount_only_once
    register = Register.new
    chai = Chai.new

    register.basket.add_item_to_inventory(chai)
    register.checks_for_chai_discounts

    assert_equal ({"CH1"=>{:name=>"Chai", :price=>3.11, :quantity=>1}, "MK1"=>{:name=>"Milk", :price=>4.75, :quantity=>1, :CHMK=>-4.75}}), register.basket.sheet

    register.basket.add_item_to_inventory(chai)

    assert_equal ({"CH1"=>{:name=>"Chai", :price=>3.11, :quantity=>2}, "MK1"=>{:name=>"Milk", :price=>4.75, :quantity=>1, :CHMK=>-4.75}}), register.basket.sheet
  end

  def test_it_checks_and_applies_coffee_discounts
    register = Register.new
    coffee = Coffee.new

    register.basket.add_item_to_inventory(coffee)

    register.checks_for_coffee_discounts

    assert_equal ({"CF1"=>{:name=>"Coffee", :price=>11.23, :quantity=>2, :COFF=>-11.23}}), register.basket.sheet
  end

  def test_it_checks_for_all_discounts
    register = Register.new
    coffee = Coffee.new
    apple = Apples.new
    milk = Milk.new
    chai = Chai.new

    register.basket.add_item_to_inventory(apple)
    register.checks_for_discounts
    assert_equal ({"AP1"=>{:name=>"Apples", :price=>6.00, :quantity=>1}}), register.basket.sheet
    
    register.basket.add_item_to_inventory(apple)
    register.basket.add_item_to_inventory(apple)
    register.checks_for_discounts 
    assert_equal ({"AP1"=>{:name=>"Apples", :price=>6.00, :quantity=>3, :APPL=>-1.5}}), register.basket.sheet
    
    register.basket.add_item_to_inventory(coffee)
    register.basket.add_item_to_inventory(milk)
    register.basket.add_item_to_inventory(chai)
    register.checks_for_discounts
    assert_equal ({"AP1"=>{:name=>"Apples", :price=>6.0, :quantity=>3, :APPL=>-1.5}, "CF1"=>{:name=>"Coffee", :price=>11.23, :quantity=>2, :COFF=>-11.23}, "MK1"=>{:name=>"Milk", :price=>4.75, :quantity=>2, :CHMK=>-4.75}, "CH1"=>{:name=>"Chai", :price=>3.11, :quantity=>1}}), register.basket.sheet
    
  end


  def test_it_begins_with_a_0_total
    register = Register.new

    assert_equal 0, register.total
  end

  def test_it_adds_up_total_of_basket_case_1
    register = Register.new
    apple = Apples.new
    chai = Chai.new

    register.basket.add_item_to_inventory(apple)
    register.basket.add_item_to_inventory(chai)
    # binding.pry
    assert_equal 9.11, register.get_total
  end

  def test_it_applies_coffee_discount_to_total
    register = Register.new
    coffee = Coffee.new

    register.basket.add_item_to_inventory(coffee)
    register.checks_for_discounts

    assert_equal 11.23, register.apply_coffee_discount
    assert_equal ({"CF1"=>{:name=>"Coffee", :price=>11.23, :quantity=>2, :COFF=>-11.23}}), register.basket.sheet

    register.basket.add_item_to_inventory(coffee)
    register.checks_for_discounts

    assert_equal 22.46, register.apply_coffee_discount
    assert_equal ({"CF1"=>{:name=>"Coffee", :price=>11.23, :quantity=>4, :COFF=>-11.23}}), register.basket.sheet
  end

  def test_it_applies_chai_milk_discount_to_total
    register = Register.new
    chai = Chai.new

    register.basket.add_item_to_inventory(chai)
    register.checks_for_discounts
# binding.pry
    assert_equal 3.11, register.apply_chai_discount

    register.basket.add_item_to_inventory(chai)
    register.checks_for_discounts

    assert_equal 6.22, register.apply_chai_discount
  end

  def test_it_applies_apple_discount_to_total
    register = Register.new
    apple = Apples.new

    register.basket.add_item_to_inventory(apple)
    register.basket.add_item_to_inventory(apple)
    register.checks_for_discounts
    assert_equal 12.00, register.apply_apples_discount 
    
    register.basket.add_item_to_inventory(apple)
    register.checks_for_discounts
# binding.pry
    assert_equal 13.50, register.apply_apples_discount 
  end
  # def test_it_adds_up_total_of_basket_case_2
  #   register = Register.new
  #   apple = Apples.new
  #   chai = Chai.new
  #   milk = Milk.new
  #   coffee = Coffee.new

  #   register.basket.add_item_to_inventory(apple)
  #   register.basket.add_item_to_inventory(chai)
  #   register.basket.add_item_to_inventory(milk)
  #   register.basket.add_item_to_inventory(coffee)
  #   register.checks_for_discounts

  #   binding.pry
  #   assert_equal 20.59, register.get_total
  # end


end