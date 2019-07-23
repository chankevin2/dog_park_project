require 'rails_helper'

feature 'user can add reviews' do
  scenario 'user adds new review successfully' do
    park3 = FactoryBot.create(:park, city: "Boston", state: "MA", zip: "01003", description: "Yankees suck")
    user = User.create(
      email: "f@gmail.com",
      password: "123456",
      role: "member"
      )

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit "/parks/#{park3.id}/reviews/new"

    expect(page).to have_content "Add Review Form"
    expect(page).to have_link "Back to Homepage"

    fill_in 'Rating', with: "5"
    fill_in 'Review', with: "It's grrrrreat!"

    click_button "Add Review"

    expect(page).to have_content "Review added successfully"
  end

  scenario "user does not fill out any fields" do
   park3 = FactoryBot.create(:park, city: "Boston", state: "MA", zip: "01003", description: "Yankees suck")
   user = User.create(
     email: "af@gmail.com",
     password: "123456",
     role: "member"
     )

   visit new_user_session_path
   fill_in 'Email', with: user.email
   fill_in 'Password', with: user.password
   click_button 'Log in'

   visit "/parks/#{park3.id}/reviews/new"

   click_button "Add Review"
   expect(page).to have_content "Rating can't be blank"
   expect(page).to have_content "Rating must be a number of 1-5"
   expect(page).to have_content "Body can't be blank"
  end

  scenario "user does not provide a number value of 1-5 for the rating" do
   park3 = FactoryBot.create(:park, city: "Boston", state: "MA", zip: "01003", description: "Yankees suck")
   user = User.create(
     email: "sf@gmail.com",
     password: "123456",
     role: "member"
     )

   visit new_user_session_path
   fill_in 'Email', with: user.email
   fill_in 'Password', with: user.password
   click_button 'Log in'

   visit "/parks/#{park3.id}/reviews/new"

   fill_in 'Rating', with: "adfsasdf"
   fill_in 'Review', with: "It's grrrrreat!"


   click_button "Add Review"
   expect(page).to have_content "Rating must be a number of 1-5"
  end
end
