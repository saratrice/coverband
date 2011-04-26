require File.dirname(__FILE__) + '/../spec_helper'

describe CoverBandNamesController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => CoverBandName.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    CoverBandName.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    CoverBandName.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(cover_band_name_url(assigns[:cover_band_name]))
  end

  it "edit action should render edit template" do
    get :edit, :id => CoverBandName.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    CoverBandName.any_instance.stubs(:valid?).returns(false)
    put :update, :id => CoverBandName.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    CoverBandName.any_instance.stubs(:valid?).returns(true)
    put :update, :id => CoverBandName.first
    response.should redirect_to(cover_band_name_url(assigns[:cover_band_name]))
  end

  it "destroy action should destroy model and redirect to index action" do
    cover_band_name = CoverBandName.first
    delete :destroy, :id => cover_band_name
    response.should redirect_to(cover_band_names_url)
    CoverBandName.exists?(cover_band_name.id).should be_false
  end
end
