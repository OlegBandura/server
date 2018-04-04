require 'acceptance_helper'
require 'rspec_api_documentation/dsl'
require 'support/factory_bot'
require 'database_cleaner'

resource 'Articles' do

  before(:all) do
    DatabaseCleaner[:active_record].strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end
  after(:all) do
    DatabaseCleaner[:active_record].strategy = :transaction
  end
  before(:each) do
    DatabaseCleaner.start
  end
  after(:each) do
    DatabaseCleaner.clean
  end

  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
  let(:raw_post) { params.to_json }

# show all articles
  route "/api/v1/articles", "Articles Collection" do
    get '/api/v1/articles' do
      parameter :page, 'Current page of atricles'
      let(:page) { 1 }
      # DatabaseCleaner.clean_with :truncation
      # DatabaseCleaner.strategy = :transaction
      before do
        4.times do |i|
          Article.create(title: "title #{i}", text: "comment#{i}")
        end
      end
      example_request 'Getting a list of articles' do
        expect(response_body).to eq(Article.all.to_json)
        expect(status).to eq(200)
      end
    end
  end

# headers articles
  head '/api/v1/articles' do
    example_request 'Getting the headers' do
      expect(response_headers['Cache-Control']).to eq('max-age=0, private, must-revalidate')
    end
  end

# add new article
  post '/api/v1/articles' do
    parameter :title, 'atricle title', required: true, scope: :article
    parameter :text, 'text of article', required: true, scope: :article

    let(:title) { 'title 2' }
    let(:text) { 'text1' }

    let(:raw_post) { params.to_json }

    example_request 'Creating an article' do
      explanation 'First, create an article, then make a later request to get it back'
      article = JSON.parse(response_body)
      expect(article.except('id', 'created_at', 'updated_at')).to eq({
        'title' => title,
        'text' => text
      })
      expect(status).to eq(201)
    end
  end

  # delete article
  delete '/api/v1/articles/:id' do
    let(:article) { create(:article) }
    let(:id) { article.id }
    example_request 'Deleting an article' do
      p article
      expect(status).to eq(204)
    end
  end

# get one article

    get '/api/v1/articles/:id' do
      let(:article) { create(:article) }
      let(:id) { article.id }
      example_request 'Get a specific article' do
        p article
        expect(response_body).to eq(article.to_json)
        expect(status).to eq(200)
      end
    end

  RSpec.configure do |config|
    config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end

    config.around(:each) do |example|
      DatabaseCleaner.cleaning do
        example.run
      end
    end
  end

end
