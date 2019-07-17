require 'rails_helper'

feature 'user can add parks' do

  scenario 'user adds new park successfully' do
    visit new_park_path

    expect(page).to have_content "New Park Form"
    expect(page).to have_link "Back to Homepage"

    fill_in 'Name', with: "Pizza Park"
    fill_in 'Address', with: "930 S 9th St"
    fill_in 'City', with: "Miami"
    fill_in 'State', with: "Florida"
    fill_in 'Zip', with: "19147"
    fill_in 'Description', with: "Run by the one and only Florida Man"

    click_button "Add Dog Park"

    expect(page).to have_content "Dog Park saved successfully"
    expect(page).to have_content "Pizza Park"
    expect(page).to have_content "930 S 9th St"
  end

  scenario "user does not provide proper information for a park" do
   visit new_park_path

   click_button "Add Dog Park"
   expect(page).to have_content "Name can't be blank"
   expect(page).to have_content "Address can't be blank"
   expect(page).to have_content "City can't be blank"
   expect(page).to have_content "State can't be blank"
   expect(page).to have_content "Zip can't be blank"
   expect(page).to have_content "Description can't be blank"
 end
end
