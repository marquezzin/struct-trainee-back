require 'rails_helper'

RSpec.describe "Api::Upvotes", type: :request do
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
		before do
			create(:user, id:1, name:"aaa", email:"aaa@gmail.com", password:"123456", is_admin: true)
			create(:post, id:1, title:"aaa", content:"aaaaa", user_id:1)
		end
		let(:upvote_params) { 
			{
				status: false,
				post_id: 1,
				user_id: 1
			}
		}
		context 'params are ok' do
			it 'return https status created' do
				post "/api/upvotes/create", params:{upvote: upvote_params}, headers: admin_authentication_params
				expect(response).to have_http_status(:created)
			end
		end
		context "when params are nil" do
			it "return http status bad_request" do
				upvote_params = nil
				post "/api/upvotes/create", params:{upvote: upvote_params}, headers: admin_authentication_params
				expect(response).to have_http_status(:bad_request)
			end
		end
		context "when params are repeated" do
			it "return http status bad_request" do
				post "/api/upvotes/create", params: upvote_params, headers: admin_authentication_params
				post "/api/upvotes/create", params: upvote_params, headers: admin_authentication_params
				expect(response).to have_http_status(:bad_request)
			end
		end
	end

	describe "GET /index" do
		before do 
			create(:user, id: 100, name: "aaa", email: "aaa@gmail.com", password: "123456", is_admin: true)
			create(:post, id: 1, user_id:100, title: "Postagem1", content: "aaaaa")
			create(:post, id: 2, user_id:100, title: "Postagem2", content: "bbbbb")
			create(:post, id: 3, user_id:100, title: "Postagem3", content: "ccccc")
			create(:upvote, id: 1, status: false, post_id:1, user_id:100)
			create(:upvote, id: 2, status: true, post_id:2, user_id:100)
			create(:upvote, id: 3, status: false, post_id:3, user_id:100)
		end
		context 'when index return' do
			before do
				get '/api/upvotes/index'
			end
			it 'return http status ok' do
				expect(response).to have_http_status(:ok)
			end
			it 'return a json' do
				expect(response.content_type).to eq('application/json; charset=utf-8')
			end
			it 'return created instances' do
				expect(JSON.parse(response.body)).to eq([{
				'id' => 1,
				'status' => false,
				'post' => {
					"id" => 1,
					"title" => "Postagem1",
					"content" => "aaaaa"
				},
				'user' => {
					"email" => "aaa@gmail.com"
				}
				},
				{
				'id' => 2,
				'status' => true,
				'post' => {
					"id" => 2,
					"title" => "Postagem2",
					"content" => "bbbbb"
				},
				'user' => {
					"email" => "aaa@gmail.com"
				}
				},
				{
				'id' => 3,
				'status' => false,
				'post' => {
					"id" => 3,
					"title" => "Postagem3",
					"content" => "ccccc"
				},
				'user' => {
					"email" => "aaa@gmail.com"
				}
				}
				])
			end
		end
	end

	describe "GET /show/:id" do
		let(:user) {create(:user, id:200, email:"ddd@gmail.com", is_admin:true)}
		let(:post) {create(:post, id:200, user_id:200)}
		let(:upvote) {create(:upvote, user_id:user.id, post_id:post.id)}
		let(:upvote_params) do
			attributes_for(:upvote)
		end
		context "when id exist" do
			before do
				get "/api/upvotes/show/#{upvote.id}", params: {upvote: upvote_params}, headers: authentication_params
			end
			it "return http status ok" do
				expect(response).to have_http_status(:ok)
			end
		end
		context "when id not found" do
			before do
				get "/api/upvotes/show/-1"
			end
			it "return http status not_found" do
				expect(response).to have_http_status(:not_found)
			end
		end
	end

	describe "PATCH /update/:id" do
		let(:user) {create(:user, id:200, email:"ddd@gmail.com", is_admin:true)}
		let(:post) {create(:post, id:200, user_id:200)}
		let(:upvote) {create(:upvote, user_id:user.id, post_id:post.id, status:true)}
		let(:upvote_params) do
		  	attributes_for(:upvote)
		end
		context "when params are ok" do
			it "return http status ok" do
				patch "/api/upvotes/update/#{upvote.id}", params:{upvote: upvote_params }, headers: admin_authentication_params
				expect(response).to have_http_status(:ok)
			end
		end
	end

	describe "DELETE /delete/:id" do
		let(:user) {create(:user, id:300, email:"eee@gmail.com", is_admin:true)}
		let(:post) {create(:post, id:300, user_id:300)}
		let(:upvote) {create(:upvote, user_id:user.id, post_id:post.id)}
		context 'upvote exist' do
			it 'return https status ok' do
				delete "/api/upvotes/delete/#{upvote.id}", headers: admin_authentication_params
				expect(response).to have_http_status(:ok)
			end
		end
		context 'upvote does not exist' do
			it 'return https status bad_request' do
				delete "/api/upvotes/delete/-1", headers: admin_authentication_params
				expect(response).to have_http_status(:bad_request)
			end
		end
	end
end
