require 'rails_helper'

feature 'user can add reviews' do
  park1 = FactoryBot.create(:park)

  scenario 'user adds new review successfully' do
    visit new_park_review_path

    expect(page).to have_content "Add Review Form"
    expect(page).to have_link "Back to Homepage"

    fill_in 'Rating', with: "5"
    fill_in 'Review', with: "It's grrrrreat!"

    click_button "Add Review"

    expect(page).to have_content "Review added successfully"
    expect(page).to have_content "Rating: 5 || Description: It's grrrrreat!"
  end

  scenario "user does not fill out any fields" do
   visit new_park_review_path

   click_button "Add Review"
   expect(page).to have_content "Rating can't be blank"
   expect(page).to have_content "Rating must be a number of 0-5"
   expect(page).to have_content "Body can't be blank"
  end

  scenario "user does not provide a number value of 0-5 for the rating" do
   visit new_park_review_path

   fill_in 'Rating', with: "adfsasdf"
   fill_in 'Review', with: "It's grrrrreat!"


   click_button "Add Review"
   expect(page).to have_content "Rating must be a number of 0-5"
  end
end
