class AddOrderAndCompletedToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :priority, :integer
    add_column :tasks, :completed, :boolean, :default => false
  end
end
