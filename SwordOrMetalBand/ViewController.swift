//
//  ViewController.swift
//  SwordOrMetalBand
//
//  Created by mcarrera on 4/4/16.
//  Copyright © 2016 Martín Carrera. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    private var elements: [Element] = []
    private var currentObject: Int = 0
    private var popViewController: PopUpViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.popViewController = PopUpViewController(nibName: "PopUpViewController", bundle: nil)
        self.elements = DataHandler.getElements()
        self.nextElement()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    @IBAction func swordButtonPressed() {
        self.showAnswer(.Sword)
        self.nextElement()
    }
    
    @IBAction func metalButtonPressed() {
        self.showAnswer(.Metal)
        self.nextElement()
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
    
    func nextElement(){
        var nextObject: Int!
        repeat {
            nextObject = Int(arc4random_uniform(UInt32(self.elements.count)))
        } while (nextObject == self.currentObject)
        self.currentObject = nextObject
        self.nameLabel.text = elements[currentObject].name
    }
    
}

