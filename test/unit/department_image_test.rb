require 'test_helper'

class DepartmentImageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: department_images
#
#  id                 :integer(4)      not null, primary key
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#  department_id      :integer(4)
#  temp_id            :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

