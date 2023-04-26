//
//  SecondViewController.swift
//  TwentySixPractical
//
//  Created by Mac on 24/04/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var rollName: UITextField!
    
    var delegate:BackDataPassing?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func backButton(_ sender: Any)
    {
        let fName = self.firstName.text
        let lName = self.lastName.text
        let rno = Int(self.rollName.text!)
        
        let studentData = Student(studentFirstName: fName!, studentLastName: lName!, studentRollNo: rno!)
        
        
        guard let delegateSVC = delegate else
        {
            return
            
        }
        delegateSVC.backDataPassingToFirstVC(student: studentData)
        
        navigationController?.popViewController(animated: true)
    }
    
}
