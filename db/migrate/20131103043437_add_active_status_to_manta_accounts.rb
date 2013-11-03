class AddActiveStatusToMantaAccounts < ActiveRecord::Migration
  def change
    add_column :manta_accounts, :active, :boolean
  end
end
