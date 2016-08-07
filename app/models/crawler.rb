class Crawler < ActiveRecord::Base

  validates :url, presence: true

  def craw_data

  end

  private
  def open_link
    begin
      open(url)
    rescue OpenURI::HTTPError => error
      response = error.io
      response = status
      Net::HTTP
    end
  end
end
