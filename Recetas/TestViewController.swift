//
//  TestViewController.swift
//  Recetas
//
//  Created by Aldo Aram Martinez Mireles on 1/10/18.
//  Copyright © 2018 Aldo Aram Martinez Mireles. All rights reserved.
//

import UIKit

class TestViewController: UITableViewController{
    var recipes: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var recipe = Recipe(name: "Pizza con carne italiana", image: #imageLiteral(resourceName: "pizza"), time: 60,
                            ingredients:["Harina", "Queso", "Peperonni", "Carne Italiana"],
                            steps: ["Darle forma a la masa", "Agregarle el queso, el pepeorinni y la carne italiana", "Hornear por 30 min."])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Tacos de trompo", image: #imageLiteral(resourceName: "tacos"), time: 20, ingredients: ["Tortilla de maiz", "trompo"], steps: ["Dorar la tortilla en el comal", "Agregarle trompo a la tortilla y dejar cocer"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Campechana", image: #imageLiteral(resourceName: "campechana") , time: 15, ingredients: ["Tortilla de harina", "Trompo", "Bisteck", "Queso"], steps: ["Calentar tortilla de harina en el comal", "Agregar el queso y esperar a que se derrita", "Agregar trompo y bisteck"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Enchiladas", image: #imageLiteral(resourceName: "enchiladas"), time: 45, ingredients: ["Tortilla roja", "queso", "Salsa de tomate", "Aceite"], steps: ["Agregar aceite en un sarten y dejar que se caliente", "Pasar las tortillas rojas por la salsa de tomate","Rellenar la tortilla con queso", "Dorar las tortillas en el sarten", "Por ultimo, Espolvorear queso arriba de las enchiladas"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Flautas", image: #imageLiteral(resourceName: "flautas"), time: 35, ingredients: ["Tortilla de maiz", "Carne Deshebrada","Crema", "Aguacate", "Sal", "Aceite", "Leche"], steps: ["Calentar el aceite en el sarten", "Calentar tortillas de maiz", "Agregra carne a la tortilla y hacer el taco","Se licua leche con aguacate para crear el guacamole", "Freir el taco en el sarten", "Servir en el plato", "Agregar el guacamole y la crema al gusto" ])
        recipes.append(recipe)
        
        
        
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "FullRecipe"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! FullRecipeCell
        
        cell.recipeImage.image = recipe.image
        cell.recipeName.text = recipe.name
        
        
        return cell
    }
}
