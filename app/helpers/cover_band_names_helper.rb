module CoverBandNamesHelper
  
  def star_rating_for(cover_band_name)
    cover_band_name.average_rating 
  end
  
end
