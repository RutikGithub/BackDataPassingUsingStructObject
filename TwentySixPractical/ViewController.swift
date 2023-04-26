//
//  ViewController.swift
//  TwentySixPractical
//
//  Created by Mac on 24/04/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
   
    var studentDetails:[Student]=[]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        
    registerWithXIB()
        
        
    }
    
    func registerWithXIB()
    {
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    
    @IBAction func addButton(_ sender: Any)
    {
       var secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        secondViewController.delegate = self
        navigationController?.pushViewController(secondViewController, animated: true)
        
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath], with: .fade)
        studentDetails.remove(at: indexPath.row)
        tableView.endUpdates()
    }
    
}
extension ViewController:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        studentDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cellData =  self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)as! TableViewCell
        
        
        
        cellData.firstName.text = studentDetails[indexPath.row].studentFirstName
        cellData.lastName.text = studentDetails[indexPath.row].studentLastName
        cellData.rollNo.text = String(studentDetails[indexPath.row].studentRollNo)
        
        
        
        return cellData
    }
    
    
}
extension ViewController:BackDataPassing
{
    func backDataPassingToFirstVC(student: Student) {
        studentDetails.append(student)
        self.tableView.reloadData()
    }
    
    
    
    
}
