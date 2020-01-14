require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../multiple_classes.rb')


class BusTest < Minitest::Test

  def setup
    @bus_obj = Bus.new(22, "Ocean Terminal")
    @person_obj = Person.new("Lee", 28)
    @person_obj_2 = Person.new("Dan", 48)
    @person_obj_3 = Person.new("Judy", 18)


  end

  def test_getters
    # getting route inst variable from bus object:
    assert_equal(22, @bus_obj.route)
    # getting destination inst variable from bus object:
    assert_equal("Ocean Terminal", @bus_obj.destination)
  end

  def test_drive
    assert_equal("Brum brum", @bus_obj.drive)
  end

  def test_add_passenger()
    @bus_obj.add_passenger(@person_obj)
    assert_equal(1, @bus_obj.how_many_on_bus)
  end

  def test_drop_off_passenger()
    # lets add some passengers first. 3 added.
    @bus_obj.add_passenger(@person_obj)
    @bus_obj.add_passenger(@person_obj_2)
    @bus_obj.add_passenger(@person_obj_3)
    #now lets drop off one:
    @bus_obj.drop_off_passenger(@person_obj)
    # if we remove anyone using drop_off_passenger method, resulting number should be 2 passengers.
    assert_equal(2, @bus_obj.how_many_on_bus)

  end

  def test_how_many_on_bus
    @bus_obj.add_passenger(@person_obj)
    @bus_obj.add_passenger(@person_obj_2)
    @bus_obj.add_passenger(@person_obj_3)
    assert_equal(3, @bus_obj.how_many_on_bus)
  end

  def test_empty
    # lets add some passengers first. 3 added.
    @bus_obj.add_passenger(@person_obj)
    @bus_obj.add_passenger(@person_obj_2)
    @bus_obj.add_passenger(@person_obj_3)
    # empty the bus object
    @bus_obj.empty
    # we expect 0 passengers to be on the bus after
    # calling empty on bus obj.
    assert_equal(0, @bus_obj.how_many_on_bus)

  end

end

class PersonTest < Minitest::Test
  def setup
    @person_obj = Person.new("Lee", 28)
  end

  def test_getters
    # getting name inst variable from person object:
    assert_equal("Lee", @person_obj.name )
    # getting age inst variable from person object:
    assert_equal(28, @person_obj.age)
  end

end
