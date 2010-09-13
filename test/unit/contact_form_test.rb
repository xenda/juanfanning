require 'test_helper'

class ContactFormTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: contact_forms
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  email      :string(255)
#  phone      :string(255)
#  company    :string(255)
#  message    :text
#  created_at :datetime
#  updated_at :datetime
#

