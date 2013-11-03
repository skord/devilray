class CreateMantaAccounts < ActiveRecord::Migration
  def change
    create_table :manta_accounts do |t|
      t.string :manta_username
      t.string :manta_host
      t.text :manta_private_key
      t.references :user, index: true

      t.timestamps
    end
  end
end
