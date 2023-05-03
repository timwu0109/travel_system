class CreateChNames < ActiveRecord::Migration[6.1]
  def change
    create_table :ch_names do |t|
      t.string :en_name
      t.string :phone_number
      t.datetime :b_day
      t.string :passport_number
      t.datetime :passport_date
      t.string :passport_photo
      t.string :travel_url
      t.string :other

      t.timestamps
    end
  end
end
