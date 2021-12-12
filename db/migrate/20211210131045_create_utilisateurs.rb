class CreateUtilisateurs < ActiveRecord::Migration[6.1]
  def change
    create_table :utilisateurs do |t|
      t.string :identifiant
      t.string :motdepasse
      t.string :nom
      t.integer :ttenter , :default => 0
      t.integer :ttsortit, :default => 0
      

      t.timestamps
    end
  end
end
