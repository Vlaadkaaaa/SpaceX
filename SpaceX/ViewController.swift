//
//  ViewController.swift
//  SpaceX
//
//  Created by Владислав Лымарь on 05.04.2022.
//

import UIKit

class ViewController: UIViewController {

    //ScrollViewVertical
        //ScrollNameLabel
        @IBOutlet weak var heightNameLabel: UILabel!
        @IBOutlet weak var diameterNameLabel: UILabel!
        @IBOutlet weak var massNameLabel: UILabel!
        @IBOutlet weak var loadNameLabel: UILabel!
        //ScrollValueLabel
        @IBOutlet weak var heightValueLabel: UILabel!
        @IBOutlet weak var diameterValueLabel: UILabel!
        @IBOutlet weak var massValueLabel: UILabel!
        @IBOutlet weak var loadValueLabel: UILabel!
        //ViewDesign
        @IBOutlet weak var viewOneDesign: UIView!
        @IBOutlet weak var viewTwoDesign: UIView!
        @IBOutlet weak var viewThreeDesign: UIView!
        @IBOutlet weak var viewFourDesign: UIView!

    //StartLabel
    @IBOutlet weak var firstStartLabel: UILabel!
    @IBOutlet weak var countryStartLabel: UILabel!
    @IBOutlet weak var priceStartLabel: UILabel!
   
    //Stage
        //FirstStage
        @IBOutlet weak var firstAmountEngine: UILabel!
        @IBOutlet weak var firstAmountFuel: UILabel!
        @IBOutlet weak var firstCombustionTime: UILabel!
        
        //SecondStage
        @IBOutlet weak var secondAmountEngine: UILabel!
        @IBOutlet weak var secondAmountFuel: UILabel!
        @IBOutlet weak var secondCombustionTime: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designVerticalScroll()
    }


    
    
    func designVerticalScroll(){
        let colorViewDesign = UIColor(
            red: 33.0/255, green: 33.0/255, blue: 33.0/255, alpha: 1.0
        )
        
        viewOneDesign.layer.cornerRadius = 32
        viewOneDesign.backgroundColor = colorViewDesign

        viewTwoDesign.layer.cornerRadius = 32
        viewTwoDesign.backgroundColor = colorViewDesign

        viewThreeDesign.layer.cornerRadius = 32
        viewThreeDesign.backgroundColor = colorViewDesign

        viewFourDesign.layer.cornerRadius = 32
        viewFourDesign.backgroundColor = colorViewDesign
        
    }
    
    
}




