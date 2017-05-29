//
//  TipsVC.swift
//  MyBugdet
//
//  Created by Maahi on 08/01/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit

class TipsVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var tipsSts:Bool!
    
    @IBOutlet weak var tipsTableView: UITableView!
    var NotDoArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tipsTableView.rowHeight = UITableViewAutomaticDimension
                
        
        if tipsSts == true{
            self.navigationItem.title = "Tips"
        
            self.NotDoArray .add("Cheques for Rent only –miscalculations results in NSF charges")
            self.NotDoArray .add("Use your bank’s cash machine and only for emergency")
            self.NotDoArray .add("Save $5- $10. today? Skip the dessert & appetizer– your wallet & waistline will love you")
            self.NotDoArray .add("Your health club can be your own two feet- weight bearing exercise-carrying groceries from budget grocery stores")
            self.NotDoArray .add("Clip useable coupons -Use up stuff in your pantry")
            self.NotDoArray .add("Shop for multiply products discounts, Bundle car-home-insurance, review all roaming charges. Ask and understand other hidden charges.")
            self.NotDoArray .add("Daily bring along your own snacks- tired-hunger equates to overspending on junk")
            self.NotDoArray .add("Prepare easy home meals")
            self.NotDoArray .add("Prepay food- drink cards")
            self.NotDoArray .add("Shop in your closet free -  mix and match - update with different colour/ accessories")
            self.NotDoArray .add("Before reaching for your credit card – CAN YOU AFFORD THIS?")
            self.NotDoArray .add("Join- Costco – buddy up – split packages (soap, vitamins &, and other necessities")
            self.NotDoArray .add("Beware of Banking credit cards offering “points-cash-back”")
        
        
        }else{
            self.navigationItem.title = "Not To Do"
        
            //  Not to Do
            self.NotDoArray .add("NEVER ENTER PARTNERSHIP- MARRY-/Cohabit without \"Equifax report\"")
            self.NotDoArray .add("Never cosign or lend friend money suggest credit counseling")
            self.NotDoArray .add("BUY AND PAYOFF THE ROOF OVER YOUR HEAD. (HOWEVER MODEST- extra room,   duplex   income will help cover Heat, hydro, taxes, repair. (buy ½ with trusted friend- iron clad legal documents- share costs –duties, escape and resale clause, Buy own when sufficient equity to sell")
            self.NotDoArray .add("Retirement comes quickly –Gov’t   assistance   is under $1500 month Can You Live On This?  Settle for a realistic goal - DREAMS NEED MONEY- $1000 today worth $400 in 30 years (average inflation)!")
            self.NotDoArray .add("NEVER SIGN \"ON THE SPOT SPECIAL\"")
            self.NotDoArray .add("DO NOT OPEN \"LINE OF CREDIT\"-.. ")
            self.NotDoArray .add("NEVER CHARGE   VISA ITEMS OVER $25- IF NOT PAID MONTHLY –PUT AWAY IN SAFE PLACE AND PAYOFF ENTIRELY.")
            self.NotDoArray .add("NOT IN BUDGET – FORGET IT")
            self.NotDoArray .add("ONLY WRITE ABSOLUTELY NECESSARY CHEQUES- EMAIL PAYMENTS")
            self.NotDoArray .add("NEVER FINANCE A HOLIDAY")
            
        
        
        }
        //Tips

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
        
    //return 64;
    }

//    func tableView(tableView: UITableView,
//                   heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
//    {
//        return 64;
//        //return UITableViewAutomaticDimension
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.NotDoArray.count;
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.numberOfLines = 20
        cell.textLabel?.text = NotDoArray[indexPath.row] as? String
        return cell
    }
    
   

    
    
    
}
