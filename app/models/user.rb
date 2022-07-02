class User < ApplicationRecord

  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :trackable

  has_many :roles
  has_many :profiles, through: :roles

  [:admin].each do |name|
    define_method "#{name}?" do
      if name == :admin
        return !profiles.where(name: name).empty?
      else
        return !profiles.where(name: name).empty? || admin?
      end
    end
  end
end
