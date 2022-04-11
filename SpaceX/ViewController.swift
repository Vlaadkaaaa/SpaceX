//
//  ViewController.swift
//  SpaceX
//
//  Created by Владислав Лымарь on 05.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var rocketNameLabel: UILabel!
    
    //ScrollViewVertical
        //ViewDesign
        @IBOutlet weak var viewOneDesign: UIView!
        @IBOutlet weak var viewTwoDesign: UIView!
        @IBOutlet weak var viewThreeDesign: UIView!
        @IBOutlet weak var viewFourDesign: UIView!
        //ScrollValueLabel
        @IBOutlet weak var heightValueLabel: UILabel!
        @IBOutlet weak var diameterValueLabel: UILabel!
        @IBOutlet weak var massValueLabel: UILabel!
        @IBOutlet weak var loadValueLabel: UILabel!
       

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
        loadingApiSpaceRocket()
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

    func loadingApiSpaceRocket(){

        let urlString =  "https://api.spacexdata.com/v4/rockets"
        guard let url = URL(string: urlString) else {return}

          URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {return}
            
            do {
                let decodeArray = try JSONDecoder().decode([rocketArray].self, from: data)
        
                DispatchQueue.main.async {
                    let rocket = decodeArray.first

                    self.rocketNameLabel.text = rocket?.name

                    //ScrollView
                    self.heightValueLabel.text = "\(rocket!.height.meters)"
                    self.diameterValueLabel.text = "\(rocket!.diameter.meters)"
                    self.massValueLabel.text = "\(rocket!.mass.kg)"

                    //Start
                    self.firstStartLabel.text = rocket?.first_flight
                    self.countryStartLabel.text = rocket?.country
                    self.priceStartLabel.text = "\(rocket!.cost_per_launch)"
                    
                    //FirstStage
                    self.firstAmountEngine.text = String(describing: rocket!.first_stage.engines!)
                    self.firstAmountFuel.text = String(describing: rocket!.first_stage.fuel_amount_tons!)
                    self.firstCombustionTime.text = String(describing: rocket!.first_stage.burn_time_sec!)
                    
                    //SecondStage
                    self.secondAmountEngine.text = String(describing: rocket!.second_stage.engines!)
                    self.secondAmountFuel.text = String(describing: rocket!.second_stage.fuel_amount_tons!)
                    self.secondCombustionTime.text = String(describing: rocket!.second_stage.burn_time_sec!)
                
                
                }

            } catch let error {
                print("Error in program", error)
            }
        
        
        }

        
        .resume()
        }
        
        
    }





