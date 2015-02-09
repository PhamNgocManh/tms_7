class Subject < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :subject_courses, dependent: :destroy
  has_many :courses, through: :subject_courses
  validates :name, presence: true, length: {maximum: 50}, uniqueness: true
  accepts_nested_attributes_for :tasks,
    reject_if: proc {|attributes| attributes['name'].blank?},
    allow_destroy: true
end
