class CreateReferences < ActiveRecord::Migration[6.0]
  def change
    create_table :references do |t|
      t.string :headline
      t.string :body_md

      t.timestamps
    end
  end
end
