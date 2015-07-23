class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  self.per_page = 50

  scope :visible_to, -> (user) { user ? all : where(public: true) }
end
