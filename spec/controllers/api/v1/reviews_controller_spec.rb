require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do
  describe 'GET#index' do
    let!(:park1) {Park.create(
      name: "Mattapan Park",
      address: "19 State Road",
      city: "Mattapan",
      state: "MA",
      zip: 06661,
      description: "This place sucks"
      )}
    let!(:user1) {User.create(
      email: "ritazhousmile@gmail.com",
      password: "123456"
      )}
    let!(:review1) { Review.create(
      park: park1,
      rating: 4,
      body: "I would not recommend",
      user: user1
      )}

    before(:each) do
    get :index
    end

    it 'returns a successful response with json-formatted data' do
      expect(response.status).to eq 200
      expect(response.content_type).to eq 'application/json'
    end

    it 'should return all reviews in the database' do
      returned_json = JSON.parse(response.body)

      expect(returned_json.length).to eq 1
      expect(returned_json[0]['rating']).to eq 4
      expect(returned_json[0]['body']).to eq 'I would not recommend'
    end
  end
end
