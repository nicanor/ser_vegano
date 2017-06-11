class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :email   , presence: true
  validates :email   , uniqueness: true
  validates :password, presence: true, on: :create
  validates :password, confirmation: true
end
