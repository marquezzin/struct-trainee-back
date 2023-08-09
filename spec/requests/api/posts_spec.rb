require 'rails_helper'

RSpec.describe "Api::Posts", type: :request do
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
		let(:user) { create(:user, id:1, name:"aaa", email:"aaa@gmail.com", password:"123456", is_admin: true) }
		let(:post_params) do
			{
				user_id: user.id,
				title: "aaa",
				content: "aaaaa"
			}
		end
		context "when params are ok" do
			it "return http status created" do
				post "/api/posts/create", params:{post: post_params}, headers: admin_authentication_params
				expect(response).to have_http_status(:created)
			end
		end
		context "when params are nil" do
			post_params = nil
			it "return http status bad_request" do
				post "/api/posts/create", params:{post: post_params}, headers: admin_authentication_params
				expect(response).to have_http_status(:bad_request)
			end
		end
		context "when params are repeated" do
			it "return http status bad_request" do
				post "/api/posts/create", params:{post: post_params}, headers: admin_authentication_params
				post "/api/posts/create", params:{post: post_params}, headers: admin_authentication_params
				expect(response).to have_http_status(:bad_request)
			end
		end
	end

  describe "GET /index" do
		before do 
			create(:user, id: 1, name: "aaa", email: "aaa@gmail.com", password: "123456", is_admin: true)
			create(:post, user_id:1, id: 1, title: "Postagem1", content: "aaaaa")
			create(:post, user_id:1, id: 2, title: "Postagem2", content: "bbbbb")
			create(:post, user_id:1, id: 3, title: "Postagem3", content: "ccccc")
		end
		context 'when index return' do
			before do
				get '/api/posts/index'
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
					'user' => {
						"name" => "aaa"
					},
					'title' => "Postagem1",
					'content' => "aaaaa"
				},
				{
					'id' => 2,
					'user' => {
						"name" => "aaa"
					},
					'title' => "Postagem2",
					'content' => "bbbbb"
				},
				{
					'id' => 3,
					'user' => {
						"name" => "aaa"
					},
					'title' => "Postagem3",
					'content' => "ccccc"
				}
				])
			end
		end
	end

	describe "GET /show/:id" do
		before do
			create(:user, id:5, email:"ddd@gmail.com", is_admin:true)
		end
		let(:post) { create(:post, user_id:5) }
		let(:post_params) { 
			attributes_for(:post)
		}
		context "when id exist" do
			before do
				get "/api/posts/show/#{post.id}"
			end
			it "return http status ok" do
				expect(response).to have_http_status(:ok)
			end
		end
		context "when id not found" do
			before do
				get "/api/posts/show/-1"
			end
			it "return http status not_found" do
				expect(response).to have_http_status(:not_found)
			end
		end
	end

	describe "PATCH /update/:id" do
		let(:user) {create(:user, id:2, email:"bbb@gmail.com", is_admin:true)}
		let(:post) { create(:post, user_id:user.id, title:'Tutorial subir de elo no lol') }
		let(:post_params) do
			attributes_for(:post)
		end
		context "when params are ok" do
			it "return http status created" do
				patch "/api/posts/update/#{post.id}", params:{post: post_params}, headers: admin_authentication_params
				expect(response).to have_http_status(:ok)
			end
		end
	end

	describe " DELETE /delete/:id" do
		let(:user) {create(:user, id:3, email:"ccc@gmail.com", is_admin:true)}
		let(:post) {create(:post)}
		context 'post exist' do
			it 'return https status ok' do
				delete "/api/posts/delete/#{post.id}", headers: admin_authentication_params
				expect(response).to have_http_status(:ok)
			end
		end
		context 'post does not exist' do
			it 'return https status bad_request' do
				delete "/api/posts/delete/-1", headers: admin_authentication_params
				expect(response).to have_http_status(:bad_request)
			end
		end
	end
end
