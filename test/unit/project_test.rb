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
#  id                    :integer(4)      not null, primary key
#  project_type          :string(255)     default("preliminary"), not null
#  state                 :string(255)     default("unpublished"), not null
#  description           :text
#  published_at          :datetime
#  issuer                :string(255)
#  bond_amount           :decimal(12, 2)
#  sale_type             :string(255)     default("competitive")
#  status                :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  user_id               :integer(4)
#  delivery_date         :datetime
#  document_file_name    :string(255)
#  document_file_size    :integer(4)
#  document_content_type :string(255)
#  document_updated_at   :datetime
#  underwriters          :string(255)
#  ratings               :string(255)
#

