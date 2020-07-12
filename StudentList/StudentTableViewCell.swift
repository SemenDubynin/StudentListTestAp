//
//  StudentTableViewCell.swift
//  StudentList
//
//  Created by Дубынин Семён on 12.07.2020.
//  Copyright © 2020 Дубынин Семён. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {


    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    func setStudent (student: Student) {
        firstNameLabel.text = student.firstName
        lastNameLabel.text = student.lastName
        genderLabel.text = student.gender
        ratingLabel.text = "#\(student.rating)"
        
    }
 
}
