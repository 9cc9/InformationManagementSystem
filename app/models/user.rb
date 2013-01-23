class User < ActiveRecord::Base
  attr_accessible :account, :hashed_password, :name,
                  :role_id, #["操作员", "1"], ["管理员", "2"],["超级管理员","0"]
                  :salt, :password
  attr_accessor :password_confirmation
  attr_reader :password

  def password=(password)
    @password = password
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt(password, salt)
    end
  end

  def authenticated?(password)
    hashed_password == encrypt(password)
  end

  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  # Authenticates a user by their login account and unencrypted password.  Returns the user or nil.
  def self.authenticate(account, password)
    user = find_by_account(account) # need to get the salt
    user && user.authenticated?(password) ? user : nil
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA2.hexdigest(password + "wibble" + salt)
  end

  protected

  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

  def password_required?
    hashed_password.blank? || !password.blank?
  end


end
