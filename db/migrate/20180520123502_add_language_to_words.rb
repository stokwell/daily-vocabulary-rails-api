class AddLanguageToWords < ActiveRecord::Migration[5.1]
  def change
    add_column :words, :language, :string
  end
end
