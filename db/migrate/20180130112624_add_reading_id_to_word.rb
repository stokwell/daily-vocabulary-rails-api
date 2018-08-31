class AddReadingIdToWord < ActiveRecord::Migration[5.1]
  def change
    add_reference :words, :reading, index: true
  end
end
