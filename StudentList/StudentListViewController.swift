//
//  StudentTableViewController.swift
//  StudentList
//
//  Created by Дубынин Семён on 11.07.2020.
//  Copyright © 2020 Дубынин Семён. All rights reserved.
//

import UIKit


class StudentListViewController: UITableViewController {
    
    let idCell = "Cell"
    var students: [Student] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        students = createStudentsArray()
        

    
    }
    func createStudentsArray() -> [Student] {
        var studentList: [Student] = []
        
        
        let studentOne = Student(firstName: "Semen", lastName: "Dubynin", rating: 95, gender: "Male", profilUrl: nil)
        let studentTwo = Student(firstName: "Roman", lastName: "Chuev", rating: 84, gender: "Male", profilUrl: nil)
        let studentThree = Student(firstName: "Ekaterina", lastName: "Dubynina", rating: 21, gender: "Famale", profilUrl: nil)
        let studentFour = Student(firstName: "Zlata", lastName: "Dubynina", rating: 30, gender: "Famale", profilUrl: nil)
        let studentFive = Student(firstName: "Ruslan", lastName: "Zainullin", rating: 32, gender: "Male",
            profilUrl: nil)
        let studentSix = Student(firstName: "Dmitriy", lastName: "Hodjekulov", rating: 22, gender: "Male", profilUrl: nil)
        let studentSeven = Student(firstName: "Elena", lastName: "Mitrofanova", rating: 52, gender: "Famale", profilUrl: nil)
        let studentEight = Student(firstName: "Vasily", lastName: "Teplov", rating: 91, gender: "Male", profilUrl: nil)
        let studentNine = Student(firstName: "Ivan", lastName: "Ivanov", rating: 99, gender: "Male", profilUrl: nil)
        
        studentList.append(studentOne)
        studentList.append(studentTwo)
        studentList.append(studentThree)
        studentList.append(studentFour)
        studentList.append(studentFive)
        studentList.append(studentSix)
        studentList.append(studentSeven)
        studentList.append(studentEight)
        studentList.append(studentNine)
        
        
        
        
        return studentList.sorted{$0.lastName < $1.lastName}
        
    }
    

    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let studentCell = students[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! StudentTableViewCell
        cell.setStudent(student: studentCell)

        return cell
    }
    
    

    

}
