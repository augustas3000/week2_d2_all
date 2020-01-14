require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../Pet')
require_relative('../Pet_shop')
require_relative('../Customer.rb')

class PetShopTest < MiniTest::Test

  def setup()

    @pet1_obj = Pet.new("Sir Percy", :cat, "British Shorthair", 500)
    @pet2_obj = Pet.new("King Arthur", :dog, "Husky", 900)

    @pets = [@pet1_obj, @pet2_obj]

    @pet_shop_obj = PetShop.new("Camelot of Pets", @pets, 1000 )

  end

  def test_pet_shop_has_name()
    assert_equal("Camelot of Pets", @pet_shop_obj.name)
  end

  def test_pet_shop_cash()
    assert_equal(1000, @pet_shop_obj.total_cash)
  end

  def test_pet_shop_pets_sold_starts_at_0()
    assert_equal(0, @pet_shop_obj.pets_sold)
  end

  def test_pet_shop_stock_count()
    assert_equal(2, @pet_shop_obj.stock_count())
  end

  def test_increase_pets_sold()
    @pet_shop_obj.increase_pets_sold()
    assert_equal(1, @pet_shop_obj.pets_sold)
  end

  def test_can_increase_total_cash()
    @pet_shop_obj.increase_total_cash(500)
    assert_equal(1500, @pet_shop_obj.total_cash)
  end

  def test_can_add_pet_to_stock()
    @pet_shop_obj.add_pet(@pet1_obj)
    assert_equal(3, @pet_shop_obj.stock_count())
  end

  def test_can_remove_pet_from_stock()
    @pet_shop_obj.remove_pet(@pet1_obj)
    assert_equal(1, @pet_shop_obj.stock_count())
  end

  def test_can_find_name
    pet = @pet_shop_obj.find_pet_by_name("Sir Percy")
    assert_equal("Sir Percy", pet.name)
  end

  def test_can_sell_to_customer
    # create object specific for testing in this function:
    customer_obj = Customer.new("Jack Jarvis", 1000)
    # call mutator method on test object:
    @pet_shop_obj.sell_pet_to_customer("Sir Percy", customer_obj)

    # assertions:
    # customer obj pet count increases by one:
    assert_equal(1, customer_obj.pet_count)
    # customer object cash decreases by 500
    assert_equal(500, customer_obj.cash)
    # pet shop object stock reduces by one
    assert_equal(1, @pet_shop_obj.stock_count)
    # pet shop obj pets sold variabel increases by 1
    assert_equal(1, @pet_shop_obj.pets_sold)
    # pet shop obj total cash increases by 500:
    assert_equal(1500, @pet_shop_obj.total_cash)

  end

  

end
