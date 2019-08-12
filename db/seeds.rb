# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
DataPoint.delete_all
DataSet.delete_all
Reference.delete_all

reference = Reference.create!(headline: 'CivilServiceUSA', body_md: '[Web site](https://github.com/CivilServiceUSA) [data set](https://github.com/CivilServiceUSA/us-states/blob/master/data/states.csv)')

data_set = DataSet.create!(name: 'U.S. State Admission Date', reference: reference)

csv = CSV.read("db/fixtures/states.csv", headers:true)

csv.each do |line|
  DataPoint.create!(
      data_set: data_set,
      headline: "Year of #{line['state']}",
      description: "Date #{line['state']} was admitted to the United States of America",
      value: line['admission_date'],
      unit_code: 'date',
  )
  DataPoint.create!(
      data_set: data_set,
      headline: "Population of #{line['state']}",
      description: "Population of #{line['state']} as of ?",
      value: line['population'],
      unit_code: 'population',
  )
end



