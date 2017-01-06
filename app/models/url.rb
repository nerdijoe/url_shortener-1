class Url < ActiveRecord::Base
  validates :long_url, presence: true
  validates :long_url, format: { with: /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\Z/, message: "invalid url" }
  validates :short_url, presence: true


  def self.retrieve_short_url(long_url)
    @url = Url.where(long_url: long_url)
    if @url.blank?
      return nil
    else
      @url.first.short_url
    end
  end

end
