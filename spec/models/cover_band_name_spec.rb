require File.dirname(__FILE__) + '/../spec_helper'

describe CoverBandName do
  it "should be valid" do
    CoverBandName.new.should be_valid
  end
end
