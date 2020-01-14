class Customer

  attr_reader :name, :cash

  def initialize(name, cash)
    @name = name
    @cash = cash

    @pets = []
  end

  def pet_count
    return @pets.length
  end

  def add_pet(pet_object)
    @pets.push(pet_object)
  end

  def get_total_value_of_pets()
    total = 0
    for pet_obj in @pets
      total += pet_obj.price
    end
    return total
  end

  def add_or_remove_cash(value_int)
    @cash += value_int
  end
# Objects from classes can be seen as customised data-structures,
# similiarly to a hash for example, just much more user friendly because the yare customiseable.
end
