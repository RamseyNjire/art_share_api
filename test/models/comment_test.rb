# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  artwork_id   :integer          not null
#  commenter_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  body         :text             not null
#
require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
