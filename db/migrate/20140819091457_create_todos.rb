class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :todo
      t.string :done
      t.integer:user_id
    end
  end
end
