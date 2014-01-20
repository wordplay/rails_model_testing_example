class User < ActiveRecord::Base
  validates :username, presence: true,
    uniqueness: { case_sensitive: false },
    length: { minimum: 3, maximum: 16 }
  validates :password, presence: true,
    format: { with: /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{6,}$/,
      multiline: true,
      message: "must be at least six characters and include one number, one lowercase letter, and one uppercase letter." }
end
