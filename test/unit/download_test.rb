require 'test_helper'

class DownloadTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: downloads
#
#  id          :integer(4)      not null, primary key
#  user_id     :integer(4)
#  document_id :integer(4)
#  enabled_at  :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

