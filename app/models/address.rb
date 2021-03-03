class Address < ApplicationRecord
  belongs_to :user

  validates :address, :coordinate, presence: true

  enum share_type: {publiced: 'public', privated: 'private', selected: 'selected'}
end
