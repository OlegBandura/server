require 'acceptance_helper'
require 'rspec_api_documentation/dsl'
require 'support/factory_bot'

resource 'Comments' do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
  let(:raw_post) { params.to_json }

# show all comments
  route "/api/v1/articles/:article_id/comments", "Comments Collection" do
    get '/api/v1/articles/:article_id/comments' do
      let(:article) { comment.article_id }
      parameter :page, 'Current page of comments'
      let(:page) { 1 }
      before do
        3.times do |i|
          Comment.create(
            article_id: i, author: "user #{i}", comment: "comment #{i}"
          )
        end
      end
      example_request 'Getting a list of comments' do
        expect(response_body).to eq(Comment.all.to_json)
        expect(status).to eq(200)
      end
    end
  end

# headers articles
  head '/api/v1/articles/:article_id/comments' do
    let(:article_id) { article.id }
    let(:article) { create(:article) }
    example_request 'Getting the headers' do
      expect(response_headers['Cache-Control']).to eq('max-age=0, private, must-revalidate')
    end
  end

# add new comment
  # post '/api/v1/articles/:article_id/comments' do
  #   let(:article_id) { article.id }
  #   let(:article) { create(:article) }
  #   parameter :author, 'author', required: true, scope: :comment
  #   parameter :comment, 'comment', required: true, scope: :comment
  #
  #   let(:author) { 'title 2' }
  #   let(:comment) { 'comment 1' }
  #
  #   let(:raw_post) { params.to_json }
  #
  #   example_request 'Creating an comment' do
  #     explanation 'First, create an comment, then make a later request to get it back'
  #     comment = JSON.parse(response_body)
  #     expect(comment.except('id', 'created_at', 'updated_at')).to eq({
  #       'author' => author,
  #       'comment' => comment
  #     })
  #     expect(status).to eq(201)
  #   end
  # end
end
