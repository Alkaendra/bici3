class Webimage < ActiveRecord::Base
  validates :title,  presence: true

  has_many :images

  accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true

  has_attached_file :image, :styles => { :normal => "1600x680>", :thumb => "1600x680#" }, :default_url => "http://placehold.it/500x500"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
