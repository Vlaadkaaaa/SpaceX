//
//  RocketApi.swift
//  SpaceX
//
//  Created by Владислав Лымарь on 11.04.2022.
//

import Foundation

struct rocketArray: Decodable{

    let flickr_images: [String]
    let name: String
    
    //ScrollView
    let height: Height
    let diameter: Diameter
    let mass: Mass
    let payload_weights: [PayLoad]

    
    //Start
    let first_flight: String
    let country: String
    let cost_per_launch: Int
    
    //FirstStage
    let first_stage: FirstStage
    
    //SecondStage
    let second_stage: SecondStage
    
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

struct FirstStage: Decodable{
    let engines: Int?
    let fuel_amount_tons: Double?
    let burn_time_sec: Int?
}

struct SecondStage: Decodable{
    let engines: Int?
    let fuel_amount_tons: Double?
    let burn_time_sec: Int?
}

struct PayLoad: Decodable{
    let kg: Int?
    let lb: Int?
}


