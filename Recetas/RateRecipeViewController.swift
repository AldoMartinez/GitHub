//
//  RateRecipeViewController.swift
//  Recetas
//
//  Created by Aldo Aram Martinez Mireles on 1/16/18.
//  Copyright © 2018 Aldo Aram Martinez Mireles. All rights reserved.
//

import UIKit

class RateRecipeViewController: UIViewController {
    
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var rateStackView: UIStackView!
    @IBOutlet var dislikeButton: UIButton!
    @IBOutlet var greatButton: UIButton!
    @IBOutlet var goodButton: UIButton!
    
    var recipeRate: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Creamos el efecto para difuminar la imagen
        let blurEffect = UIBlurEffect(style: .dark)
        //Creamos una vista adicional a la cual le asignamos el efecto creado anteriormente
        let effectView = UIVisualEffectView(effect: blurEffect)
        //Hacemo que la vista abarque toda la pantalla
        effectView.frame = view.bounds
        
        //Se añade la vista adicional a la vista principal
        backgroundImage.addSubview(effectView)
        
        /*let scale = CGAffineTransform(scaleX: 0, y: 0)
        let translation = CGAffineTransform(translationX: 0, y: 500)
        
        rateStackView.transform = scale.concatenating(translation)*/
        
        let scale = CGAffineTransform(scaleX: 0, y: 0)
        let translation = CGAffineTransform(translationX: 0, y: 500)
        
        dislikeButton.transform = scale.concatenating(translation)
        goodButton.transform = scale.concatenating(translation)
        greatButton.transform = scale.concatenating(translation)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /*UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            self.rateStackView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
         
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: [], animations: {
            
            self.rateStackView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)*/
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: [], animations: {
            self.dislikeButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: { (success) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: [], animations: {
                self.goodButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: { (success) in
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: [], animations: {
                    self.greatButton.transform = CGAffineTransform(scaleX: 1, y: 1)
                }, completion: nil)
            })
        })
        
        /*UIView.animate(withDuration: 1, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: [], animations: {
            self.goodButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0.8, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: [], animations: {
            self.greatButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    @IBAction func ratePressed(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            recipeRate = "Malo"
        case 2:
            recipeRate = "Bueno"
        case 3:
            recipeRate = "Excelente"
        default:
            break
        }
        
        performSegue(withIdentifier: "returnDetailView", sender: sender)
    }
    
}
