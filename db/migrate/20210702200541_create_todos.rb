class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :text
      t.boolean :isComplited
      t.belongs_to :project, index: true

      t.timestamps
    end
  end
end
