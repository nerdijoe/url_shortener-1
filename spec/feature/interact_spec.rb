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
    expect(page.body).to have_content(@url.long_url)
    expect(page.body).to have_content(@url.short_url)

  end
end

describe "user creates submit a form", :type => :feature do
  it "redirects to index page with new entry" do
    visit new_url_path
    fill_in "Enter your URL", with: "www.verge.com"
    click_button "Make it Short"

    expect(current_path).to eq(urls_path)
    expect(page.body).to have_content("www.verge.com")
  end
end
