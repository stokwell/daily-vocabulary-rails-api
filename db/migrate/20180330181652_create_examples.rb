class CreateExamples < ActiveRecord::Migration[5.1]
  def change
    create_table :examples do |t|
      t.text :body
      t.references :user
      t.references :word
      t.timestamps
    end
  end
end
