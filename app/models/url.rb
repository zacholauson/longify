class Url < ActiveRecord::Base
  extend FriendlyId
  friendly_id :original_url, use: :slugged

  validates_presence_of :original_url, :visits
  validates_uniqueness_of :original_url, :longified_url
  validates_format_of :original_url, :with => URI::regexp(%w(http https))

  before_create :generate_longified_url

  private

  def generate_longified_url
    self.longified_url = (0...1000).map{ ('a'..'z').to_a[rand(26)] }.join
  end
end
