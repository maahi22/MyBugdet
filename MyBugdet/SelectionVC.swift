//
//  SelectionVCViewController.swift
//  MyBugdet
//
//  Created by Maahi on 15/01/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit


protocol SelectionVCDelegate {
    
    func returnValue(info:String!)
}


class SelectionVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var status:NSInteger!
    var optionArray = NSMutableArray()
    var previousCheckedIndex = 0
     var delegate:SelectionVCDelegate?
    @IBOutlet weak var selectionTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        if status==0 {
            self.optionArray .add("Daily")
            self.optionArray .add("Monthly")
            self.optionArray .add("Weekly")
            
        }else{
            
            self.optionArray .add("Sunday")
            self.optionArray .add("Monday")
            self.optionArray .add("Tuesday")
            self.optionArray .add("WednessDay")
            self.optionArray .add("Thusday")
            self.optionArray .add("Friday")
            self.optionArray .add("Saturday")
           
        }
        
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
        return self.optionArray.count;
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
         //cell.accessoryType = UITableViewCellAccessoryType.checkmark
         cell.textLabel?.text = optionArray[indexPath.row] as? String
       
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var returnVal = ""
        if (indexPath.row != previousCheckedIndex) {
            var cell: UITableViewCell = self.selectionTableView.cellForRow(at: indexPath)!
            if (cell.accessoryType == UITableViewCellAccessoryType.none) {
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
                
                returnVal = (optionArray[indexPath.row] as? String)!
                
                if (previousCheckedIndex != indexPath.row) {
                    
                    cell = selectionTableView.cellForRow(at: NSIndexPath(row : previousCheckedIndex, section: 0) as IndexPath)!
                    
                    cell.accessoryType = UITableViewCellAccessoryType.none
                    previousCheckedIndex = indexPath.row
                }
            } else {
                cell.accessoryType = UITableViewCellAccessoryType.none
            }
            
            
    }
        
        
        self.delegate?.returnValue(info: returnVal)
        self.navigationController?.popViewController(animated: true)
    }
    
//    @IBAction func DoneClick(_ sender: AnyObject) {
//        
//        
//        
//    }
    

}
