class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :email
      t.string :user_id
    end
  end
end
