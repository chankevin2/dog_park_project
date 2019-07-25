require 'rails_helper'

feature 'admin can edit park' do
  scenario 'admin should see fields filled with current park information' do
    park3 = FactoryBot.create(:park, city: "Boston", state: "MA", zip: "01003", description: "Yankees suck")
    user = User.create(
      email: "qweqweqwe@gmail.com",
      password: "123456",
      role: "admin"
      )

    sign_in_as(user)

    visit "/parks/#{park3.id}/edit"

    expect(find_field('Name').value).to eq park3.name
    expect(find_field('Street Address').value).to eq park3.address
    expect(find_field('City').value).to eq park3.city
    expect(find_field('State').value).to eq park3.state
    expect(find_field('Zip').value).to eq park3.zip
    expect(find_field('Description').value).to eq park3.description

    expect(page).to have_button "Edit Park"
    expect(page).to have_button "Delete"
    expect(page).to have_button "Back to Park"
  end

  scenario "admin changes name and address of park successfully" do
   park3 = FactoryBot.create(:park, city: "Boston", state: "MA", zip: "01003", description: "Yankees suck")
   user = User.create(
     email: "qwe@gmail.com",
     password: "123456",
     role: "admin"
     )

   sign_in_as(user)

   visit "/parks/#{park3.id}/edit"

   fill_in 'Name', with: "Dallas"
   fill_in 'Address', with: "666 Fire Drive"
   click_button "Edit Park"

   expect(page).to have_content "Dog Park edited successfully"
  end

  scenario "admin tries to submit blank fields in the edit" do
   park3 = FactoryBot.create(:park, city: "Boston", state: "MA", zip: "01003", description: "Yankees suck")
   user = User.create(
     email: "qwe@gmail.com",
     password: "123456",
     role: "admin"
     )

   sign_in_as(user)

   visit "/parks/#{park3.id}/edit"

   fill_in 'Name', with: ""
   fill_in 'Address', with: ""
   click_button 'Edit Park'

   expect(page).to have_content "Name can't be blank"
   expect(page).to have_content "Address can't be blank"
  end
end
