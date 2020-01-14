
# Create a Bus class:
class Bus
  # getters for inst variables
  attr_reader :route, :destination
  # The Bus should have a route number (e.g. 22) and a destination (e.g. “Ocean Terminal”)
  def initialize(route_number_int, destination_str)
    @route = route_number_int
    @destination = destination_str
    # Give the Bus class a new property, ‘passengers’. This should be an array, which starts off empty.
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
