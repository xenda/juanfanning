require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end



















# == Schema Information
#
# Table name: projects
#
#  id                  :integer(4)      not null, primary key
#  state               :string(255)     default("0"), not null
#  description         :text
#  published_at        :datetime
#  status              :string(255)     default("unpublished")
#  created_at          :datetime
#  updated_at          :datetime
#  admin_id            :integer(4)
#  banner_file_name    :string(255)
#  banner_content_type :string(255)
#  banner_file_size    :integer(4)
#  banner_updated_at   :datetime
#  name                :string(255)     default("Proyecto")
#  code                :string(255)
#  sales_price         :decimal(8, 2)   default(0.0)
#  property_type       :string(255)     default("departamento")
#  terrain_area        :integer(4)      default(0)
#  constructed_area    :integer(4)      default(0)
#  rooms               :integer(4)      default(0)
#  bathrooms           :integer(4)      default(0)
#  garages             :integer(4)      default(0)
#  construction_year   :date
#  floors_per_building :integer(4)      default(0)
#  with_furniture      :boolean(1)      default(FALSE)
#  lat                 :string(255)
#  long                :string(255)
#  address             :string(255)
#

