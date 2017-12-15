class Contract < ActiveRecord::Base
  validates :address, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1 }
  validates_inclusion_of :percent, in: 1..100, message: 'must be in percents'
  validates_inclusion_of :status, in: %w[new pending]

  belongs_to :client
end
