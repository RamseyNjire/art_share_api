# == Schema Information
#
# Table name: art_collections
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  description  :text
#  collector_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class ArtCollectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
