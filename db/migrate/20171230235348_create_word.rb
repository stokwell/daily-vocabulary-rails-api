class CreateWord < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
      t.jsonb :article
      t.references :user
      t.string :to
      t.string :from
      t.string :original
      t.string :translation
      t.string :transcription
      t.timestamps
    end
  end
end
