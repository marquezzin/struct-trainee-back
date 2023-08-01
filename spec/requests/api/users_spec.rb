require 'rails_helper'

RSpec.describe "Api::Users", type: :request do
  let(:user) { create(:user) }
	let(:authentication_params) {{
		'X-User-Email': user.email,
		'X-User-Token': user.authentication_token
	}}
	let(:user_admin) { create(:user, is_admin:true) }
	let(:admin_authentication_params) {{
		'X-User-Email': user_admin.email,
		'X-User-Token': user_admin.authentication_token
	}}

	describe "POST /create" do
		let(:user_params) do
			attributes_for(:user)
		end
		context "when params are ok" do
			it "return http status created" do
				post "/api/users/create", params:{user: user_params}, headers: authentication_params
				expect(response).to have_http_status(:created)
			end
		end
		context "when params are nil" do
			user_params = nil
			it "return http status bad_request" do
				post "/api/users/create", params:{user: user_params}, headers: authentication_params
				expect(response).to have_http_status(:bad_request)
			end
		end
		context "when params are repeated" do
			it "return http status bad_request" do
				post "/api/users/create", params:{user: user_params}, headers: authentication_params
				post "/api/users/create", params:{user: user_params}, headers: authentication_params
				expect(response).to have_http_status(:bad_request)
			end
		end
	end

	describe "GET /index" do
		before do
			create(:user, id:1, name:"user", email:"user@gmail.com", password: "123456", is_admin:true)
		end	
		context 'when index return' do
			before do
				get '/api/users/index', headers: admin_authentication_params
			end
			it 'return http status ok' do
				expect(response).to have_http_status(:ok)
			end
			it 'return a json' do
				expect(response.content_type).to eq('application/json; charset=utf-8')
			end
			it 'return created instances' do
				expect(JSON.parse(response.body).first).to include(
					'id',
					'name',
					'email',
					'is_admin',
					'profile_picture_url'
				)
			end
		end
	end

	describe "GET /show/:id" do
		let(:user) {create(:user)}
		context "when id exist" do
			before do
				get "/api/users/show/#{user.id}", headers: authentication_params
			end
			it "return http status ok" do
				expect(response).to have_http_status(:ok)
			end
		end
		context "when id not found" do
			before do
				get "/api/users/show/-1", headers: authentication_params
			end
			it "return http status not_found" do
				expect(response).to have_http_status(:not_found)
			end
		end
	end

	describe "PATCH /update/:id" do
		let(:user) { create(:user, name:"Joao", email:"joao@gmail.com", is_admin:true) }
		let(:user_params) do
			attributes_for(:user)
		end
		context "when params are ok" do
			it "return http status created" do
				patch "/api/users/update/#{user.id}", params:{user: user_params}, headers: authentication_params
				expect(response).to have_http_status(:ok)
			end
		end
	end

	describe "DELETE /delete/:id" do
		let(:user) {create(:user)}
		context 'user exist' do
			it 'return https status ok' do
				delete "/api/users/delete/#{user.id}", headers: authentication_params
				expect(response).to have_http_status(:ok)
			end
		end
		context 'user does not exist' do
			it 'return https status bad_request' do
				delete "/api/users/delete/-1", headers: authentication_params
				expect(response).to have_http_status(:bad_request)
			end
		end
	end
end
