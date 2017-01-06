require 'rails_helper'

describe "user clicks a link on the index page", :type => :feature do

  # it "renders the index template" do
  #   get :index
  #   expect(response).to redirect_to("index")
  # end

  it "redirects to new" do
    visit root_path
    click_link "Short it"
    expect(current_path).to eq(new_url_path)
  end
end


describe "user clicks the long_url", :type => :feature do
  before :each do
    @url = FactoryGirl.create(:url)
  end

  it "redirects to show page" do

    visit root_path
    click_link "www.google.com"

    expect(current_path).to eq(url_path(@url.id))
  end

end
