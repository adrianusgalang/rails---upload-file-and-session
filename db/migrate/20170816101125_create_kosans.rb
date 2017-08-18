class CreateKosans < ActiveRecord::Migration[5.0]
  def change
    create_table :kosans do |t|
      t.string :nama
      t.string :lokasi
      t.text :deskripsi
      t.string :harga
      t.string :gambar
      t.string :kontak

      t.timestamps
    end
  end
end
