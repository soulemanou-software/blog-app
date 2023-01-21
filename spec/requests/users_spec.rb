require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET index' do
    before(:each) { get '/users' }

    it 'should return a 200 response' do
      expect(response).to have_http_status(:ok)
    end

    it 'should test heading text inside template' do
      expect(response.body).to include('Users Page')
    end

    describe 'GET show' do
      before(:each) { get '/users/11' }

      it 'should return a 200 response' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
