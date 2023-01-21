require 'rails_helper'

RSpec.describe 'PostShow', type: :feature do
  describe 'post show test' do
    before(:each) do
      @user = User.create!(name: 'Example User', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 3,
                           bio: 'I am a user')
      @user2 = User.create!(name: 'Example User2', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 3,
                            bio: 'I am a user')
      @user3 = User.create!(name: 'Example User3', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 3,
                            bio: 'I am a user')
      @user4 = User.create!(name: 'Example User4', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 3,
                            bio: 'I am a user')

      @post = Post.create!(title: 'This is my first post', text: 'This is my first post', comments_counter: 0,
                           likes_counter: 3, author: @user)
      @post2 = Post.create!(title: 'This is my second post', text: 'This is my second post', comments_counter: 0,
                            likes_counter: 3, author: @user)
      @post3 = Post.create!(title: 'This is my third post', text: 'This is my third post', comments_counter: 0,
                            likes_counter: 3, author: @user)
      @post4 = Post.create!(title: 'This is my fourth post', text: 'This is my fourth post', comments_counter: 0,
                            likes_counter: 3, author: @user)
      @post5 = Post.create!(title: 'This is my fifth post', text: 'This is my fifth post', comments_counter: 0,
                            likes_counter: 3, author: @user)

      @comment1 = Comment.create!(text: 'This is my first comment', author: @user2, post: @post)
      @comment2 = Comment.create!(text: 'This is my second comment', author: @user3, post: @post)
      @comment3 = Comment.create!(text: 'This is my third comment', author: @user4, post: @post)
      @comment4 = Comment.create!(text: 'This is my fourth comment', author: @user, post: @post)

      visit user_post_path(@user, @post)
    end

    it 'displays the post text' do
      expect(page).to have_content(@post.text)
    end

    it 'displays the post comments counter' do
      expect(page).to have_content(@post.comments_counter)
    end

    it 'displays the post likes counter' do
      expect(page).to have_content(@post.likes_counter)
    end

    it 'displays the post author name' do
      expect(page).to have_content(@post.author.name)
    end

    it 'displays the post title' do
      expect(page).to have_content(@post.title)
    end
  end
end
