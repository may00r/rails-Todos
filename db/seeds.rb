# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



data = HashWithIndifferentAccess.new(YAML::load_file(File.join(Rails.root, 'db', 'seeds.yml')))

    data[:projects].each do |project|
        p = Project.new(title: project[:title])
        project[:todos].each do |todo|
            p.todos << Todo.create(text: todo[:text], isComplited: false, project_id: p.id)
        end
        p.save!
    end