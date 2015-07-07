class User < ActiveRecord::Base
  def admin?
    role == 'admin'
  end

  def moderator?
    role == 'moderator'
  end

  
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

end
