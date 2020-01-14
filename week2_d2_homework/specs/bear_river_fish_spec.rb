require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bears_river_fish.rb')


class RiverTest < Minitest::Test

  def setup
    @river_obj = River.new("Amazon")
  end



end
# -------------------------------------------------------------
class BearTest < Minitest::Test

  def setup
    # create brea object:
    @bear_obj = Bear.new("Yogi", :grizzly)
    # create a river object:
    @river_obj = River.new("Amazon")
    # create some fish objects and put these into array_of_fish_objects:
    @fish_obj_1 = Fish.new("Pike")
    @fish_obj_2 = Fish.new("Pike")
    @fish_obj_3 = Fish.new("Pike")
    @fish_obj_4 = Fish.new("Pike")
    @fish_obj_5 = Fish.new("Pike")
    @fish_obj_6 = Fish.new("Pike")

    @array_of_fish_objects = [
      @fish_obj_1,@fish_obj_2,
      @fish_obj_3,@fish_obj_4,
      @fish_obj_5,@fish_obj_6
    ]

    # lets put all the 6 fish into river (var @fish of river_obj):
    @river_obj.add_fish(@array_of_fish_objects)
  end

  def test_take_fish()
    # A bear takes 1 fish from the river:
    @bear_obj.take_fish(@river_obj)
    # River should loose a fish, and bear's stomach gain a fish
    assert_equal(5, @river_obj.count_fish)
    assert_equal(1, @bear_obj.food_count)

  end

  def test_take_fish_if_not_hungry
    # feed the bear first:
    @bear_obj.take_fish(@river_obj)
    @bear_obj.take_fish(@river_obj)
    @bear_obj.take_fish(@river_obj)
    @bear_obj.take_fish(@river_obj)

    # if we try and make it eat more...
    assert_equal("This bear is not hungry now...", @bear_obj.take_fish(@river_obj))

  end

  def test_roar
    assert_equal("WHHHROAAAAAR!!!!", @bear_obj.roar)
  end

  def test_food_count
    @bear_obj.take_fish(@river_obj)
    # now that a bear has eaten 1 fish obj, it should have that it stomach array:
    assert_equal(1, @bear_obj.food_count)
  end
 # additional...
  def test_hungry?
    # feed the bear first:
    @bear_obj.take_fish(@river_obj)
    @bear_obj.take_fish(@river_obj)
    @bear_obj.take_fish(@river_obj)

    assert_equal("Hungry", @bear_obj.hungry?)
  end

end
# -------------------------------------------------------------

class FishTest < Minitest::Test

  def setup
    @fish_obj_1 = Fish.new("Pike")
  end

end
