class AddTimestampsToRides < ActiveRecord::Migration
  def change
    add_column :rides, :created_at, :datetime
    add_column :rides, :updated_at, :datetime
  end
end
