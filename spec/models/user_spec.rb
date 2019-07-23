require 'rails_helper'

describe "#admin?" do
  it "is not an admin if the role is not admin" do
    user = User.create(
      email: "fsf@gmail.com",
      password: "123456",
      role: "member"
      )
    expect(user.admin?).to eq(false)
  end

  it "is an admin if the role is admin" do
    user = User.create(
      email: "1sf@gmail.com",
      password: "123456",
      role: "admin"
      )
    expect(user.admin?).to eq(true)
  end
end
