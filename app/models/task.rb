class Task < ActiveRecord::Base
  belongs_to :subject
  validates :name, presence: true, length: {maximum: 100}
end
