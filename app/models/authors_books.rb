class AuthorsBooks < ActiveRecord::Base
  has_many :authors
  has_many :books
end
