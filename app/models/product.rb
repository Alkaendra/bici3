class Product < ActiveRecord::Base
  validates :title, :description, :category_id, presence: true

  has_many :images
  belongs_to :category

  accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true

  has_attached_file :image, :styles => { :normal => "800x500>", :thumb => "250x250#", :list => "360x338#" }, :default_url => "http://placehold.it/500x500"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  extend FriendlyId
    friendly_id :title, use: :slugged
end
