require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:author) { User.create(name: 'Author', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'test', posts_counter: 2) }
  let(:post) { Post.create(title: 'Test', author_id: author.id, comments_counter: 2, likes_counter: 2) }

  subject do
    Like.new(author_id: author.id, post_id: post.id)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an author_id' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a post_id' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a post_id not being an integer' do
    subject.post_id = 'test'
    expect(subject).to_not be_valid
  end

  it 'is not valid with an author_id not being an integer' do
    subject.author_id = 'test'
    expect(subject).to_not be_valid
  end

  it 'should update the likes_counter of a post' do
    Like.create(author_id: author.id, post_id: post.id)
    expect(post.likes_counter).to eq(2)
  end
end
