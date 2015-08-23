class Participant < ActiveRecord::Base
  validates :email, :display_name,
    uniqueness: true, presence: true, allow_blank: false
end
