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

ActiveRecord::Schema.define(version: 2020_11_17_072247) do

  create_table "all_use_skills", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.integer "result_no"
    t.integer "round_no"
    t.integer "battle_no"
    t.string "skill_concatenate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["result_no", "round_no", "battle_no"], name: "resultno_battleno"
  end

  create_table "chara_use_skills", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.integer "result_no"
    t.integer "round_no"
    t.integer "battle_no"
    t.integer "link_no"
    t.string "skill_concatenate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "skill_concatenate_ex"
    t.integer "seclusion_skill_id"
    t.index ["result_no", "round_no", "battle_no", "link_no"], name: "resultno_battleno_linkno"
    t.index ["result_no", "round_no", "link_no"], name: "resultno_linkno"
  end

  create_table "matchings", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.integer "result_no"
    t.integer "round_no"
    t.integer "battle_no"
    t.integer "left_link_no"
    t.integer "right_link_no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["result_no", "round_no", "battle_no"], name: "resultno_battleno"
    t.index ["result_no", "round_no", "left_link_no"], name: "resultno_leftlinkeno"
    t.index ["result_no", "round_no", "right_link_no"], name: "resultno_rightlinkeno"
  end

  create_table "name_dummies", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.integer "result_no"
    t.integer "round_no"
    t.integer "player_id"
    t.integer "link_no"
    t.string "name"
    t.string "player"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["result_no", "round_no", "link_no"], name: "resultno_linkno"
    t.index ["result_no", "round_no", "name"], name: "resultno_name"
    t.index ["result_no", "round_no", "player"], name: "resultno_player"
    t.index ["result_no", "round_no", "player_id"], name: "resultno_playerid"
  end

  create_table "names", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.integer "result_no"
    t.integer "round_no"
    t.integer "player_id"
    t.integer "link_no"
    t.string "name"
    t.string "player"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["result_no", "round_no", "link_no"], name: "resultno_linkno"
    t.index ["result_no", "round_no", "name"], name: "resultno_name"
    t.index ["result_no", "round_no", "player"], name: "resultno_player"
    t.index ["result_no", "round_no", "player_id"], name: "resultno_playerid"
  end

  create_table "proper_names", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.integer "proper_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_proper_names_on_name"
    t.index ["proper_id"], name: "index_proper_names_on_proper_id"
  end

  create_table "skill_concatenates", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.integer "result_no"
    t.integer "round_no"
    t.integer "link_no"
    t.string "skill_concatenate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["result_no", "round_no", "link_no"], name: "resultno_linkno"
  end

  create_table "skill_lists", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.integer "skill_id"
    t.string "name"
    t.integer "result_no"
    t.integer "skill_type"
    t.integer "ap"
    t.string "text"
    t.integer "is_physics"
    t.integer "is_fire"
    t.integer "is_aqua"
    t.integer "is_wind"
    t.integer "is_quake"
    t.integer "is_light"
    t.integer "is_dark"
    t.integer "is_poison"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ap"], name: "index_skill_lists_on_ap"
    t.index ["is_aqua"], name: "index_skill_lists_on_is_aqua"
    t.index ["is_dark"], name: "index_skill_lists_on_is_dark"
    t.index ["is_fire"], name: "index_skill_lists_on_is_fire"
    t.index ["is_light"], name: "index_skill_lists_on_is_light"
    t.index ["is_physics"], name: "index_skill_lists_on_is_physics"
    t.index ["is_poison"], name: "index_skill_lists_on_is_poison"
    t.index ["is_quake"], name: "index_skill_lists_on_is_quake"
    t.index ["is_wind"], name: "index_skill_lists_on_is_wind"
    t.index ["name"], name: "index_skill_lists_on_name"
    t.index ["result_no", "name"], name: "resultno_name"
    t.index ["result_no", "skill_id"], name: "resultno_skillid"
    t.index ["skill_id"], name: "index_skill_lists_on_skill_id"
    t.index ["skill_type"], name: "index_skill_lists_on_skill_type"
  end

  create_table "skills", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.integer "result_no"
    t.integer "round_no"
    t.integer "link_no"
    t.integer "skill_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["result_no", "round_no", "link_no", "skill_id"], name: "resultno_linkno"
    t.index ["result_no", "skill_id"], name: "resultno_skillid"
  end

  create_table "uploaded_checks", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.integer "result_no"
    t.integer "round_no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["result_no", "round_no"], name: "resultno_roundno"
  end

end
