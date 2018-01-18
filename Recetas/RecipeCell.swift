//
//  RecipeCell.swift
//  Recetas
//
//  Created by Aldo Aram Martinez Mireles on 1/10/18.
//  Copyright © 2018 Aldo Aram Martinez Mireles. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    @IBOutlet var recipeView: UIImageView!
    @IBOutlet var nameRecipe: UILabel!
    @IBOutlet var timeRecipe: UILabel!
    @IBOutlet var ingredientsRecipe: UILabel!

}

class FullRecipeCell: UITableViewCell{
    
    @IBOutlet var recipeImage: UIImageView!
    @IBOutlet var recipeName: UILabel!
}

