class CreateJoinTablePostTag < ActiveRecord::Migration
  def change
    create_join_table :posts, :tags do |t|
      t.index :tag_id
      t.index :post_id
    end
  end
end
