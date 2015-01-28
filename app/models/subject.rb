class Subject < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  validates :name, presence: true, length: {maximum: 50}, uniqueness:true
end
