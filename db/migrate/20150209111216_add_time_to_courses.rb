class AddTimeToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :start_time, :datetime
    add_column :courses, :finish_time, :datetime
  end
end
