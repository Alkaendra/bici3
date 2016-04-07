class Project < ActiveRecord::Base
  validates :title, :description, :category_id, :product_id, :project_type_id, presence: true

  belongs_to :category
  belongs_to :product
  belongs_to :project_type

  has_many :images

  accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true

  has_attached_file :image, :styles => { :normal => "800x500>", :featured => "265x353#", :thumb => "263x246#" }, :default_url => "http://placehold.it/500x500"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  extend FriendlyId
    friendly_id :title, use: :slugged
end
