class Task < ActiveRecord::Base
  belongs_to :subject
  validates :subject_id, presence: true
  validates :name, presence: true, length: { maximum: 100 }
end
