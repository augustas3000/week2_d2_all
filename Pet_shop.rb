class PetShop

  attr_reader :name, :total_cash, :pets_sold

  def initialize(name_str, pets_array, total_cash_int)
    @name = name_str
    @pets = pets_array
    @total_cash = total_cash_int
    # at the start shop object will have made 0 sales:
    @pets_sold = 0

  end

  def stock_count
    return @pets.size
  end

  def increase_pets_sold
    @pets_sold += 1
  end

  def increase_total_cash(amount_int)
    @total_cash += amount_int
  end

  def add_pet(pet_obj)
    @pets.push(pet_obj)
  end

  def remove_pet(pet_obj)
    @pets.delete(pet_obj)
  end

  def find_pet_by_name(pet_name)
    for pet_obj in @pets
      if pet_obj.name == pet_name
        return pet_obj
      end
    end
    return nil
  end

  def sell_pet_to_customer(pet_name_str, customer_obj)

    pet_obj = find_pet_by_name(pet_name_str)

    customer_obj.add_pet(pet_obj)
    remove_pet(pet_obj)
    increase_pets_sold()
    increase_total_cash(pet_obj.price)
    customer_obj.add_or_remove_cash(-pet_obj.price)
  end

end
