# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Carregando o seeds"
Restaurante.destroy_all
especialidades = %w{massas japonês vegetariano}
    50.times do |i|
        Restaurante.create!(
        nome: "Restaurante #{Faker::Company.name}",
        endereco: "Rua #{Faker::Address.street_name}",
        especialidade: especialidades.sample
        )
    end
 



puts "Todos os dados criados com sucesso .... [OK]"