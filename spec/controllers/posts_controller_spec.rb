require 'rails_helper'


RSpec.describe PostsController, type: :controller do


  #DatabaseCleaner.strategy = :transaction
  #DatabaseCleaner.clean_with(:truncation)

  let(:valid_attributes) {
    
     FactoryGirl.attributes_for(:post)
    
  }

  let(:invalid_attributes) {

    FactoryGirl.attributes_for(:invalid_post)

  }

  let(:valid_session) { {} }

  describe "GET #index" do


############################ todo #############################################
    #Fix this test. I think the problem is that there's extra records in the
    #testing db (my facotrygirl.create) 
    #Need to find out how to delete those (database_cleaner?)
    #Or not create them at all in the first place
 
   xit "assigns all posts as @posts" do
      post = Post.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:posts)).to eq([post])
    
     end

    xit "populates an array of posts" do
      post = FactoryGirl.create(:post)
      get :index
      assigns(:posts).should eq([post])
    end
  end

  describe "GET #show" do
    it "assigns the requested post as @post" do
      post = FactoryGirl.create(:post)
      get :show, {:id => post.to_param}, valid_session
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "GET #new" do
    it "assigns a new post as @post" do
      get :new, {}, valid_session
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "GET #edit" do
    it "assigns the requested post as @post" do
      post = FactoryGirl.create(:post)
      get :edit, {:id => post.to_param}, valid_session
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      
      let(:user) {
        FactoryGirl.create(:user)
      }

      let(:valid_attributes) {
        {
         title: 'I wish I could make this a factory',
         body: 'I probably could',
         user_id: user.id
        }
      } 

      #@request.env["devise.mapping"] = Devise.mappings[:user]
      #get :new

      #@user = FactoryGirl.create(:user)


      it "creates a new Post" do

        sign_in user
        expect {
          post :create, {:post => valid_attributes}, valid_session
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, {:post => valid_attributes}, valid_session
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it "redirects to the posts path" do
        post :create, {:post => valid_attributes}, valid_session
        expect(response).to redirect_to(posts_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        post :create, {:post => invalid_attributes}, valid_session
        expect(assigns(:post)).to be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        post :create, {:post => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {

        FactoryGirl.attributes_for(:updated_post)

      }

      it "updates the requested post" do
        post = Post.create! valid_attributes
        put :update, {:id => post.to_param, :post => new_attributes}, valid_session
        post.reload
        expect(post.title).to eq('New Title')
      end

      it "assigns the requested post as @post" do
        post = Post.create! valid_attributes
        put :update, {:id => post.to_param, :post => valid_attributes}, valid_session
        expect(assigns(:post)).to eq(post)
      end

      it "redirects to the post" do
        post = Post.create! valid_attributes
        put :update, {:id => post.to_param, :post => valid_attributes}, valid_session
        expect(response).to redirect_to(post)
      end
    end

    context "with invalid params" do
      it "assigns the post as @post" do
        post = Post.create! valid_attributes
        put :update, {:id => post.to_param, :post => invalid_attributes}, valid_session
        expect(assigns(:post)).to eq(post)
      end

      it "re-renders the 'edit' template" do
        post = Post.create! valid_attributes
        put :update, {:id => post.to_param, :post => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested post" do
      post = Post.create! valid_attributes
      expect {
        delete :destroy, {:id => post.to_param}, valid_session
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = Post.create! valid_attributes
      delete :destroy, {:id => post.to_param}, valid_session
      expect(response).to redirect_to(posts_url)
    end
  end

end
