class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :doctor #doctor_id
      t.references :patients #patient_id
      t.date :date
    end
  end
end
