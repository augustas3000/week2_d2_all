require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../multiple_classes.rb')


class BusTest < Minitest::Test

  def setup
    @bus_obj = Bus.new(22, "Ocean Terminal")
    @bus_stop_obj = BusStop.new("Victoria Station")

    @person_obj = Person.new("Lee", 28)
    @person_obj_2 = Person.new("Dan", 48)
    @person_obj_3 = Person.new("Judy", 18)

    # add persons to que here to avoid repetition later on?

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

  def test_pick_up_from_stop
    # def setup contents:
    # @bus_obj = Bus.new(22, "Ocean Terminal")
    # @bus_stop_obj = BusStop.new("Victoria Station")
    #
    # @person_obj = Person.new("Lee", 28)
    # @person_obj_2 = Person.new("Dan", 48)
    # @person_obj_3 = Person.new("Judy", 18)

    # add persons objects to queue inst variable of bus stop object:
    @bus_stop_obj.add_person_to_queue(@person_obj)
    @bus_stop_obj.add_person_to_queue(@person_obj_2)
    @bus_stop_obj.add_person_to_queue(@person_obj_3)

    # three people are now in the que, lets call pickup_from_stop on bus object, and put in bus stop obj as an argument
    @bus_obj.pick_up_from_stop(@bus_stop_obj)
    # initially empty bus obj passengers array, now should have 3 passengers:
    assert_equal(3, @bus_obj.how_many_on_bus)
    # bus stop obj should now have 0 passengers in the queu
    assert_equal(0, @bus_stop_obj.how_many_in_queue)


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

class BusStopTest < Minitest::Test
  def setup
    @bus_stop_obj = BusStop.new("Victoria Station")
    @person_obj = Person.new("Lee", 28)
  end

  def test_add_person_to_queue
    @bus_stop_obj.add_person_to_queue(@person_obj)
    assert_equal(1, @bus_stop_obj.how_many_in_queue)
  end

end
