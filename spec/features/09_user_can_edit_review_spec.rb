require 'rails_helper'

feature 'user can edit review' do
  scenario 'user should see fields filled with current review information' do
    park3 = FactoryBot.create(:park, city: "Boston", state: "MA", zip: "01003", description: "Yankees suck")
    user = User.create(
      email: "qweqweqwe@gmail.com",
      password: "123456",
      role: "admin"
      )
    review1 = Review.create(
      rating: 5,
      body: "My boy is wicked smaht.",
      park_id: park3.id,
      user_id: user.id
    )

    sign_in_as(user)

    visit "/parks/#{park3.id}/reviews/#{review1.id}/edit"

    expect(find_field('Rating').value).to eq "#{review1.rating}"
    expect(find_field('Review').value).to eq review1.body

    expect(page).to have_button "Edit Review"
    expect(page).to have_link "Back to #{park3.name}"
  end

  scenario "user changes review rating and body successfully" do
    park3 = FactoryBot.create(:park, city: "Boston", state: "MA", zip: "01003", description: "Yankees suck")
    user = User.create(
      email: "qweqweqwe@gmail.com",
      password: "123456",
      role: "admin"
      )
    review1 = Review.create(
      rating: 5,
      body: "My boy is wicked smaht.",
      park_id: park3.id,
      user_id: user.id
    )

   sign_in_as(user)

   visit "/parks/#{park3.id}/reviews/#{review1.id}/edit"

   fill_in 'Rating', with: "3"
   fill_in 'Review', with: "I'm walkin' here!"
   click_button "Edit Review"

   expect(page).to have_content "Review edited successfully"
  end

  scenario "user tries to submit blank fields in the edit" do
    park3 = FactoryBot.create(:park, city: "Boston", state: "MA", zip: "01003", description: "Yankees suck")
    user = User.create(
      email: "qweqweqwe@gmail.com",
      password: "123456",
      role: "admin"
      )
    review1 = Review.create(
      rating: 5,
      body: "My boy is wicked smaht.",
      park_id: park3.id,
      user_id: user.id
    )

   sign_in_as(user)

   visit "/parks/#{park3.id}/reviews/#{review1.id}/edit"

   fill_in 'Rating', with: ""
   fill_in 'Review', with: ""
   click_button "Edit Review"

   expect(page).to have_content "Rating can't be blank"
   expect(page).to have_content "Rating must be a number of 1-5"
   expect(page).to have_content "Review can't be blank"
  end
end
