class Course < ActiveRecord::Base
  has_many :user_courses, dependent: :destroy
  has_many :subject_courses, dependent: :destroy
  has_many :users, through: :user_courses
  has_many :subjects, through: :subject_courses
  accepts_nested_attributes_for :user_courses, allow_destroy: true
  accepts_nested_attributes_for :subject_courses, allow_destroy: true
  validates :name, presence: true, uniqueness: true

  def user_course_id user
    UserCourse.where(course: self, user: user).first.try(:id)
  end

  def subject_course_id subject
    SubjectCourse.where(course: self, subject: subject).first.try(:id)
  end
end
