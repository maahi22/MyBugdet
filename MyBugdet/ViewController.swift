//
//  ViewController.swift
//  MyBugdet
//
//  Created by Maahi on 08/01/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var menuTableView: UITableView!
    
    var menuArray = NSMutableArray()
    var section :IndexPath?=nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.menuArray .add("My Income")
        self.menuArray .add("My Expenses")
        self.menuArray .add("What $ Left")
        self.menuArray .add("My Profile")
        self.menuArray .add("Tips")
        self.menuArray .add("Things Not To Do")
        self.menuArray .add("About us")
        
        menuTableView.delegate=self
        menuTableView.dataSource=self
        
        //menuTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
   
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.menuArray.count
    }
    
    func tableView( _ tableView : UITableView,  titleForHeaderInSection section: Int)->String? {
        
        return ""
    }
    
//    private func tableView (tableView:UITableView , heightForHeaderInSection section:Int)->Float
//    {
//        
//        
//        return 50.0
//    }
    
    
   
    
//    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
    
    
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // tableView.dequeueReusableCell(withIdentifier: "DiskTableViewCell")!
        //  let cell = tableView.dequeueReusableCell(withIdentifier:  ("DiskTableViewCell",forIndexPath: indexPath)) as! DiskTableViewCell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = menuArray[indexPath.section] as? String
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        return cell
    }
    
    // method to run when table view cell is tapped
//    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
//        print("You tapped cell number \(indexPath.row).")
//        
//        
//        
//        if indexPath.section == 4 {
//            self.performSegue( withIdentifier: "TipsWarnning", sender: self)
//        }
//    }
    
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 4 || indexPath.section == 5 {
            self.performSegue( withIdentifier: "TipsWarnning", sender: self)
        }else if indexPath.section == 6{
            
            self.performSegue( withIdentifier: "About", sender: self)
        }else if indexPath.section == 2{
            
            self.performSegue( withIdentifier: "whatsLeft", sender: self)
        }else if indexPath.section == 1{
            
            self.performSegue( withIdentifier: "MyExpenses", sender: self)
        }else if indexPath.section == 0{
            
            self.performSegue( withIdentifier: "MyIncome", sender: self)
        }else if indexPath.section == 3{
            
            self.performSegue( withIdentifier: "Settings", sender: self)
        }
        
        
        self.section = indexPath
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TipsWarnning"{
            if let nextViewController = segue.destination as? TipsVC{
                
                if self.section?.section == 4{
                    nextViewController.tipsSts = true //Or pass any values
                }else{
                    nextViewController.tipsSts = false
                }
            }
            
        }else  if segue.identifier == "MyIncome"{
            
        }
    }

}

