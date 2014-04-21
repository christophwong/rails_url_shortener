class Url < ActiveRecord::Base
   validates :url, uniqueness: true

  def get_short_url
    self.short_url = rand(10**10).to_s(36)
  end
end
