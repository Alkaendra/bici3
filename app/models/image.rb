class Image < ActiveRecord::Base
	validates :photo, :presence => true

  belongs_to :category
  belongs_to :product
  belongs_to :project
  belongs_to :post
  belongs_to :webimage

	has_attached_file :photo, :styles => { :normal => "800x800>", :thumb => "250x250#" }, :default_url => "http://placehold.it/500x500"
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
