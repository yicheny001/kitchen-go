require 'rails_helper'

RSpec.describe Author, type: :model do
	describe '#most_liked' do
		let(:author) { Author.create(user: User.create(name:'avi', password:'flatiron'))}
		let(:recipes) {FactoryGirl.create_list(:recipe, 3, author_id: author.id) }
		before do  
			FactoryGirl.create_list(:bookmark, 2, recipe: recipes[0], reader: Reader.create(user: User.create(name:'tom', password:'jerry')))
			FactoryGirl.create_list(:bookmark, 3, recipe: recipes[1], reader: Reader.create(user: User.create(name:'tom', password:'jerry')))
			FactoryGirl.create_list(:bookmark, 1, recipe: recipes[2], reader: Reader.create(user: User.create(name:'tom', password:'jerry')))
		end
		it 'shows the most_liked for an author' do
			author.recipes = recipes
			most_popular_recipe = author.recipes.second
			expect(author.most_liked).to eq(most_popular_recipe)
		end
	end
end
