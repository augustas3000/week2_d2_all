# We are going to build a small ecosystem! We want to create an ecosystem made up of 3 parts: bears, river and fish. You will need a class for each of these. From this you can make instances and build your ecosystem.

# A river should have a name e.g. “Amazon”
# A river should hold many fish
# A fish should have a name
#
# A bear should have a name e.g. “Yogi” and a type e.g. “Grizzly”
# A bear should have an empty stomach ( maybe an array )
#
# A bear should be able to take a fish from the river
# A river should lose a fish when a bear takes a fish


class River

  def initialize(name_str)
    # A river should have a name e.g. “Amazon”:
    @name = name_str
    # A river should hold many fish:
    @fish = []
  end

  def add_fish(array_of_fish_objects)
    @fish += array_of_fish_objects
  end

  # A river could have a fish_count method:
  def count_fish
    return @fish.length
  end

  def get_fish_array
    return @fish
  end

end

class Bear

  def initialize(name_str, type_sym)
    # A bear should have a name e.g. “Yogi” and a type e.g. “Grizzly”
    @name = name_str
    @type = type_sym
    # A bear should have an empty stomach ( maybe an array )
    @hunger_stomach = []
  end

  # additional..
  def hungry?
    bears_hunger = ""

    if @hunger_stomach.length <= 3
      bears_hunger = "Hungry"
    elsif @hunger_stomach.length <= 5
      bears_hunger = "OK for now"
    else
      bears_hunger = "Full"
    end

    return bears_hunger
  end



  # A bear should be able to take a (ONE?) fish from the river
  def take_fish(river_obj)

    if self.hungry? == "Hungry"
      # A river should lose a fish when a bear takes a fish (pop off last fish object in the array of @fish in river object):
      taken_fish = river_obj.get_fish_array.pop
      # and the poped off fish obj goes to bears stomach(array)
      @hunger_stomach.push(taken_fish)
    else
      return "This bear is not hungry now..."
    end
    
  end


  # A bear could have a roar method:
  def roar
    return "WHHHROAAAAAR!!!!"
  end

  # A bear could have a food_count method
  def food_count
    return @hunger_stomach.length()
  end


end


class Fish

  def initialize(fish_name_str)
    @fish_name = fish_name_str
  end

end
