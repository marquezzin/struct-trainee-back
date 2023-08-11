require 'rails_helper'

RSpec.describe "Api::PostCategories", type: :request do
  describe "GET /index" do
    before do
      create(:user, id: 1, name: "aaa", email: "aaa@gmail.com", password: "123456", is_admin: true)
			create(:post, user_id:1, id: 1, title: "Postagem1", content: "aaaaa")
			create(:post, user_id:1, id: 2, title: "Postagem2", content: "bbbbb")
      create(:category, id:1, name:"A")
      create(:category, id:2, name:"B")
      create(:post_category, id:1, post_id:1, category_id:1)
      create(:post_category, id:2, post_id:2, category_id:2)
    end
    context 'when index return' do
      before do
        get '/api/post_categories/index'
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
            'post' => {
              "id" => 1,
              "title" => "Postagem1",
              "content" => "aaaaa",
              "user" => {
                "id" => 1,
                "name" => "aaa"
              }
            },
            'category' => {
              "id" => 1,
              "name" => "A"
            }
          },
          {
            'id' => 2,
            'post' => {
              "id" => 2,
              "title" => "Postagem2",
              "content" => "bbbbb",
              "user" => {
                "id" => 1,
                "name" => "aaa"
              }
            },
            'category' => {
              "id" => 2,
              "name" => "B"
            }
        }
        ])
      end
    end
  end
end
