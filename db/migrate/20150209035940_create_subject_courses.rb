class CreateSubjectCourses < ActiveRecord::Migration
  def change
    create_table :subject_courses do |t|
      t.integer :course_id
      t.integer :subject_id

      t.timestamps null: false
    end
  end
end
