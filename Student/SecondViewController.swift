//
//  SecondViewController.swift
//  Student
//
//  Created by Apple on 08/11/22.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet var studentRollNoTextField: UITextField!
    
    @IBOutlet var studentFirstNameTextField: UITextField!
    
    @IBOutlet var studentLastNameTextField: UITextField!
    
    @IBOutlet var studentPercentage: UITextField!
    
    var delegateOnSVC : BackDataPassing?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnClickToAddStudentRecord(_ sender: Any) {
        guard let delegate = delegateOnSVC else{
            print("delegate not created")
            return
        }
        if(studentRollNoTextField.text?.isEmpty == true){
            let alert = UIAlertController(title: "Alert", message: "Roll No TextField is empty, please insert record", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default))
            self.present(alert, animated: true)
        }
        else if(studentFirstNameTextField.text?.isEmpty == true){
            let alert = UIAlertController(title: "Alert", message: "FirstName TextField is empty, please insert record", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default))
            self.present(alert, animated: true)
        }
        else if(studentLastNameTextField.text?.isEmpty == true){
            let alert = UIAlertController(title: "Alert", message: "LastName TextField is empty, please insert record", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default))
            self.present(alert, animated: true)
        }
        else if(studentPercentage.text?.isEmpty == true){
            let alert = UIAlertController(title: "Alert", message: "Percentage TextField is empty, please insert record", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default))
            self.present(alert, animated: true)
        }
        else{
            let studentRollNo = Int(self.studentRollNoTextField.text!)
            let studentFirstName = self.studentFirstNameTextField.text
            let studentLastName = self.studentLastNameTextField.text
            let studentPercentages = Float(self.studentPercentage.text!)
            
            delegate.passDataToFVC(student : Student(studentRollNo: studentRollNo!,
                                                     studentFirstName: studentFirstName!, studentLastName: studentLastName!, studentPercentage: studentPercentages!))
            
            navigationController?.popViewController(animated: true)
        }
    }
}
