# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ApplicationRecord
  class << self
    %w(admin user).each do |role|
      define_method role do
        where(title: role.capitalize).first
      end
    end
  end
end
