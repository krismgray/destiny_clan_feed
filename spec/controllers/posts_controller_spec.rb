require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  # This comes from our spec/support/controller_macros.rb file
  # By calling this method we are adding a before_each for all specs that creates a user and logs them in
  # It also returns @user for all specs so we have access to the current logged in user
  login_user

    let(:valid_attributes) {
      { content: ''}
    }

    let(:invalid_attributes) {
      { content: ''}
    }

    describe "GET #index" do
      it "returns a success response" do
        posts = @user.posts.create! valid_attributes
        get :index
        expect(response).to be_success
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        posts = @user.posts.create! valid_attributes
        get :show, params: {id: posts.id}
        expect(response).to be_success
      end
    end

    describe "GET #new" do
      it "returns a success response" do
        get :new
        expect(response).to be_success
      end
    end

    describe "GET #edit" do
      it "returns a success response" do
        posts = @user.posts.create! valid_attributes
        get :edit, params: {id: posts.id}
        expect(response).to be_success
      end
    end

    describe "POST #create" do
      it 'creates a new post' do
        post :create, params: { post: valid_attributes }
        expect(@user.posts.count).to eq(1)
      end

      it 'does not create a new post with invalid params' do
      post :create, params: { post: invalid_attributes }
      expect(@user.posts.count).to eq(1)
    end
  end

end
