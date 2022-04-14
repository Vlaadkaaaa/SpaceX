//
//  PageTwoViewController.swift
//  SpaceX
//
//  Created by Владислав Лымарь on 13.04.2022.
//

import UIKit

class PageTwoViewController: UIViewController {

    //DesignView
    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var viewTwo: UIView!
    @IBOutlet weak var viewThree: UIView!
    
    
    @IBOutlet weak var labelTitleName: UILabel!
    @IBOutlet weak var labelNameOne: UILabel!
    @IBOutlet weak var labelDateOne: UILabel!
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var labelNameTwo: UILabel!
    @IBOutlet weak var labelDateTwo: UILabel!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var labelNameThree: UILabel!
    @IBOutlet weak var labelDateThree: UILabel!
    @IBOutlet weak var imageThree: UIImageView!
    
    var indexFromPageOne = 0
    var indexTwo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designView()
        loadingApiStartRocket()
    }

    func designView(){
        viewOne.layer.cornerRadius = 24
        viewTwo.layer.cornerRadius = 24
        viewThree.layer.cornerRadius = 24
    }

    func loadingApiStartRocket(){
        let urlStringStart = "https://api.spacexdata.com/v4/launches"
        guard let url = URL(string: urlStringStart) else {return}
        URLSession.shared.dataTask(with: url) { [self] (data, response, error) in
            guard let data = data else {return}
            do{
                let decodeStartRocketArray = try JSONDecoder().decode([StartRocket].self, from: data)
             
                for i in 0...decodeStartRocketArray.count{
                    var newIndex = indexTwo
                    
                    if indexFromPageOne == 0 {
                        DispatchQueue.main.async {
                        self.labelTitleName.text = "Falcon 1"
                        }
                        if i == 0 {
                            if decodeStartRocketArray[newIndex].rocket == "5e9d0d95eda69955f709d1eb" {
                                DispatchQueue.main.async {
                                    self.labelNameOne.text = decodeStartRocketArray[newIndex].name
                                    self.labelDateOne.text = decodeStartRocketArray[newIndex].date_utc
                                    if decodeStartRocketArray[newIndex].success == true{
                                        self.imageOne.image = UIImage(named: "SuccessTrue")
                                    } else{
                                        self.imageOne.image = UIImage(named: "successFalse")
                                    }
                                    
                                }
                            }
                        }
                        if i == 1 {
                            newIndex += 1
                            if decodeStartRocketArray[newIndex].rocket == "5e9d0d95eda69955f709d1eb" {
                                DispatchQueue.main.async {
                                    self.labelNameTwo.text = decodeStartRocketArray[newIndex].name
                                    self.labelDateTwo.text = decodeStartRocketArray[newIndex].date_utc
                                    if decodeStartRocketArray[newIndex].success == true{
                                        self.imageTwo.image = UIImage(named: "SuccessTrue")
                                    } else{
                                        self.imageTwo.image = UIImage(named: "successFalse")
                                    }
                                    
                                }
                            }
                        }
                        if i == 3 {
                            newIndex += 3
                            if decodeStartRocketArray[newIndex].rocket == "5e9d0d95eda69955f709d1eb" {
                                DispatchQueue.main.async {
                                    self.labelNameThree.text = decodeStartRocketArray[newIndex].name
                                    self.labelDateThree.text = decodeStartRocketArray[newIndex].date_utc
                                    if decodeStartRocketArray[newIndex].success == true{
                                        self.imageThree.image = UIImage(named: "SuccessTrue")
                                    } else{
                                        self.imageThree.image = UIImage(named: "successFalse")
                                    }
                                    
                                }
                            }
                        }
                    }
                    else   if indexFromPageOne == 1 {
                        DispatchQueue.main.async {
                        self.labelTitleName.text = "Falcon 9"
                        }
                        if i == 5 {
                            newIndex += 5
                            if decodeStartRocketArray[newIndex].rocket == "5e9d0d95eda69973a809d1ec" {
                                DispatchQueue.main.async {
                                    self.labelNameOne.text = decodeStartRocketArray[newIndex].name
                                    self.labelDateOne.text = decodeStartRocketArray[newIndex].date_utc
                                    if decodeStartRocketArray[newIndex].success == true{
                                        self.imageOne.image = UIImage(named: "SuccessTrue")
                                    } else{
                                        self.imageOne.image = UIImage(named: "successFalse")
                                    }
                                    
                                }
                            }
                        }
                        if i == 33 {
                            newIndex += 33
                            if decodeStartRocketArray[newIndex].rocket == "5e9d0d95eda69973a809d1ec" {
                                DispatchQueue.main.async {
                                    self.labelNameTwo.text = decodeStartRocketArray[newIndex].name
                                    self.labelDateTwo.text = decodeStartRocketArray[newIndex].date_utc
                                    if decodeStartRocketArray[newIndex].success == true{
                                        self.imageTwo.image = UIImage(named: "SuccessTrue")
                                    } else{
                                        self.imageTwo.image = UIImage(named: "successFalse")
                                    }
                                    
                                }
                            }
                        }
                        if i == 90 {
                            newIndex += 90
                            if decodeStartRocketArray[newIndex].rocket == "5e9d0d95eda69973a809d1ec" {
                                DispatchQueue.main.async {
                                    self.labelNameThree.text = decodeStartRocketArray[newIndex].name
                                    self.labelDateThree.text = decodeStartRocketArray[newIndex].date_utc
                                    if decodeStartRocketArray[newIndex].success == true{
                                        self.imageThree.image = UIImage(named: "SuccessTrue")
                                    } else{
                                        self.imageThree.image = UIImage(named: "successFalse")
                                    }
                                    
                                }
                            }
                        }
                    }
                    else   if indexFromPageOne == 2 {
                        DispatchQueue.main.async {
                        self.labelTitleName.text = "Falcon Heavy"
                        }
                        if i == 54 {
                            newIndex += 54
                            if decodeStartRocketArray[newIndex].rocket == "5e9d0d95eda69974db09d1ed" {
                                DispatchQueue.main.async {
                                    self.labelNameOne.text = decodeStartRocketArray[newIndex].name
                                    self.labelDateOne.text = decodeStartRocketArray[newIndex].date_utc
                                    if decodeStartRocketArray[newIndex].success == true{
                                        self.imageOne.image = UIImage(named: "SuccessTrue")
                                    } else{
                                        self.imageOne.image = UIImage(named: "successFalse")
                                    }
                                    
                                }
                            }
                        }
                        if i == 76 {
                            newIndex += 76
                            if decodeStartRocketArray[newIndex].rocket == "5e9d0d95eda69974db09d1ed" {
                                DispatchQueue.main.async {
                                    self.labelNameTwo.text = decodeStartRocketArray[newIndex].name
                                    self.labelDateTwo.text = decodeStartRocketArray[newIndex].date_utc
                                    if decodeStartRocketArray[newIndex].success == true{
                                        self.imageTwo.image = UIImage(named: "SuccessTrue")
                                    } else{
                                        self.imageTwo.image = UIImage(named: "successFalse")
                                    }
                                    
                                }
                            }
                        }
                        if i == 80 {
                            newIndex += 80
                            if decodeStartRocketArray[newIndex].rocket == "5e9d0d95eda69974db09d1ed" {
                                DispatchQueue.main.async {
                                    self.labelNameThree.text = decodeStartRocketArray[newIndex].name
                                    self.labelDateThree.text = decodeStartRocketArray[newIndex].date_utc
                                    if decodeStartRocketArray[newIndex].success == true{
                                        self.imageThree.image = UIImage(named: "SuccessTrue")
                                    } else{
                                        self.imageThree.image = UIImage(named: "successFalse")
                                    }
                                    
                                }
                            }
                        }
                    }
                    else   if indexFromPageOne == 3 {
                        DispatchQueue.main.async {
                        self.labelTitleName.text = "Starship"
                            self.labelNameOne.text = "SN15"
                            self.labelDateOne.text = "6 мая 2021"
                            self.imageOne.image = UIImage(named: "SuccessTrue")
                            self.viewTwo.isHidden = true
                            self.viewThree.isHidden = true
                        }
                        
                        }
                    }
                }
            catch let error{
                print(error)
            }
        }
        .resume()
    }

}
