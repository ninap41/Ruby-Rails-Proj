class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :caption #pretend it's comment
  

      t.timestamps 
    end
  end
end
