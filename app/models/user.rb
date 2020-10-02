class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable, :lockable, :rememberable

  has_many :projects

  def is_admin?
    User.find(current_user.id).is_admin
  end
end
