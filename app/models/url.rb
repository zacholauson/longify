class Url < ActiveRecord::Base
  extend FriendlyId
  friendly_id :original_url, use: :slugged

  validates_presence_of :original_url, :longified_url, :visits
  validates_uniqueness_of :original_url, :longified_url
end
