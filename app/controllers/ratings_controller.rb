class RatingsController < ApplicationController
  def index
    @rateable = find_rateable
    @ratings = @rateable.ratings
  end

  def create
    if current_user
      @rateable = find_rateable
      @rateable.rate_it( params[:rating], current_user.id )
    else
      @error = "You must be logged in to vote!"
    end
    respond_to do |format|
      format.js
    end
  end
  
  private
  
  def find_rateable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end
