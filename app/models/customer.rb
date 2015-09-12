class Customer < ActiveRecord::Base
  def full_name(keisho)
    full_name = family_name + given_name + keisho
    return full_name
  end
end
