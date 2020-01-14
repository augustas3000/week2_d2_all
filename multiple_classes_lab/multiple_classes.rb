
# Create a Bus class:
class Bus
  # getters for inst variables
  attr_reader :route, :destination
  # The Bus should have a route number (e.g. 22) and a destination (e.g. “Ocean Terminal”)
  def initialize(route_number_int, destination_str)
    @route = route_number_int
    @destination = destination_str
    # Give the Bus class a new property, ‘passengers’. This should be an array, which starts off empty.

    # never use attr_accessors... on arrays
    @passengers = []
  end

  # The Bus should have a drive method that returns a string (e.g. “Brum brum”).
  def drive
    return "Brum brum"
  end

  # Add a method to the Bus class which takes in a Person and adds it to the array of passengers. The method could look something like bus.pick_up(passenger1)

  def add_passenger(person_obj)
    @passengers.push(person_obj)
  end

  # Add a method that drops off a passenger and removes them from the array. This could look like bus.drop_off(passenger2)
  def drop_off_passenger(person_obj)
    @passengers.delete(person_obj)
  end

  # Add a method to the Bus class which returns how many passengers are on the bus.
  def how_many_on_bus
    return @passengers.length
  end

  # Add an ‘empty’ method to remove all of the passengers - this might be used when the bus reaches its destination, or if the bus breaks down. It should remove all of the passengers from the array.

  def empty
    @passengers = []
  end

  # Now imagine that our bus is travelling along the route. For now we will imagine that there is only one bus that goes on this route, so every passenger waiting at each stop wants to get on the bus.
  #
  # Try writing a method that the bus would call, to collect all of the passengers from a stop. This might look like bus.pick_up_from_stop(stop1). This should take all of the passengers waiting in line at the stop, and put them inside of the bus. So the stop will now have nobody in the queue, and the number of people on the bus will increase by however many people the stop had at it.

  def pick_up_from_stop(bus_stop_obj)

    for person_obj in bus_stop_obj.get_queue()
      add_passenger(person_obj)
    end

    bus_stop_obj.bus_stop_empty

  end

end


# Create a Person class.
class Person
  # getters for inst variables
  attr_reader :name, :age
  # The Person class should have attributes of a name and age:
  def initialize(name_str, age_int)
    @name = name_str
    @age = age_int
  end

end

# Create a new class called BusStop.
class BusStop

  # This should have a name attribute.
  def initialize(name_str)
    @name = name_str

      # Add an attribute to the BusStop called ‘queue’. This should be an empty array that will get filled with instances of the Person class:
    @queue = []
  end

  def bus_stop_empty
    @queue = []
  end

  def get_queue
    return @queue
  end


  def how_many_in_queue
    return @queue.length
  end

  # Add a method that adds a person to the queue
  def add_person_to_queue(person_obj)
    @queue.push(person_obj)
  end
end

# bus_obj = Bus.new(22, "Ocean Terminal")
# bus_stop_obj = BusStop.new("Victoria Station")
#
# person_obj = Person.new("Lee", 28)
# person_obj_2 = Person.new("Dan", 48)
# person_obj_3 = Person.new("Judy", 18)
#
# bus_stop_obj.add_person_to_queue(person_obj)
# bus_stop_obj.add_person_to_queue(person_obj_2)
# bus_stop_obj.add_person_to_queue(person_obj_3)
#
#
# bus_obj.pick_up_from_stop(bus_stop_obj)
# puts bus_obj.how_many_on_bus
