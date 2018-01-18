//
//  ViewController.swift
//  Recetas
//
//  Created by Aldo Aram Martinez Mireles on 1/9/18.
//  Copyright © 2018 Aldo Aram Martinez Mireles. All rights reserved.
//

import UIKit

class ViewController: UITableViewController{
    
    var recipes: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //darle nombre y estilo al boton de regresar de la barra de navegacion
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        var recipe = Recipe(name: "Pizza con carne italiana", image: #imageLiteral(resourceName: "pizza"), time: 60,
                            ingredients:["Harina", "Queso", "Peperonni", "Carne Italiana"],
                            steps: ["Darle forma a la masa", "Agregarle el queso, el peperoni y la carne italiana", "Hornear por 30 min."])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Tacos de trompo", image: #imageLiteral(resourceName: "tacos"), time: 20, ingredients: ["Tortilla de maiz", "trompo"], steps: ["Dorar la tortilla en el comal", "Agregarle trompo a la tortilla y dejar cocer"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Campechana", image: #imageLiteral(resourceName: "campechana") , time: 15, ingredients: ["Tortilla de harina", "Trompo", "Bisteck", "Queso"], steps: ["Calentar tortilla de harina en el comal", "Agregar el queso y esperar a que se derrita", "Agregar trompo y bisteck"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Enchiladas", image: #imageLiteral(resourceName: "enchiladas"), time: 45, ingredients: ["Tortilla roja", "Queso", "Salsa de tomate", "Aceite"], steps: ["Agregar aceite en un sarten y dejar que se caliente", "Pasar las tortillas rojas por la salsa de tomate","Rellenar la tortilla con queso", "Dorar las tortillas en el sarten", "Por ultimo, Espolvorear queso arriba de las enchiladas"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Flautas", image: #imageLiteral(resourceName: "flautas"), time: 35, ingredients: ["Tortilla de maiz", "Carne Deshebrada","Crema", "Aguacate", "Sal", "Aceite", "Leche"], steps: ["Calentar el aceite en el sarten", "Calentar tortillas de maiz", "Agregar carne a la tortilla y hacer el taco","Se licua leche con aguacate para crear el guacamole", "Freir el taco en el sarten", "Servir en el plato", "Agregar el guacamole y la crema al gusto" ])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Sopes", image: #imageLiteral(resourceName: "sopes"), time: 40, ingredients: ["Deshebrada", "Sope de maiz", "Frijoles"], steps: ["Calentar sope y dorar", "Agregra frijoles al gusto", "Agregar deshebrada al gusto"])
        recipes.append(recipe)
        
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Esconde la barra de navegacion al deslizar
        navigationController?.hidesBarsOnSwipe = true
        //Configuramos que aparezca la barra de navegacion cada que regresamos a la vista
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*Funciones de UITableViewDataSource*/

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeCell
        cell.recipeView.image = recipe.image
        cell.nameRecipe.text = recipe.name
        cell.timeRecipe.text = "Tiempo de coccion: \(recipe.time!) minutos"
        cell.ingredientsRecipe.text = "\(recipe.ingredients.count) ingredientes"
        
        /*if recipe.isFavorite{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        cell.recipeView.layer.cornerRadius = 44.0
        cell.recipeView.clipsToBounds = true*/
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            self.recipes.remove(at: indexPath.row)
        }
        
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //Compartir
        let shareAction = UITableViewRowAction(style: .normal, title: "Compartir") { (action, indexPath) in
            let defaultText = "Les comparto el platillo \(self.recipes[indexPath.row].name!) que esta muy delicioso."
            
            let activity = UIActivityViewController(activityItems: [defaultText, self.recipes[indexPath.row].image!], applicationActivities: nil)
            
            self.present(activity, animated: true, completion: nil)
        }
        shareAction.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        //Boton borrar
        let eraseAction = UITableViewRowAction(style: .default, title: "Eliminar") { (action, indexPath) in
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        eraseAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        
        
        return [eraseAction, shareAction]
    }
    
    /*Funciones de UITableViewDelegate*/
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*let recipe = recipes[indexPath.row]
        let alert = UIAlertController(title: recipe.name, message: "¿Es uno de tus platillos favoritos?", preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        var favoriteTitle = "Favorito"
        var favoriteStyle = UIAlertActionStyle.default
        
        if recipe.isFavorite {
            favoriteTitle = "No es Favorito"
            favoriteStyle = .destructive
        }
        
        let favoriteAction = UIAlertAction(title: favoriteTitle, style: favoriteStyle) { (action) in
            recipe.isFavorite = !recipe.isFavorite
            self.tableView.reloadData()
        }
        
        alert.addAction(favoriteAction)
        alert.addAction(cancelButton)
        present(alert, animated: true, completion: nil)*/
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueRecipeDetail"{
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let destinationView = segue.destination as! ViewDetailRecipeController
                destinationView.recipe = recipes[indexPath.row]
            }
        }
    }

}

