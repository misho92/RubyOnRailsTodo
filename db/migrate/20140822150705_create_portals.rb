class CreatePortals < ActiveRecord::Migration
  def change
    create_table :portals do |t|
      t.string :paymentMethod
      t.string :nameOnCard
      t.string :cardNumber
      t.string :CVC
      t.string :validUntil
      t.string :accountOwner
      t.string :BIC
      t.string :IBAN
      t.string :bankNo
      t.string :plan
      t.string :registered
      t.integer:user_id
    end
  end
end
