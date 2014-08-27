class AddPlanToMembers < ActiveRecord::Migration
  def change
    add_column :members, :plan, :string
  end
end
