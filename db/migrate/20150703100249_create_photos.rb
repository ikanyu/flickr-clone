class CreatePhotos < ActiveRecord::Migration
  def change
  	create_table :photos do |t|
  		t.string :name
  		t.string :album_id
  		t.string :path

  		t.timestamps null:false
  	end
  end
end
