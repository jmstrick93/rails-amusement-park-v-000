class ChangeRidesTimestampNullToFalse < ActiveRecord::Migration
  def change
    change_column_null :rides, :created_at, false
    change_column_null :rides, :updated_at, false
  end
end
