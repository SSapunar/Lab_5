require "test_helper"

class VetTest < ActiveSupport::TestCase
  test "valid vet saves" do
    vet = Vet.new(first_name: "Ana", last_name: "Lopez", email: "vet@test.com", phone: "123", specialization: "General")
    assert vet.save
  end

  test "invalid without email" do
    vet = Vet.new(first_name: "Ana", last_name: "Lopez", phone: "123", specialization: "General")
    assert_not vet.save
  end

  test "email must be unique" do
    Vet.create!(first_name: "A", last_name: "B", email: "vet@test.com", phone: "123", specialization: "General")
    vet2 = Vet.new(first_name: "C", last_name: "D", email: "vet@test.com", phone: "456", specialization: "Surgery")
    assert_not vet2.save
  end
end