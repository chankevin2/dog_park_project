require 'rails_helper'

feature 'admin can delete park' do
  scenario 'admin successfully deletes park' do
    park3 = FactoryBot.create(:park, city: "Boston", state: "MA", zip: "01003", description: "Yankees suck")
    user = User.create(
      email: "qweqweqwe@gmail.com",
      password: "123456",
      role: "admin"
      )

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit "/parks/#{park3.id}/edit"
    click_link "Delete"

    expect(page).to have_content "Dog Park deleted successfully"
  end
end
