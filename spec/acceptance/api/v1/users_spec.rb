require 'acceptance_helper'
require 'rspec_api_documentation/dsl'
require 'support/factory_bot'

resource 'Users' do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
  let(:raw_post) { params.to_json }

  # add new user
    post '/api/v1/users/create' do
      AUTH_URL = '/user_token'
      parameter :email, 'email', required: true, scope: :user
      parameter :password, 'password', required: true, scope: :user

      let(:email) { 'user1@mail.com' }
      let(:password) { 'pass' }

      let(:raw_post) { params.to_json }

      example_request 'Creating an user' do
        explanation 'First, create an user, then make a later request to get it back'
        user = JSON.parse(response_body)
        # expect(user.except('id', 'created_at', 'updated_at')).to eq({
        #   'email' => email,
        #   'password' => password
        # })
        expect(status).to eq(200)
      end
    end

  # delete user
  delete '/api/v1/user/:id' do
    let(:user) { create(:user) }
    let(:id) { user.id }
    example_request 'Deleting an user' do
      p user
      expect(status).to eq(200)
    end
  end

# update user
  patch'/api/v1/user/:id' do
    parameter :email, 'user@mail.caom', scope: :user
    parameter :password, '1111', scope: :user
    let(:user) { create(:user) }
    let(:id) { user.id }
    let(:email) { 'new_user@mail.com' }

    let(:raw_post) { params.to_json }

    example_request 'Updating an user' do
      expect(status).to eq(204)
    end
  end

end
