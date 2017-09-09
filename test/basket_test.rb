require 'minitest/autorun'
require 'minitest/pride'
require './lib/basket'
require_relative '../lib/apples'
require_relative '../lib/chai'
require_relative '../lib/coffee'
require_relative '../lib/milk'

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

  def test_the_basket_is_empty
    basket = Basket.new

    assert basket.sheet.empty?
  end

  def test_it_adds_an_item_to_the_basket
    apples = Apples.new
    basket = Basket.new

    basket.add_item_to_inventory(apples)

    assert_equal 1, basket.sheet.count
    assert_equal ({"AP1"=>{:name=>"Apples", :price=>6.0, :quantity=>1}}), basket.sheet
  end

  def test_it_adds_multiple_items_to_the_basket
    apples = Apples.new
    chai = Chai.new
    milk = Milk.new
    basket = Basket.new

    basket.add_item_to_inventory(apples)
    basket.add_item_to_inventory(chai)
    basket.add_item_to_inventory(milk)
    basket.add_item_to_inventory(apples)
    
    # binding.pry
    basket.add_up_count_of_items

    assert_equal 4, basket.item_count
    assert_equal ({"AP1"=>{:name=>"Apples", :price=>6.0, :quantity=>2}, "CH1"=>{:name=>"Chai", :price=>3.11, :quantity=>1}, "MK1"=>{:name=>"Milk", :price=>4.75, :quantity=>1}}), basket.sheet
  end
end