//
//  StartApi.swift
//  SpaceX
//
//  Created by Владислав Лымарь on 14.04.2022.
//

import Foundation

struct StartRocket: Decodable{
    let rocket: String?
    let success: Bool?
    let name: String?
    let date_utc: String?
}
