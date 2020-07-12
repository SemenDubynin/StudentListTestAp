//
//  StudentModel.swift
//  StudentList
//
//  Created by Дубынин Семён on 11.07.2020.
//  Copyright © 2020 Дубынин Семён. All rights reserved.
//

import Foundation
import UIKit

struct Student {
    let firstName : String
    let lastName : String
    let rating : Int
    let gender : String
    let profilUrl: URL?
    
    init(firstName: String, lastName: String, rating: Int, gender: String,  profilUrl: URL?) {
        self.firstName = firstName
        self.lastName = lastName
        self.rating = rating
        self.gender = gender
        self.profilUrl = profilUrl
    }


}
