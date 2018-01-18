//
//  ViewDetailRecipeController.swift
//  Recetas
//
//  Created by Aldo Aram Martinez Mireles on 1/14/18.
//  Copyright © 2018 Aldo Aram Martinez Mireles. All rights reserved.
//

import UIKit

class ViewDetailRecipeController: UIViewController {
    @IBOutlet var Image: UIImageView!
    @IBOutlet var tableView: UITableView!
    var recipe : Recipe!
    @IBOutlet var rateImage: UIImageView!
    var rating:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = recipe.name
        self.Image.image = recipe.image
        self.tableView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorColor = #colorLiteral(red: 0.02140066964, green: 0.7696986607, blue: 0.2614397321, alpha: 0.4359870158)
        self.rateImage.image = recipe.rate
        if recipe.rate != nil{
            self.rateImage.backgroundColor = #colorLiteral(red: 0.06141562195, green: 0.8064281088, blue: 0.2993016536, alpha: 1)
        }else{
            self.rateImage.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        }
        //Le damos una valor de altura estimado para cada celda
        self.tableView.estimatedRowHeight = 44
        //Le decimos que ajuste la altura de la celda de acuerdo a la informacion que contenga
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func close(segue: UIStoryboardSegue){
        if let rateViewController = segue.source as? RateRecipeViewController{
            if let rate = rateViewController.recipeRate{
                self.recipe.rate = UIImage(named: rate)
                self.rateImage.image = self.recipe.rate
                self.rateImage.backgroundColor = #colorLiteral(red: 0.06141562195, green: 0.8064281088, blue: 0.2993016536, alpha: 1)
                
                self.recipe.taste = rate
                self.tableView.reloadData()
            }
        }
    }
}

extension ViewDetailRecipeController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return self.recipe.ingredients.count
        case 2:
            return self.recipe.steps.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeDetailCell", for: indexPath) as! RecipeDetailCell
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.Value.text = "Tiempo:"
                cell.Data.text = "\(self.recipe.time!) minutos"
            case 1:
                cell.Value.text = "Valoración:"
                if self.recipe.taste == nil{
                    cell.Data.text = "No se valorado"
                }else{
                    cell.Data.text = self.recipe.taste
                }
            default:
                break
            }
        case 1:
            if indexPath.row == 0 {
                cell.Value.text = "Ingredientes:"
            }else{
                cell.Value.text = ""
            }
            cell.Data.text = self.recipe.ingredients[indexPath.row]
        case 2:
            if indexPath.row == 0 {
                cell.Value.text = "Pasos"
            } else{
                cell.Value.text = ""
            }
            cell.Data.text = self.recipe.steps[indexPath.row]
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        
        switch section {
        case 0:
            title = "Información General"
        case 1:
            title = "Ingredientes"
        case 2:
            title = "Pasos"
        default:
            break
        }
        return title
    }
}

extension ViewDetailRecipeController: UITableViewDelegate{
    
}
