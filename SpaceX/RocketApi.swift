//
//  RocketApi.swift
//  SpaceX
//
//  Created by Владислав Лымарь on 11.04.2022.
//

import Foundation

struct rocketArray: Decodable{

    let name: String
    
    //ScrollView
    let height: Height
    let diameter: Diameter
    let mass: Mass
    
    //Start
    let first_flight: String
    let country: String
    let cost_per_launch: Int
    
    //FirstStage
    
    //SecondStage
    
}

struct Height: Decodable{
    let meters: Double
    let feet: Double
}

struct Diameter: Decodable{
    let meters: Double
    let feet: Double
}

struct Mass: Decodable{
    let kg: Int
    let lb: Int
}
