class AddFirstNameToMembers < ActiveRecord::Migration
  def change
    add_column :members, :first_name, :string
  end
end
