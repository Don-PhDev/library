class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :libraries
  has_many :library_additions, through: :libraries, source: :book

  def name
    "#{first_name} #{last_name}".split.map(&:capitalize).join(" ")
  end

  def subscribed?
    stripe_subscription_id?
  end
end
