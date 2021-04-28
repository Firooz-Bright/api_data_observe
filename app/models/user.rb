class User < ActiveRecord::Base
 has_secure_password 
 validates :username ,:password, presence: { message: "must be given please"}
 validates_uniqueness_of :username
 has_many :recipes 

end 