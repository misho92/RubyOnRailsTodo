class CreatePortals < ActiveRecord::Migration
  def change
    create_table :portals do |t|
      t.string :payment
      t.string :name_on_card
      t.string :card_number
      t.string :CVC
      t.string :valid_until
      t.string :owner_of_account
      t.string :BIC
      t.string :IBAN
      t.string :bank_account_number
      t.string :plan
      t.string :registered
      t.integer:user_id
    end
  end
end
