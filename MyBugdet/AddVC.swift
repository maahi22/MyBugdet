//
//  AddVC.swift
//  MyBugdet
//
//  Created by Maahi on 09/01/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit
import CoreData
class AddVC: UIViewController {

    
    
    var incomeStatus:Bool!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var txtAmount: UITextField!
    @IBOutlet weak var txtNotes: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
   
    var stringDate:NSDate?=nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func dateClick(_ sender: AnyObject) {
    
        if datePicker.isHidden {
            datePicker.isHidden=false
        }else{
        datePicker.isHidden=true
        }
    }
    
    
    
    @IBAction func categoryClick(_ sender: AnyObject) {
    
        
        
        
    
    }
    
    
    
    
    
    @IBAction func selectDate(_ sender: AnyObject) {
    
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"// HH:mm"
        stringDate = datePicker.date as NSDate?
        
        let strDate = dateFormatter.string(from: datePicker.date)
        lblDate.text = strDate
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
        if segue.identifier == "toRepeateView"{
            if let nextViewController = segue.destination as? RepeateVC{
                nextViewController.repeateSts = incomeStatus
            }
            
        }
    
    
    }
    

    
    @IBAction func SubmitClick(_ sender: AnyObject) {
    
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        if incomeStatus == true{
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "Income", in: context)
        //for var index in stride(from: 0, to: 10, by: 1)
            let manageobj = NSManagedObject(entity: entity!, insertInto: context)
        
            //set the entity values
            manageobj.setValue (stringDate ,forKey:"incomedate")
            manageobj.setValue (Double(txtAmount.text!), forKey: "income")
            manageobj.setValue(txtNotes.text, forKey: "incomedes")
            manageobj.setValue(lblCategory.text, forKey: "incometitle")
        }else{
            
            let entity =  NSEntityDescription.entity(forEntityName: "Expenses", in: context)
            let manageobj = NSManagedObject(entity: entity!, insertInto: context)
            //set the entity values
            manageobj.setValue (stringDate ,forKey:"expensesdate")
            manageobj.setValue (Double(txtAmount.text!), forKey: "expenses")
            manageobj.setValue(txtNotes.text, forKey: "expensesdes")
            manageobj.setValue(lblCategory.text, forKey: "expensestitle")

            
            
        }
            //save the object
            do {
                try context.save()
                print("saved!")
                
                self.navigationController?.popViewController(animated: true)
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            } catch {
                
            }

    
    }
    
  
    @IBAction func cancel(_ sender: AnyObject) {
        
               
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
}
