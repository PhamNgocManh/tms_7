class Subject < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 50}, uniqueness:true
  validates :start_at, presence: true
end
