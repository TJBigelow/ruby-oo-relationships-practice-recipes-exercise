class Ingredient
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.most_common_allergen
        self.all.max_by {|a| Allergy.all.count{|i| i.ingredient == a}}.name
    end
end
