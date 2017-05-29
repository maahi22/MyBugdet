//
//  MyExpensesVC.swift
//  MyBugdet
//
//  Created by Maahi on 08/01/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit
import CoreData

class MyExpensesVC: UIViewController,UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate,NSFetchedResultsControllerDelegate {

    @IBOutlet weak var myExpeansesTableView: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMonth: UILabel!
    @IBOutlet weak var lblExpances: UILabel!
    @IBOutlet weak var btnRepeate: UIButton!
    
    var expensesArray = NSMutableArray()
    
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
        
        
        do {
            try self.fetchedResultsController.performFetch()
        } catch {
            let fetchError = error as NSError
            print("\(fetchError), \(fetchError.userInfo)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "toaddExpances"{
            if let nextViewController = segue.destination as? AddVC{
                nextViewController.incomeStatus = false
            }
            
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if let sections = fetchedResultsController.sections {
            return sections.count
        }
        
        return 0
    }
    
    
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        return 1;
    //    }
    
    
    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        
        if let sections = fetchedResultsController.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        
        return 0
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //cell.textLabel?.text = expensesArray[indexPath.section] as? String
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! IncomeCell
        // Configure Table View Cell
        configureCell(cell: cell, atIndexPath: indexPath as NSIndexPath)
        
        return cell
    }

    func configureCell(cell: IncomeCell, atIndexPath indexPath: NSIndexPath) {
        // Fetch Record
        let record:NSManagedObject = fetchedResultsController.object(at: indexPath as IndexPath) as! NSManagedObject
        
        print(record,record.value(forKey: "expenses"))
        // Update Cell
        if let name = record.value(forKey: "expensestitle") as? String{//valueForKey("incometitle") as? String {
            cell.lblTitle?.text = name
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE',' MMMM dd','yyyy'"
            let date: NSDate = record.value(forKey: "expensesdate") as! NSDate
            cell.lblDescription?.text = dateFormatter.string(from: date as Date)//record.value(forKey: "incomedate") as? String
            
            
            cell.lblIncome?.text = String(format:"%0.2f", (record.value(forKey: "expenses") as? Double)!)
        }
        
       
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
        
        lblMonth.text=monthArray[row] as? String
        
    }
    

    
    
    lazy var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult> = {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Expenses")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "expensesdate", ascending: true)]
        // fetchRequest.predicate = NSPredicate(format: "user.id = %@", self.friend!.id!)
        
        let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        frc.delegate = self
        return frc
    }()
    
    
    private func setupView() {
        do {
            try self.fetchedResultsController.performFetch()
            
            myExpeansesTableView .reloadData()
        } catch {
            let fetchError = error as NSError
            print("\(fetchError), \(fetchError.userInfo)")
        }
        
        self.updateView()
    }

    
    
    fileprivate func updateView() {
        var hasQuotes = false
        if let quotes = fetchedResultsController.fetchedObjects {
            hasQuotes = quotes.count > 0
        }
        myExpeansesTableView.isHidden = !hasQuotes
        
        myExpeansesTableView .reloadData()
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        myExpeansesTableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        myExpeansesTableView.endUpdates()
        
        //updateView()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch (type) {
        case .insert:
            if let indexPath = newIndexPath {
                myExpeansesTableView.insertRows(at: [indexPath], with: .fade)
            }
            break;
        case .delete:
            if let indexPath = indexPath {
                myExpeansesTableView.deleteRows(at: [indexPath], with: .fade)
            }
            break;
        case .update:
            /*if let indexPath = indexPath, let cell = myIncomeTableView.cellForRow(at: indexPath) as? UITableViewCell {
             //configureCell(cell, at: indexPath)
             configureCell(cell: cell, atIndexPath: indexPath as NSIndexPath)
             }*/
            break;
        case .move:
            if let indexPath = indexPath {
                myExpeansesTableView.deleteRows(at: [indexPath], with: .fade)
            }
            
            if let newIndexPath = newIndexPath {
                myExpeansesTableView.insertRows(at: [newIndexPath], with: .fade)
            }
            break;
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            myExpeansesTableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        case .delete:
            myExpeansesTableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        default:
            break;
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func addExpanses(_ sender: AnyObject) {
        
        
        
    }
    
    @IBAction func repeateExpenses(_ sender: AnyObject) {
    }
    
    
    
    
    @IBAction func selectMonth(_ sender: AnyObject) {
        if monthPicker.isHidden {
            monthPicker.isHidden = false
        }else{
            monthPicker.isHidden = true
        }
    }
    
    
    

}
