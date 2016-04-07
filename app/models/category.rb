class Category < ActiveRecord::Base
  validates :title, :description, presence: true
  has_many :children, class_name: 'Category', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Category', foreign_key: 'parent_id'
  has_many :images  

  accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true

  has_attached_file :image, :styles => { :normal => "800x500>", :thumb => "263x197#" }, :default_url => "http://placehold.it/500x500"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  def get_ancestors(level = 0, result = [])
	  result.push([level, self])
	  if(!self.children.empty?)
	    self.children.each do |child|
	      child.get_ancestors(level+1, result)
	    end
	  end
	  if(level == 0)
	    return result
	  end
	end

  extend FriendlyId
    friendly_id :title, use: :slugged
end
