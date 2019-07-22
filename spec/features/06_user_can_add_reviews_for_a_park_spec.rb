require 'rails_helper'

feature 'user can add reviews' do
  park1 = FactoryBot.create(:park)

  scenario "user is not logged in" do
   visit "/parks/#{park1.id}/reviews/new"

   fill_in 'Rating', with: "adfsasdf"
   fill_in 'Review', with: "It's grrrrreat!"


   click_button "Add Review"
   expect(page).to have_content "User can't be blank"
   expect(page).to have_content "User must exist"
  end

  scenario 'user adds new review successfully' do
    user = FactoryBot.create(:user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit "/parks/#{park1.id}/reviews/new"

    expect(page).to have_content "Add Review Form"
    expect(page).to have_link "Back to Homepage"

    fill_in 'Rating', with: "5"
    fill_in 'Review', with: "It's grrrrreat!"

    click_button "Add Review"
    expect(page).to have_content "Review added successfully"
  end

  scenario "user does not fill out any fields" do
   visit "/parks/#{park1.id}/reviews/new"

   click_button "Add Review"
   expect(page).to have_content "Rating can't be blank"
   expect(page).to have_content "Rating must be a number of 1-5"
   expect(page).to have_content "Body can't be blank"
  end

  scenario "user does not provide a number value of 1-5 for the rating" do
   visit "/parks/#{park1.id}/reviews/new"

   fill_in 'Rating', with: "adfsasdf"
   fill_in 'Review', with: "It's grrrrreat!"


   click_button "Add Review"
   expect(page).to have_content "Rating must be a number of 1-5"
  end
end
