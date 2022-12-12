//
//  ViewController.swift
//  Student
//
//  Created by Apple on 08/11/22.
//

import UIKit
class ViewController : UIViewController{
    
    var students = [Student]()
    var secondViewController : SecondViewController = SecondViewController()
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let nibname = UINib(nibName: "studentTableViewCell", bundle: nil)
        self.tableView.register(nibname, forCellReuseIdentifier: "studentTableViewCell")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self,
                                                                 action: #selector(ClickBtnToAddStudentRecord))
    }
 
    @IBAction func ClickBtnToAddStudentRecord(_ sender: Any) {
        secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondViewController.delegateOnSVC = self
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}
extension ViewController :  UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "studentTableViewCell", for: indexPath) as! studentTableViewCell
        let eachStudent = students[indexPath.row]
        tableViewCell.studentRollNoLabel.text = String(eachStudent.studentRollNo)
        tableViewCell.studentFirstNameLabel.text = eachStudent.studentFirstName
        tableViewCell.studentLastNameLabel.text = eachStudent.studentLastName
        tableViewCell.studentPercentage.text = String(eachStudent.studentPercentage)
        return tableViewCell
    }
    }
    extension ViewController : UITableViewDelegate{
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            160
        }
    }
extension ViewController : BackDataPassing{
    func passDataToFVC(student : Student) {
        let studentObject = Student(studentRollNo: student.studentRollNo, studentFirstName: student.studentFirstName, studentLastName: student.studentLastName, studentPercentage: student.studentPercentage)
        students.append(studentObject)
        tableView.reloadData()
    }
    
}
