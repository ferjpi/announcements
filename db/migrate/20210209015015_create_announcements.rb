class CreateAnnouncements < ActiveRecord::Migration[6.0]
  def change
    create_table :announcements do |t|
      t.text :content, required: true, null: false
      t.date :expire, required: true, null: false
      t.boolean :seen, default: false
      t.integer :user_id

      t.timestamps
    end
  end
end
