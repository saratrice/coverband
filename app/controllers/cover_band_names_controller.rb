class CoverBandNamesController < ApplicationController
  load_and_authorize_resource
  
  def index
    # @cover_band_names = CoverBandName.all
    # @cover_band_name = CoverBandName.order('rand()').first
    offset = rand(CoverBandName.count)
    @cover_band_name = CoverBandName.first(:offset => offset)
  end

  # def show
  #   @cover_band_name = CoverBandName.find(params[:id])
  # end

  def new
    @cover_band_name = CoverBandName.new
  end

  def create
    @cover_band_name = CoverBandName.new(params[:cover_band_name])
    @cover_band_name.user = current_user
    if @cover_band_name.save
      redirect_to root_path, :notice => "Successfully created cover band name."
    else
      render :action => 'new'
    end
  end

  # def edit
  #   @cover_band_name = CoverBandName.find(params[:id])
  # end
  
  def my_submissions
    @cover_band_names = CoverBandName.where(:user_id => current_user.id)
  end

  # def update
  #   @cover_band_name = CoverBandName.find(params[:id])
  #   if @cover_band_name.update_attributes(params[:cover_band_name])
  #     redirect_to @cover_band_name, :notice  => "Successfully updated cover band name."
  #   else
  #     render :action => 'edit'
  #   end
  # end
  # 
  # def destroy
  #   @cover_band_name = CoverBandName.find(params[:id])
  #   @cover_band_name.destroy
  #   redirect_to cover_band_names_url, :notice => "Successfully destroyed cover band name."
  # end
end
