class User < ActiveRecord::Base
  attr_accessible :email, :email_token, :password, :session_token, :status,
                  :email_token, :admin
  validates :email, :password, presence: true
  validates :email, uniqueness: true


  def unique_session_token
    random = SecureRandom.urlsafe_base64
    until User.find_by_session_token(random).empty?
      random = SecureRandom.urlsafe_base64
    end
    self.session_token = random
  end

  def unique_email_token
    random = SecureRandom.urlsafe_base64
    until User.find_by_email_token(random).empty?
      random = SecureRandom.urlsafe_base64
    end
    self.email_token = random
  end
end
