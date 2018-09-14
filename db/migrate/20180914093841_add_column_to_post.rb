class AddColumnToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :future_date, :date
  end
end
