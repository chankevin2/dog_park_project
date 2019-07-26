require 'rails_helper'

feature 'admin can delete park' do
  scenario 'admin successfully deletes park' do
    park3 = FactoryBot.create(:park, city: "Boston", state: "MA", zip: "01003", description: "Yankees suck")
    user = User.create(
      email: "qweqweqwe@gmail.com",
      password: "123456",
      role: "admin"
      )

    sign_in_as(user)

    visit "/parks/#{park3.id}/edit"
    click_link "Delete"

    expect(page).to have_content "Dog Park deleted successfully"
  end
end
