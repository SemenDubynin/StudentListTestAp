//
//  StudentModel.swift
//  StudentList
//
//  Created by Дубынин Семён on 11.07.2020.
//  Copyright © 2020 Дубынин Семён. All rights reserved.
//

import Foundation


struct Student {
    let firstName : String
    let lastName : String
    let rating : Int
    let profilUrl: String?
    let gender: GenderSortType
    
    enum GenderSortType: String {
        case male = "Male"
        case famale = "Famale"
    }
    
    init(firstName: String, lastName: String, rating: Int, gender: GenderSortType,   profilUrl: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.rating = rating
        self.gender = gender
        self.profilUrl = profilUrl
    }
}

