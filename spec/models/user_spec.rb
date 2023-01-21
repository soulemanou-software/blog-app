require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Test', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'test', posts_counter: 2)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'posts_counter should be greater than o' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a posts_counter not being an integer' do
    subject.posts_counter = 'test'
    expect(subject).to_not be_valid
  end
end
