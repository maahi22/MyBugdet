//
//  WhatsLeftVC.swift
//  MyBugdet
//
//  Created by Maahi on 08/01/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit
import CoreData

class WhatsLeftVC: UIViewController ,UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate{

    @IBOutlet weak var whatsLeftTableView: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMonth: UILabel!
    @IBOutlet weak var lblLeftMoney: UILabel!
    @IBOutlet weak var imageProgress: UIImageView!
    @IBOutlet weak var progressbar: UIProgressView!
    
    var leftArray = NSMutableArray()
    var monthArray = NSMutableArray()
    
    @IBOutlet weak var monthPicker: UIPickerView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        monthPicker.isHidden = true
        self.monthArray .add("JANUARY")
        self.monthArray .add("FEBRUARY")
        self.monthArray .add("MARCH")
        self.monthArray .add("APRIL")
        self.monthArray .add("MAY")
        self.monthArray .add("JUNE")
        self.monthArray .add("JULY")
        self.monthArray .add("AUGUST")
        self.monthArray .add("SEPTEMBER")
        self.monthArray .add("OCTOBER")
        self.monthArray .add("NOVEMBER")
        self.monthArray .add("DECEMBER")
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    /*func totalIncome(month: String) -> Double {
        
        Double totalInc=0.0;
        
        
        
        return totalInc;
    }
    
    
    func totalExpences(month: String) -> Double {
        
        Double totalExp = 0.0;
        
        
        
        return totalExp;
    }*/
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            return 2
        }else{
            return 1;
        }
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) 
       // cell.textLabel?.text = leftArray[indexPath.section] as? String
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
    
    //Picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return monthArray.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return monthArray[row] as? String
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        
        lblMonth.text=monthArray[row] as? String
        
    }
    


    @IBAction func selectMonth(_ sender: AnyObject) {
        if monthPicker.isHidden {
            monthPicker.isHidden = false
        }else{
            monthPicker.isHidden = true
        }
    }
    
    
    
    
    func changeButtomImage()  {
        
        
        
        
        
    }
    

}
