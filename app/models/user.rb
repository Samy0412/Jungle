class User < ActiveRecord::Base

  has_secure_password
  validates :email, uniqueness: {case_sensitive: false}
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 6 }

  def self.authenticate_with_credentials(email,password)
    scope :ci_find, lambda { |attribute, value| where("lower(#{attribute}) = ?", value.downcase).first }
    user = User.ci_find('email', email.gsub(/\s+/, ""))
    if user && user.authenticate(password)
      return user
    end
  end

end
