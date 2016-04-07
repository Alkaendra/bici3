class Editor < Admin
devise :database_authenticatable, :registerable, :confirmable,
     :recoverable, :rememberable, :trackable, :validatable
end
