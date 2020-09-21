class RecipeIngredient
    attr_accessor :ingredient, :recipe
    @@all = []
    def initialize(ingredient, recipe)
        @ingredient = ingredient
        @recipe = recipe
        self.class.all << self
    end

    def self.all
        @@all
    end

end