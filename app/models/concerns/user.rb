class User < ApplicationRecord
  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }


  has_many :attends, dependent: :destroy
  has_many :events, through: :attends, source: :events
  has_many :discussions, dependent: :destroy

  validates :first_name, :presence => {:message => "Name can't be blank"}
  validates :last_name, :presence => {:message => "Name can't be blank"}
  validates :email, :presence => {:message => "Email can't be blank"}
  validates :city, :presence => {:message => "Email can't be blank"}
  validates :state, :presence => {:message => "Email can't be blank"}
  validates :password, :presence => {:message => "Password can't be blank"}

end



