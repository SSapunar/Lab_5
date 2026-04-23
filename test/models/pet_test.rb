require "test_helper"

class PetTest < ActiveSupport::TestCase
  def setup
    @owner = Owner.create!(first_name: "Juan", last_name: "Perez", email: "owner@test.com", phone: "123")
  end

  test "valid pet saves" do
    pet = Pet.new(name: "Firulais", species: "dog", date_of_birth: Date.today, weight: 10, owner: @owner)
    assert pet.save
  end

  test "invalid without name" do
    pet = Pet.new(species: "dog", date_of_birth: Date.today, weight: 10, owner: @owner)
    assert_not pet.save
  end

  test "invalid species" do
    pet = Pet.new(name: "Firulais", species: "dragon", date_of_birth: Date.today, weight: 10, owner: @owner)
    assert_not pet.save
  end

  test "weight must be greater than 0" do
    pet = Pet.new(name: "Firulais", species: "dog", date_of_birth: Date.today, weight: 0, owner: @owner)
    assert_not pet.save
  end
end