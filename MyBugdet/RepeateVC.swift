//
//  RepeateVC.swift
//  MyBugdet
//
//  Created by Maahi on 10/01/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit
import CoreData
//import RepeateCell

class RepeateVC: UIViewController,UITableViewDelegate,UITableViewDataSource,SelectionVCDelegate {

    
    var repeateSts:Bool!
    
    var indexPath :IndexPath?=nil
    var titleArray = NSMutableArray()
    @IBOutlet weak var repeateTableview: UITableView!
    @IBOutlet weak var datePicker: UIDatePicker!
    var repCell:RepeateCell?=nil
    var repetSts:Bool = false
    var repeatType:String = ""
    var repeatDay:String = ""
    var repeatMode:String = ""
    
    var endDate:NSDate?=nil
    var amount:String = ""
    var modification_date:NSDate?=nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
       // self.repeateTableview.register(RepeateCell.self, forCellReuseIdentifier: "RepeateCell")

        
        self.titleArray .add("Repeating")
        self.titleArray .add("Repeat")
        self.titleArray .add("Every")
        self.titleArray .add("End Date")
        self.titleArray .add("Amount($)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArray.count;
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RCell", for: indexPath) as! RepeateCell
        
        cell.txtInput.isHidden=true;
        if indexPath.row==0 {
            cell.switch.isHidden = false
            cell.lblDetails.isHidden = true
            
        }else if indexPath.row==4 {
            datePicker.isHidden = true
            cell.lblDetails.isHidden=true;
            cell.txtInput.isHidden=false;
        }
        
       
        cell.lblTitle.text = titleArray[indexPath.row] as? String
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.indexPath = indexPath

        
        let cell:RepeateCell? = tableView.cellForRow(at: indexPath) as! RepeateCell?

        repCell=cell;

        //cell?.lblDetails.text="Hi"
        if indexPath.row==2 || indexPath.row==1 {
            self.performSegue( withIdentifier: "selection", sender: self)
        }
        else if (indexPath.row==3 && datePicker.isHidden == true) {
            datePicker.isHidden = false;
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selection"{
            if let nextViewController = segue.destination as? SelectionVC{
                nextViewController.delegate=self
                if self.indexPath?.row == 1{
                    nextViewController.status = 0 //Or pass any values
                }else if self.indexPath?.row == 2{
                    nextViewController.status = 1
                }
            }
            
        }
    }

    //Delegate Method
    func returnValue(info:String!){
        if self.indexPath?.row == 1{
//            let indexPath = NSIndexPath(row: 1, section: 0)
//            let  cell:RepeateCell = self.repeateTableview.cellForRow(at:indexPath as IndexPath)! as! RepeateCell
            let cell=repCell;
            cell?.lblDetails.text=info
            repeatMode=info
        }else if self.indexPath?.row == 2{
//            let indexPath = NSIndexPath(row: 2, section: 0)
//            let  cell:RepeateCell = self.repeateTableview.cellForRow(at:indexPath as IndexPath  )! as! RepeateCell
            let cell=repCell;
            cell?.lblDetails.text=info
            repeatDay=info
        }
       
        
    }
    
    
    @IBAction func datePickerValueChange(_ sender: AnyObject) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"// HH:mm"
        let strDate = dateFormatter.string(from: datePicker.date)
        
        endDate = datePicker.date as NSDate?
        print(indexPath)
        print(endDate)
       // let indexPath2 : IndexPath = IndexPath(item: 1, section: 0)

        //let indexPath2 = NSIndexPath(row: 3, section: 1) as IndexPath
      //  let  cell:RepeateCell? = self.repeateTableview.cellForRow(at: self.indexPath!) as! RepeateCell?
            
      
        
      // let  cell:RepeateCell? = self.repeateTableview.dequeueReusableCell(withIdentifier: "RepeateCell", for:self.indexPath!) as? RepeateCell
        
        
            //.dequeueReusableCell(withIdentifier: "RepeateCell", for: indexPath as IndexPath) as! RepeateCell//cellForRow(at:indexPath as IndexPath)! as! RepeateCell
        
//        let cell = repeateTableview.dequeueReusableCell(withIdentifier: "RepeateCell", for: indexPath2 as IndexPath) as! RepeateCell

      //  let cell:RepeateCell = tableView.cellForRow(at: indexPath2) as! RepeateCell
        
        repCell?.lblDetails.text = strDate
        

    }
    
    
    
    @IBAction func switchValueChange(_ sender: AnyObject) {
        
//        if sender.isOn {
//            repetSts=true
//        }else{
//            repetSts=false
//        }

        
    }
    
    @IBAction func save(_ sender: AnyObject) {
    
        
        let indexPath  =  IndexPath(row: 1, section: 0) as IndexPath //[NSIndexPath indexPathForRow:4 inSection:0]
       // let cell = repeateTableview.cellForRow(at: indexPa) as! RepeateCell
        
        
       // do {
            let cell = try   repeateTableview.cellForRow(at: indexPath) as! RepeateCell?
         /*   print(cell?.txtInput.text)
        } catch  {
            print("Not me error")
        }*/
        
        
        
        
        
        amount = "10000.0"//(cell?.txtInput.text)!
        
        let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
      
        let entity =  NSEntityDescription.entity(forEntityName: "Repeat", in: context)
        let manageobj = NSManagedObject(entity: entity!, insertInto: context)
        //retrieve the entity that we just created
        
        
        //set the entity values
        manageobj.setValue(Double(amount), forKey: "amount")
        manageobj.setValue(endDate, forKey: "enddate")
        manageobj.setValue(repeatDay, forKey: "repeatday")
        manageobj.setValue(repeatMode, forKey: "repeatmode")
         manageobj.setValue(repetSts, forKey: "repeatstatus")
        
        if repeateSts==true{
           manageobj.setValue("income", forKey: "repeatType")
        }else{
            manageobj.setValue("expenses", forKey: "repeatType")
        }
        
        
       // manageobj.setValue(modification_date, forKey: "modificationdate")
        //save the object
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
        
    }
}
