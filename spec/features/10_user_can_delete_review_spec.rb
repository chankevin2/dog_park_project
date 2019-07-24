require 'rails_helper'

feature 'user can delete review' do
  scenario 'user successfully deletes review' do
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
    click_button "Delete"

    expect(page).to have_content "Review deleted successfully"
  end
end
