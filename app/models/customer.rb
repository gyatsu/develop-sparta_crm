class Customer < ActiveRecord::Base
  def full_name
    full_name = family_name + given_name + "様"
    return full_name
  end
end
