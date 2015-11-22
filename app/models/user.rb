class User < ActiveRecord::Base
  has_secure_password

  enum role: %w(admin default)
end
