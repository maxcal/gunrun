require 'rails_helper'

RSpec.describe Participant, type: :model do
  it { should validate_uniqueness_of :email }
  it { should validate_uniqueness_of :display_name }
  it { should validate_presence_of :display_name }
  it { should validate_presence_of :email }
end
