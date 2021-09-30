# == Schema Information
#
# Table name: publishers
#
#  id         :bigint           not null, primary key
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Publisher < ApplicationRecord
	extend FriendlyId
	friendly_id :name, use: :slugged
end