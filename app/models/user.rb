class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :bookmark_id, :user_name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_many :bookmarks
  acts_as_tagger
  acts_as_taggable

  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :email, :confirmation => true
end
