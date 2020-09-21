class User
    @@all = []

    def initialize(name)
        @name = name
    end
    
    def self.all
        @@all
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(date, rating, self, recipe)
    end

    def declare_allergy(ingredient)
        Allergy.new(self, ingredient)
    end

    def allergens
        Allergy.all.select {|a| a.user == self}.map{|i| i.ingredient.name}
    end
    
    def recipe_cards
        RecipeCard.all.select {|r| r.user == self}
    end

    def recipes
        rec = self.recipe_cards
        rec.map {|r| r.recipe}
    end

    def top_three_recipes
        rec = self.recipe_cards
        rec.max_by(3) {|r| r.rating}
    end

    def most_recent_recipe
        self.recipe_cards.max_by {|r| r.date}
    end

    def safe_recipes
        allergens = Allergy.all.select{|a| a.user == self}.map{|i| i.ingredient}
        Recipe.all.reject{|r| r.ingredients.count{|i| allergens.include?(i)} > 0}
    end
end