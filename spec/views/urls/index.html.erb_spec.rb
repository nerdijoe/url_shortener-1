require 'rails_helper'

RSpec.describe "urls/index.html.erb", type: :view do
  before :each do
    FactoryGirl.create(:url)
    @urls = Url.all
  end

  it "should list the long_url" do
    render #!!!! this must be called!!!!
    @urls.each do |url|
      expect(rendered).to have_content(url.long_url)
      expect(rendered).to have_content(url.short_url)
    end
  end



end
