class Asset < ActiveRecord::Base
  belongs_to :ticket

  has_attached_file :asset, :path => (Rails.root + "files/:id").to_s
end
