class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.belongs_to :user, null: false, foreign_key: :true
      t.belongs_to :chat, null: false, foreign_key: :true
      t.text :text

      t.timestamps
    end
  end
end
