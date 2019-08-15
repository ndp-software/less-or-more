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

csv = CSV.read("db/fixtures/states.csv", headers: true)

csv.each do |line|
  DataPoint.create!(
      data_set: data_set,
      headline: "Year of #{line['state']}",
      description: "Date #{line['state']} was admitted to the United States of America",
      value: Time.new(line['admission_date']).year,
      unit_code: 'time.date.year',
  )
  DataPoint.create!(
      data_set: data_set,
      headline: "Population of #{line['state']}",
      description: "Population of #{line['state']} as of ?",
      value: line['population'],
      unit_code: 'population',
  )
end


reference = Reference.create!(headline: 'University of Pennsylvania Economics - Global Economics', body_md: '[University of Pennsylvania Economics - Global Economics](https://public.enigma.com/datasets/university-of-pennsylvania-economics-global-economics/11550ebf-e6ba-4bc7-ad84-5d43c18ee291)')

data_set = DataSet.create!(name: 'Country Population 1951-2000', reference: reference)

csv = CSV.read("db/fixtures/54966a73-5283-4898-b9a4-4e0500e75341_UniversityofPennsylvaniaEconomics-GlobalEconomics.csv", headers: true)

csv.each do |line|
  next if line['pop'].blank?
  DataPoint.create!(
      data_set: data_set,
      headline: "#{line['country']} population (#{line['year']})",
      description: "Population of #{line['country']} in #{line['year']}",
      value: (1000.0 * Float(line['pop'])).round,
      at: Time.new(line['year']),
      unit_code: 'population',
      )
end


exit

require 'net/http'
uri = URI('https://www.thefamouspeople.com/died-at-51.php')
source = Net::HTTP.get(uri)
document = Nokogiri::HTML.parse(source)





