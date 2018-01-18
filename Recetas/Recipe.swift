//
//  Recipe.swift
//  Recetas
//
//  Created by Aldo Aram Martinez Mireles on 1/9/18.
//  Copyright © 2018 Aldo Aram Martinez Mireles. All rights reserved.
//

import Foundation
import UIKit

class Recipe: NSObject{
    
    var name: String!
    var time: Int!
    var ingredients: [String]!
    var image : UIImage!
    var steps : [String]!
    var rate : UIImage!
    var taste : String!
    
    init(name: String, image: UIImage, time: Int, ingredients: [String], steps: [String]) {
        self.name = name
        self.image = image
        self.time = time
        self.ingredients = ingredients
        self.steps = steps
    }
    
}
