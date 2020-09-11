# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Solve.create(seconds: "15.00", scramble: "Easy")
#Solve.create(seconds: "20.00", scramble: "Medium")
#Solve.create(seconds: "25.00", scramble: "Hard")

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'example_solves.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
   s = Solve.new
   s.seconds = row['seconds']
   s.scramble = row['scramble']
   s.save
   puts "#{s.seconds}, #{s.scramble} saved"
end
puts "There are now #{Solve.count} rows in the solves table"