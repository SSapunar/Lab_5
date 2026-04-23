require "test_helper"

class OwnerTest < ActiveSupport::TestCase
  test "valid owner saves" do
    owner = Owner.new(first_name: "Juan", last_name: "Perez", email: "juan@test.com", phone: "123")
    assert owner.save
  end

  test "invalid without email" do
    owner = Owner.new(first_name: "Juan", last_name: "Perez", phone: "123")
    assert_not owner.save
  end

  test "email must be unique" do
    Owner.create!(first_name: "A", last_name: "B", email: "test@test.com", phone: "123")
    owner2 = Owner.new(first_name: "C", last_name: "D", email: "test@test.com", phone: "456")
    assert_not owner2.save
  end
end