# frozen_string_literal: true

# == Schema Information
#
# Table name: publishers
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_publishers_on_name  (name) UNIQUE
#
require 'rails_helper'

RSpec.describe Publisher, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
