class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :albums

  validates :username, :password, presence: true
  validates :username, uniqueness: true

  def check_password(password)
		if self.password == password
			true
		else
			false
		end
	end
end
