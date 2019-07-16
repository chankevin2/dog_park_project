require 'rails_helper'

feature 'user goes to root path' do
  scenario 'user sees a list of parks' do
    park1 = FactoryBot.create(:park)
    park2 = FactoryBot.create(:park, city: "New York", state: "NY", zip: "00666", description: "Red Sox suck")

    visit parks_path

    expect(page).to have_content park1.name
    expect(page).to have_content park2.name
  end
end
