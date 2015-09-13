# == Schema Information
#
# Table name: customers
#
#  id          :integer          not null, primary key
#  family_name :string           not null
#  given_name  :string           not null
#  mail        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :integer
#
# Indexes
#
#  index_customers_on_company_id  (company_id)
#  index_customers_on_mail        (mail) UNIQUE
#

class Customer < ActiveRecord::Base

  scope :company_order, -> { order(:company_id)}
  validates :family_name,
    presence: true, length: { maximum: 20 }
  validates :given_name,
    presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail,
    presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :company_id, presence: true

  belongs_to :company
  has_many :comments

  def full_name(keisho)
    full_name = family_name + given_name + keisho
    return full_name
  end
end

