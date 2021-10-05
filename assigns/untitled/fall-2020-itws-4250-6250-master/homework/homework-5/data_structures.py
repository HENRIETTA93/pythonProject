
# Represents the information necessary to prepare a recipe
# The list of ingredients should be a list of tuples of the form (IngredientName, IngredientAmount)
class RecipeInstructions():
    def __init__(self, name, instructions, ingredients):
        self.name = name
        self.instructions = instructions
        self.ingredients = ingredients
