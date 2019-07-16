require 'rails_helper'

feature 'user can add parks' do

  scenario 'user adds new park successfully' do
    visit parks_path

    click_link `Add a New Park`

    expect(page).to have_content ``
  end
end
