require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: departments
#
#  id              :integer(4)      not null, primary key
#  size            :string(255)
#  bathroom_number :string(255)
#  garages_number  :string(255)
#  rooms_number    :string(255)
#  project_id      :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#

