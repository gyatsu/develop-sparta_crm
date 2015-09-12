class Customer < ActiveRecord::Base
  validates :family_name,
    presence: true, length: { maximum: 20 }
  validates :given_name,
    presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail,
    presence: true, format: { with: VALID_EMAIL_REGEX }


  def full_name(keisho)
    full_name = family_name + given_name + keisho
    return full_name
  end
end

