class Recipe
    attr_accessor :name
    @@all = []
    def initialize(name, ingredients)
        @name = name
        ingredients.each {|i| RecipeIngredient.new(i, self)}
        self.class.all << self
    end

    def self.all
        @@all
    end
    
    def users
        RecipeCard.all.select {|r| r.recipe == self}
    end

    def ingredients
        RecipeIngredient.all.select {|r| r.recipe == self}.map{|i| i.ingredient}
    end

    def self.most_popular
        self.all.max_by {|r| RecipeCard.all.count{|i| i.recipe == r}}.name
    end

    def add_ingredients(ing)
        ing.each {|i| RecipeIngredient.new(i, self)}
    end

    def allergens
        Allergy.all.select {|i| self.ingredients.include?(i.ingredient)}
    end

end