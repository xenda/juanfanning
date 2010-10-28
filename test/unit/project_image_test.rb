require 'test_helper'

class ProjectImageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Information
#
# Table name: project_images
#
#  id                 :integer(4)      not null, primary key
#  project_id         :integer(4)
#  image_file_name    :string(255)
#  image_file_size    :integer(4)
#  image_content_type :string(255)
#  image_updated_at   :datetime
#  created_at         :datetime
#  updated_at         :datetime
#  temp_id            :string(255)
#

