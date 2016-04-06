//
//  ViewController.swift
//  SwordOrMetalBand
//
//  Created by mcarrera on 4/4/16.
//  Copyright © 2016 Martín Carrera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    private var elements: [Element] = []
    private var currentObject: Int = 0
    private var popViewController: PopUpViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.popViewController = PopUpViewController(nibName: "PopUpViewController", bundle: nil)
        
        let element = Element(withId: 0, name: "Longclaw", type: .Sword, description: "Jon Snow sword")
        self.currentObject = element.id
        self.nameLabel.text = element.name
        self.elements.append(element)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    @IBAction func swordButtonPressed() {
        self.showAnswer(.Sword)
    }
    
    @IBAction func metalButtonPressed() {
        self.showAnswer(.Metal)
    }
    
    func showAnswer(type: Type){
        let image: UIImage
        let title: String
        if self.elements[self.currentObject].type == type {
            image = UIImage(named: "Ok")!
            title = "Awesome!"
        } else {
            image = UIImage(named: "Cancel")!
            title = "Ups..."
        }
        self.popViewController!.showInView(self.view, withImage: image, title: title, description: self.elements[self.currentObject].description, animated: true)
    }
}

