require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end




# == Schema Information
#
# Table name: pages
#
#  id           :integer(4)      not null, primary key
#  title        :string(255)     default("Untitled"), not null
#  content      :text
#  slug         :string(255)
#  published_at :string(255)
#  status       :string(255)     default("unpublished")
#  admin_id     :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#  metatags     :text
#  head_title   :string(255)
#

