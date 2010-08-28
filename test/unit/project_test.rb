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
#  state                 :string(255)     default("0"), not null
#  description           :text
#  published_at          :datetime
#  issuer                :string(255)
#  bond_amount           :decimal(12, 2)
#  sale_type             :string(255)     default("competitive")
#  status                :string(255)     default("unpublished")
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
#  preview_file_name     :string(255)
#  preview_file_size     :integer(4)
#  preview_content_type  :string(255)
#  preview_updated_at    :datetime
#  cusip                 :string(255)
#  delta                 :boolean(1)      default(TRUE), not null
#  bond_number           :string(255)
#

