require 'rails_helper'

RSpec.describe 'UsersShow', type: :feature do
  describe 'user show page' do
    before(:each) do
      @user1 = User.create!(name: 'Example User', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 3,
                            bio: 'I am a user')
      @user2 = User.create!(name: 'Example User2', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 3,
                            bio: 'I am a user')
      @user3 = User.create!(name: 'Example User3', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 3,
                            bio: 'I am a user')
      @user4 = User.create!(name: 'Example User4', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 3,
                            bio: 'I am a user')
      @user5 = User.create!(name: 'Example User5', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 3,
                            bio: 'I am a user')

      visit root_path

      @post = Post.create!(title: 'This is a post title', text: ' This is a Text', comments_counter: 3,
                           likes_counter: 3, author: @user1)
      @post2 = Post.create!(title: 'This is a post title', text: ' This is a Text2', comments_counter: 3,
                            likes_counter: 3, author: @user1)
      @post3 = Post.create!(title: 'This is a post title', text: ' This is a Text2', comments_counter: 3,
                            likes_counter: 3, author: @user1)
      @post4 = Post.create!(title: 'This is a post title', text: ' This is a Text4', comments_counter: 3,
                            likes_counter: 3, author: @user1)
      @post5 = Post.create!(title: 'This is a post title', text: ' This is a Text5', comments_counter: 3,
                            likes_counter: 3, author: @user1)

      visit user_path(@user1.id)
    end

    it 'displays the user name' do
      expect(page).to have_content(@user1.name)
    end

    it 'displays the user photo' do
      expect(page).to have_css("img[
        src='https://unsplash.com/photos/F_-0BxGuVvo']")
    end

    it 'displays the user bio' do
      expect(page).to have_content(@user2.bio)
    end

    it 'displays the user posts counter' do
      expect(page).to have_content(@user2.posts_counter)
    end

    it 'displays the user first 3 posts' do
      expect(page).to have_content(@post.title)
      expect(page).to have_content(@post2.title)
      expect(page).to have_content(@post3.title)
    end

    it 'displays button to see all posts' do
      expect(page).to have_link('Show All Posts')
    end

    it 'click a user post and redirects to post show page' do
      click_link 'Show All Posts'
      expect(page).to have_current_path user_posts_path(@user1)
    end

    it 'click see all posts and redirects to user posts index page' do
      click_link('Show All Posts')
      expect(page).to have_current_path user_posts_path(@user1)
    end
  end
end
