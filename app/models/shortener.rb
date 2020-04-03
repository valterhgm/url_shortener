class Shortener < ApplicationRecord
  before_save :shorten_url

  private

  def shorten_url
    self.short_url = SecureRandom.urlsafe_base64(7)
  end

end

