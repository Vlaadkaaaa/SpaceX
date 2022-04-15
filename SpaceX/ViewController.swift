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
    
    @IBOutlet weak var pageControl: UIPageControl!
    
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
    
    //Button
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designVerticalScroll()
        loadingApiSpaceRocket()
        designRocket()
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
    func dateFormatting(valueString: String, oldFormat: String = "yyyy/MM/dd", newFormat: String = "dd MMMM yyyy") -> String?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = oldFormat
        guard let date = dateFormatter.date(from: valueString) else {return nil}
        dateFormatter.dateFormat = newFormat
        
        return dateFormatter.string(from: date)
    }
    
    func loadingApiSpaceRocket(){

        let urlString =  "https://api.spacexdata.com/v4/rockets"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { [self] (data, response, error) in
            
            guard let data = data else {return}
            
            do {
                let decodeArray = try JSONDecoder().decode([rocketArray].self, from: data)
                
                let rocket = decodeArray[index]

                DispatchQueue.global().async {
                    guard let imageUrl = URL(string: (rocket.flickr_images.randomElement())!) else {return}
                    guard let imageData = try? Data(contentsOf: imageUrl) else {return}
                
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: imageData)
                    self.rocketNameLabel.text = rocket.name

                    //ScrollView
                    self.heightValueLabel.text = "\(rocket.height.meters)"
                    self.diameterValueLabel.text = "\(rocket.diameter.meters)"
                    self.massValueLabel.text = "\(rocket.mass.kg)"
                    self.loadValueLabel.text = String(describing: rocket.payload_weights.first!.kg!)

                    //Start
                    let valueStartDate = dateFormatting(valueString: rocket.first_flight)!
                    self.firstStartLabel.text = String(describing: valueStartDate)
                    
                    self.countryStartLabel.text = rocket.country
                    self.priceStartLabel.text = "\(rocket.cost_per_launch)"
                    
                    //FirstStage
                    self.firstAmountEngine.text = String(describing: rocket.first_stage.engines!)
                    self.firstAmountFuel.text = String(describing: rocket.first_stage.fuel_amount_tons!)
                   
                    if rocket.first_stage.burn_time_sec == nil{
                        self.firstCombustionTime.text = String(describing: rocket.first_stage.burn_time_sec)
                    } else {
                        self.firstCombustionTime.text = String(describing: rocket.first_stage.burn_time_sec!)
                    }
                    
                    
                    //SecondStage
                    self.secondAmountEngine.text = String(describing: rocket.second_stage.engines!)
                    self.secondAmountFuel.text = String(describing: rocket.second_stage.fuel_amount_tons!)
                    
                    if rocket.second_stage.burn_time_sec == nil {
                        self.secondCombustionTime.text = String(describing: rocket.second_stage.burn_time_sec)
                    } else {
                        self.secondCombustionTime.text = String(describing: rocket.second_stage.burn_time_sec!)
                    }
                  
                

                }
                }

            } catch let error {
                print("Error in program", error)
            }
        
        
        }

        .resume()
        }
    func designRocket(){
        if index == 0 {
            leftButton.isHidden = true
        }
        else {
            leftButton.isHidden = false
        }
        if index == (pageControl.numberOfPages - 1){
            rightButton.isHidden = true
        }
        else {
            rightButton.isHidden = false
        
        }
        
    }
    func showNewRocket(){
        pageControl.currentPage = index
        loadingApiSpaceRocket()
        designRocket()
        
    }
        
    @IBAction func pressedLeftButton(_ sender: UIButton) {
        guard index > 0 else {return}
        index -= 1
        showNewRocket()
    }
    
    @IBAction func pressedRightButton(_ sender: UIButton) {
        guard index < (pageControl.numberOfPages - 1) else {return}
        index += 1
        showNewRocket()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationIndex: PageTwoViewController = segue.destination as! PageTwoViewController
        destinationIndex.indexFromPageOne = index
    }
    }





