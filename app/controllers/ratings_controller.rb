class RatingsController < ApplicationController
  before_filter :require_user
  def rate
    @asset = Item.find(params[:id])
    Rating.delete_all(["rateable_type = 'CoverBandName' AND rateable_id = ? AND user_id = ?", @asset.id, current_user.id])
    @asset.rate_it(params[:rating], current_user.id)
    render :update do |page|
      page.replace_html 'star-ratings-block', :partial => 'ratings/rating', :locals => { :asset => @asset }
      page.visual_effect :highlight, 'rate'
    end
  end
end