class User < ActiveRecord::Base
  
  has_many :topics
  has_many :posts
  has_many :comments
  
  before_create :default_value_for_create
  
  validates_presence_of :email, :username, :password
  validates_confirmation_of :password
  validates_uniqueness_of :email
  validates_length_of :username, :in => 2..32
  validates_length_of :password, :in => 6..32
  validates_format_of :email, :with => /^[0-9a-zA-Z_][\w\.-]*[a-zA-Z0-9_]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/  
  
  
  def self.check_login(email, password)
    user = self.find_by_email(email)
    if user
      if user.encrypted_password(password).to_s!=user.password.to_s
        nil
      else
        user
      end
    else
      nil
    end
  end
  
  def default_value_for_create
    self.password = encrypted_password(self.password)
    self.current_login_at = Time.now
    self.last_login_at = Time.now
    self.login_times = 0
    self.coins = 0
  end
  
  def encrypted_password(password)
    Digest::MD5.hexdigest(password)
  end
  
end
