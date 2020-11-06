# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_06_084901) do

  create_table "names", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "result_no"
    t.integer "round_no"
    t.integer "player_id"
    t.integer "link_no"
    t.string "name"
    t.string "player"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["result_no", "round_no", "name"], name: "resultno_name"
    t.index ["result_no", "round_no", "player"], name: "resultno_player"
    t.index ["result_no", "round_no", "player_id"], name: "resultno_playerid"
  end

  create_table "proper_names", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "proper_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_proper_names_on_name"
    t.index ["proper_id"], name: "index_proper_names_on_proper_id"
  end

  create_table "uploaded_checks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "result_no"
    t.integer "round_no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["result_no", "round_no"], name: "resultno_roundno"
  end

end
