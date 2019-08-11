class CreateDataPoints < ActiveRecord::Migration[6.0]
  def change
    create_table :data_points do |t|
      t.references :data_set
      t.string :headline
      t.string :description
      t.float :value
      t.string :unit_code
      t.references :reference

      t.timestamps
    end
  end
end
