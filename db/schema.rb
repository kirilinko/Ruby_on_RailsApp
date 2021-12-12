# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_10_131437) do

  create_table "operations", charset: "utf8", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.bigint "utilisateur_id"
    t.string "type_operation"
    t.integer "montant"
    t.text "motif"
    t.date "ladate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["utilisateur_id"], name: "index_operations_on_utilisateur_id"
  end

  create_table "utilisateurs", charset: "utf8", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "identifiant"
    t.string "motdepasse"
    t.string "nom"
    t.integer "ttenter", default: 0
    t.integer "ttsortit", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
