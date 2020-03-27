//
//  Student.swift
//  SegundoParcialWebServices
//
//  Created by Christian Calderón on 26/03/20.
//  Copyright © 2020 Christian Calderón. All rights reserved.
//

import Foundation

struct Student: Codable {
    var  name: String?
    var imgURL: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case imgURL = "img_url"
    }
}
