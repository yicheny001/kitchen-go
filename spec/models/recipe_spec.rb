require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "#title" do
    let(:recipe) { Recipe.create(title: "delicious and nutritious crab cakes") }
    it "capitalizes each word in the title" do
      expect(recipe.title).to eq("Delicious And Nutritious Crab Cakes")
    end
  end

  describe ".most_bookmarked" do
    let(:author) { Author.create(user: User.create(name: "Shonuff", password: "password"))}
    let(:recipes) { FactoryGirl.create_list(:recipe, 4, author_id: author.id) }
    before do  
      FactoryGirl.create_list(:bookmark, 4, recipe: recipes[0], reader: Reader.create(user: User.create(name:'tom', password:'jerry')))
      FactoryGirl.create_list(:bookmark, 3, recipe: recipes[1], reader: Reader.create(user: User.create(name:'tom', password:'jerry')))
      FactoryGirl.create_list(:bookmark, 1, recipe: recipes[2], reader: Reader.create(user: User.create(name:'tom', password:'jerry')))
      FactoryGirl.create_list(:bookmark, 1, recipe: recipes[3], reader: Reader.create(user: User.create(name:'tom', password:'jerry')))
    end

    it "returns the top X number of most bookmarked recipes" do
      author.recipes = recipes
      expect(Recipe.most_bookmarked(1)[0][0]).to eq("Tuna Salad") 
    end
  end

  describe ".most_recent" do
    let(:author) { Author.create(user: User.create(name: "Bojangles", password: "password"))}
    it "returns the title(s) of the most recent X number of posted recipe" do
      recipe1 = Recipe.create(title: "Recent Recipe", author_id: author.id )
      recipe2 = Recipe.create(title: "Most Recent Recipe", author_id: author.id )
      expect(Recipe.most_recent(1).first.title).to eq(recipe2.title)
    end
  end
end

