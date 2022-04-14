# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Trajet.destroy_all
trajet_1 = Trajet.create!({origin_addresse: "Fort-de-france", destination_addresse: "Lamentin",time: "now", courant: true})
trajet_2 = Trajet.create!({origin_addresse: "Fort-de-france", destination_addresse: "Trinité Marintiq",time: "now", courant: true})
trajet_3 = Trajet.create!({origin_addresse: "Lamentin martinique", destination_addresse: "rivière-salée martinique",time: "now", courant: true})
trajet_4 = Trajet.create!({origin_addresse: "Marin Martinique", destination_addresse: "François Martinique",time: "now", courant: true})
trajet_5 = Trajet.create!({origin_addresse: "Rivière-salée Martinique", destination_addresse: "Trois-îlets martinique",time: "now", courant: true})
trajet_6 = Trajet.create!({origin_addresse: "Rivière-salée Martinique", destination_addresse: "Le Marin martinique",time: "now", courant: true})
trajet_7 = Trajet.create!({origin_addresse: "Fort-de-france Martinique", destination_addresse: "Saint-pierre martinique",time: "now", courant: true})
