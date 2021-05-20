# == Schema Information
#
# Table name: collections
#
#  id                :bigint           not null, primary key
#  artwork_id        :bigint           not null
#  art_collection_id :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require 'test_helper'

class CollectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
