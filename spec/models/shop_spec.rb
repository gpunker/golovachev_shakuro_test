# == Schema Information
#
# Table name: shops
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Shop, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
