class RemoveIconFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :icon, :string
  end
end
