class CreateOperations < ActiveRecord::Migration[6.1]
  def change
    create_table :operations do |t|
      t.belongs_to :utilisateur, foreign_key: true
      t.string  :type_operation
      t.integer :montant
      t.text    :motif
      t.date    :ladate
      t.timestamps
    end
  end
end
