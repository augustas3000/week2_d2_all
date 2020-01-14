require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../Pet.rb")
require_relative("../Customer.rb")



class CustomerTest < MiniTest::Test

  def setup
    @new_pet_obj = Pet.new("Blue", :cat, "British Shorthair", 500)
    @customer_obj = Customer.new("Jack Jarvis", 1000)
  end

  def test_customer_has_name()
    assert("Jack Jarvis", @customer_obj.name)
  end

  def test_customer_has_cash
    assert_equal(1000, @customer_obj.cash)
  end

  def test_customer_pets_start_empty
    assert_equal(0, @customer_obj.pet_count)
  end

  def test_add_pet_to_cutomer
    @customer_obj.add_pet(@new_pet_obj)
    assert_equal(1, @customer_obj.pet_count)
  end

  def test_can_get_total_pet_cost
    @customer_obj.add_pet(@new_pet_obj)
    @customer_obj.add_pet(@new_pet_obj)
    @customer_obj.add_pet(@new_pet_obj)
    assert_equal(1500, @customer_obj.get_total_value_of_pets())
  end

end
