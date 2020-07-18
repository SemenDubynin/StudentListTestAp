//
//  StudentTableViewController.swift
//  StudentList
//
//  Created by Дубынин Семён on 11.07.2020.
//  Copyright © 2020 Дубынин Семён. All rights reserved.
//

import UIKit


class StudentListViewController: UITableViewController {
    
    private let idCell = "Cell"
    private var studentsArray: [Student] = []
    private var searchFiltrArray: [Student] = []
    
    
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!searchBarIsEmpty || searchBarScopeIsFiltering)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // Setup the Search Controller
        studentsArray = createStudentsArray()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        // Setup the Scope Bar
        searchController.searchBar.scopeButtonTitles = ["All", "Male", "Famale"]
        searchController.searchBar.delegate = self
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let selectedStudURL: String?
                if isFiltering {
                    selectedStudURL = searchFiltrArray[indexPath.row].profilUrl
                } else {
                    selectedStudURL = studentsArray[indexPath.row].profilUrl
                }
                //            let indexPath: IndexPath = self.tableView.indexPathForSelectedRow!
                //            let selectedStudURL = studentsArray[indexPath.row].profilUrl!
                //
                let detailVC: DetailViewController = segue.destination as! DetailViewController
                detailVC.selectedStudentUrl = selectedStudURL
            }
        }
        return
    }
    
    
    
    
    //MARK: - Create Student Array
    
    
    func createStudentsArray() -> [Student] {
        
        var studentList: [Student] = []
        let studentOne = Student(firstName: "Semen", lastName: "Dubynin", rating: 95, gender: .male, profilUrl: "https://www.google.ru")
        let studentTwo = Student(firstName: "Roman", lastName: "Chuev", rating: 84, gender: .male, profilUrl: nil)
        let studentThree = Student(firstName: "Ekaterina", lastName: "Dubynina", rating: 21, gender: .famale, profilUrl: nil)
        let studentFour = Student(firstName: "Zlata", lastName: "Dubynina", rating: 30, gender: .famale, profilUrl: "https://yandex.ru")
        let studentFive = Student(firstName: "Ruslan", lastName: "Zainullin", rating: 32, gender: .male, profilUrl: nil)
        let studentSix = Student(firstName: "Dmitry", lastName: "Hodgekulov", rating: 22, gender: .male, profilUrl: nil)
        let studentSeven = Student(firstName: "Elena", lastName: "Mitrofanova", rating: 52, gender: .famale, profilUrl: nil)
        let studentEight = Student(firstName: "Vasily", lastName: "Teplov", rating: 92, gender: .male, profilUrl: nil)
        let studentNine = Student(firstName: "Ivan", lastName: "Ivanov", rating: 99, gender: .male, profilUrl: nil)
        let studentTen = Student(firstName: "Anna", lastName: "Petrova", rating: 12, gender: .famale, profilUrl: nil)
        
        studentList.append(studentOne)
        studentList.append(studentTwo)
        studentList.append(studentThree)
        studentList.append(studentFour)
        studentList.append(studentFive)
        studentList.append(studentSix)
        studentList.append(studentSeven)
        studentList.append(studentEight)
        studentList.append(studentNine)
        studentList.append(studentTen)
        
        
        return studentList.sorted{$0.lastName < $1.lastName}
        
    }
    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return searchFiltrArray.count
        }
        return studentsArray.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var studentCell: Student!
        if isFiltering {
            studentCell = searchFiltrArray[indexPath.row]
        } else {
            studentCell = studentsArray[indexPath.row]
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! StudentTableViewCell
        cell.setStudent(student: studentCell)
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let validateSrudentURL: String?
        if isFiltering {
            validateSrudentURL = searchFiltrArray[indexPath.row].profilUrl
        } else {
            validateSrudentURL = studentsArray[indexPath.row].profilUrl
        }
        
        if validateSrudentURL  == nil {
            let alert = UIAlertController(title: "Failed", message: "Enter a valid URL", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "ShowDetail", sender: self)
            
        }
        return
    }
}

    // MARK: - UISearchBarResultsUpdating


extension StudentListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
    private func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        
        searchFiltrArray = studentsArray.filter({ (filterStudent: Student) -> Bool in
            let doesCategoryMatch = (scope == "All") || (filterStudent.gender.rawValue == scope)
            
            if searchBarIsEmpty {
                return doesCategoryMatch
            }
            return doesCategoryMatch && (filterStudent.firstName.lowercased().contains(searchText.lowercased()) || filterStudent.lastName.lowercased().contains(searchText.lowercased())) 
        })  
        tableView.reloadData()
    }
    
}
    
    // MARK: - UiSearchBar Delegate

extension StudentListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}


