require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:author) { User.create(name: 'Author', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'test', posts_counter: 2) }

  subject do
    Post.new(title: 'Test', author_id: author.id, comments_counter: 2, likes_counter: 2)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an author_id' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with an author_id not being an integer' do
    subject.author_id = 'test'
    expect(subject).to_not be_valid
  end

  it 'should update the posts_counter of an author' do
    Post.create(title: 'Test', author_id: author.id, comments_counter: 2, likes_counter: 2)
    expect(author.posts_counter).to eq(2)
  end
end
