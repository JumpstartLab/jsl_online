class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string   :title
      t.text     :description
      t.string   :status, default: "pending"
      t.datetime :start_date
      t.datetime :end_date
      t.decimal  :price, default: 0
      t.string   :tickets_url

      t.timestamps
    end
  end
end
