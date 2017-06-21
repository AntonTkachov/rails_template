# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  first_name             :string(255)
#  last_name              :string(255)
#  gender                 :string(255)
#  birth_date             :date
#  active                 :boolean          default(TRUE)
#  role_id                :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_role_id               (role_id)
#

class User < ApplicationRecord
  self.per_page = 8

  GENDERS = ['male', 'female']

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  belongs_to :role
end
