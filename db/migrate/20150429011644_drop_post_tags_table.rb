class DropPostTagsTable < ActiveRecord::Migration
  def up
    drop_table :posts_tags
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
