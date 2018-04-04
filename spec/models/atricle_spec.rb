# require 'rails_helper'
# require 'support/factory_bot'
#
# describe Article do
#   before(:all) do
#     DatabaseCleaner[:active_record].strategy = :transaction
#     DatabaseCleaner.clean_with(:truncation)
#   end
#   after(:all) do
#     DatabaseCleaner[:active_record].strategy = :transaction
#   end
#   before(:each) do
#     DatabaseCleaner.start
#   end
#   after(:each) do
#     DatabaseCleaner.clean
#   end
#   it { should validate_presence_of :title }
#   it { should validate_presence_of :text }
#   it { should have_many :comments }
#
#   describe '#subject' do
#     it 'returns the article title' do
#       # create object article
#       article = create(:article, title: 'Lorem Ipsum')
#
#       # assert
#       expect(article.subject).to eq 'Lorem Ipsum'
#     end
#   end
#
#   describe "#last_comment" do
#     it 'returns last comment' do
#       article = create(:article_with_comments)
#       # перевірка
#       expect(article.last_comment.comment).to eq 'comment text 4'
#     end
#   end
# end
