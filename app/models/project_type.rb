class ProjectType < ActiveRecord::Base
  validates :title, :description, presence: true

  has_many :projects

  extend FriendlyId
    friendly_id :title, use: :slugged
end
