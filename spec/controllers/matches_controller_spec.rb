require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe MatchesController do

  # This should return the minimal set of attributes required to create a valid
  # Match. As you add validations to Match, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all matches as @matches" do
      match = Match.create! valid_attributes
      get :index
      assigns(:matches).should eq([match])
    end
  end

  describe "GET show" do
    it "assigns the requested match as @match" do
      match = Match.create! valid_attributes
      get :show, :id => match.id.to_s
      assigns(:match).should eq(match)
    end
  end

  describe "GET new" do
    it "assigns a new match as @match" do
      get :new
      assigns(:match).should be_a_new(Match)
    end
  end

  describe "GET edit" do
    it "assigns the requested match as @match" do
      match = Match.create! valid_attributes
      get :edit, :id => match.id.to_s
      assigns(:match).should eq(match)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Match" do
        expect {
          post :create, :match => valid_attributes
        }.to change(Match, :count).by(1)
      end

      it "assigns a newly created match as @match" do
        post :create, :match => valid_attributes
        assigns(:match).should be_a(Match)
        assigns(:match).should be_persisted
      end

      it "redirects to the created match" do
        post :create, :match => valid_attributes
        response.should redirect_to(Match.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved match as @match" do
        # Trigger the behavior that occurs when invalid params are submitted
        Match.any_instance.stub(:save).and_return(false)
        post :create, :match => {}
        assigns(:match).should be_a_new(Match)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Match.any_instance.stub(:save).and_return(false)
        post :create, :match => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested match" do
        match = Match.create! valid_attributes
        # Assuming there are no other matches in the database, this
        # specifies that the Match created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Match.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => match.id, :match => {'these' => 'params'}
      end

      it "assigns the requested match as @match" do
        match = Match.create! valid_attributes
        put :update, :id => match.id, :match => valid_attributes
        assigns(:match).should eq(match)
      end

      it "redirects to the match" do
        match = Match.create! valid_attributes
        put :update, :id => match.id, :match => valid_attributes
        response.should redirect_to(match)
      end
    end

    describe "with invalid params" do
      it "assigns the match as @match" do
        match = Match.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Match.any_instance.stub(:save).and_return(false)
        put :update, :id => match.id.to_s, :match => {}
        assigns(:match).should eq(match)
      end

      it "re-renders the 'edit' template" do
        match = Match.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Match.any_instance.stub(:save).and_return(false)
        put :update, :id => match.id.to_s, :match => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested match" do
      match = Match.create! valid_attributes
      expect {
        delete :destroy, :id => match.id.to_s
      }.to change(Match, :count).by(-1)
    end

    it "redirects to the matches list" do
      match = Match.create! valid_attributes
      delete :destroy, :id => match.id.to_s
      response.should redirect_to(matches_url)
    end
  end

end
