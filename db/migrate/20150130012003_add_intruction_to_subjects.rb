class AddIntructionToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :intruction, :string
  end
end
