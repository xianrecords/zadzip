require 'digest'
class User < ActiveRecord::Base
  
  attr_accessor :password
  attr_protected :salt
  validates :email, :uniqueness => true, :length => { :within => 5..50 }, :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }
  validates :password, :confirmation => true, :length => { :within => 4..20 }, :presence => true, :if => :password_required?
  
  has_one :profile
  
  before_save :encrypt_password
  
  def has_password?(password)
    hashed_password == encrypt(password)
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(password)
  end
  
  protected
    
    def encrypt_password
      return if password.blank?
      self.salt = random_string(10) if !self.salt?
      self.hashed_password = encrypt(password)
    end
    
    
    def encrypt(string)
      Digest::SHA1.hexdigest(string + salt)
    end
    
    def random_string(len)
      #generate a random password consisting of strings and digits
      chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
      newpass = ""
      1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
      return newpass
    end
    
    def password_required?
      hashed_password.blank? || password.present
    end
  
  
end
