class AddInstructionToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :instruction, :string, length: 500
  end
end
