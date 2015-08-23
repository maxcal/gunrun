class Participant < ActiveRecord::Base
  validates :email, :display_name, uniqueness: true
  validates :display_name, presence: true, allow_blank: false
end
