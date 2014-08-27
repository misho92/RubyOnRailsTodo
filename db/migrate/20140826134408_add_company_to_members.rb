class AddCompanyToMembers < ActiveRecord::Migration
  def change
    add_column :members, :company, :string
  end
end
