require 'rails_helper'
RSpec.describe 'PostIndex', type: :feature do
  describe 'post index test' do
    before(:each) do
      @user = User.create!(name: 'Example User', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 3,
                           bio: 'I am a use')
      visit root_path
      @post = Post.create!(title: 'Example Post', text: 'This is an example post', comments_counter: 3,
                           likes_counter: 3, author: @user)
      @post2 = Post.create!(title: 'Example Post2', text: 'This is an example post2', comments_counter: 3,
                            likes_counter: 3, author: @user)
      @post3 = Post.create!(title: 'Example Post3', text: 'This is an example post3', comments_counter: 3,
                            likes_counter: 3, author: @user)
      @post4 = Post.create!(title: 'Example Post4', text: 'This is an example post4', comments_counter: 3,
                            likes_counter: 3, author: @user)
      @post5 = Post.create!(title: 'Example Post5', text: 'This is an example post5', comments_counter: 3,
                            likes_counter: 3, author: @user)
      @comment1 = Comment.create!(text: 'This is a comment', author: @user, post: @post)
      @comment2 = Comment.create!(text: 'This is a comment2', author: @user, post: @post)
      @comment3 = Comment.create!(text: 'This is a comment3', author: @user, post: @post)
      visit user_posts_path(@user)
    end
    it 'displays the user name' do
      expect(page).to have_content(@user.name)
    end
    it 'displays the user photo' do
      expect(page).to have_css("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
    end
    it 'displays the user posts counter' do
      expect(page).to have_content(@user.posts_counter)
    end
    it 'displays the post title' do
      expect(page).to have_content(@post.title)
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
    it 'redirects to the post show page when the post title is clicked' do
      click_link(@post.title)
      expect(page).to have_current_path(user_post_path(@user, @post))
    end
  end
end
