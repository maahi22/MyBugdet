//
//  MyIncomeVC.swift
//  MyBugdet
//
//  Created by Maahi on 08/01/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit
import CoreData

class MyIncomeVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource,NSFetchedResultsControllerDelegate {

    @IBOutlet weak var myIncomeTableView: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMonth: UILabel!
    @IBOutlet weak var lblIncome: UILabel!
    @IBOutlet weak var btnRepeate: UIButton!
    @IBOutlet weak var monthPicker: UIPickerView!
    
    //let fetchedResultsController : NSFetchedResultsController
    var incomeArray = NSMutableArray()
    var monthArray = NSMutableArray()
    var yearArray = NSMutableArray()
    
    var strtDate:NSDate? = nil
    var endDate:NSDate? = nil
    var year: String?=nil
    
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
        
        self.yearArray.add("2017")
        self.setupView()
        let currentDate = Date()
        self.SetDate(date:currentDate as NSDate)
        
        //lblIncome.text = (fetchedResultsController.fetchedObjects).val//valueForKey("sum.Income")
    }

   // let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private func setupView() {
        do {
            try self.fetchedResultsController.performFetch()
            
            myIncomeTableView .reloadData()
        } catch {
            let fetchError = error as NSError
            print("\(fetchError), \(fetchError.userInfo)")
        }
        
        self.updateView()
    }
    
    
    
    
    lazy var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult> = {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Income")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "incomedate", ascending: true)]
        fetchRequest.returnsObjectsAsFaults=false
        
        
       // fetchRequest.predicate = NSPredicate(format: "incomedate LIKE[cd] %@", "*-01-2017")
       // fetchRequest.predicate = NSPredicate(format: "user.id = %@", self.friend!.id!)
        //let moc = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        frc.delegate = self
        return frc
    }()
    
    fileprivate func updateView() {
        var hasQuotes = false
        if let quotes = fetchedResultsController.fetchedObjects {
            hasQuotes = quotes.count > 0
        }
        myIncomeTableView.isHidden = !hasQuotes
        
        myIncomeTableView .reloadData()
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        myIncomeTableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        myIncomeTableView.endUpdates()
        
        //updateView()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch (type) {
        case .insert:
            if let indexPath = newIndexPath {
                myIncomeTableView.insertRows(at: [indexPath], with: .fade)
            }
            break;
        case .delete:
            if let indexPath = indexPath {
                myIncomeTableView.deleteRows(at: [indexPath], with: .fade)
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
                myIncomeTableView.deleteRows(at: [indexPath], with: .fade)
            }
            
            if let newIndexPath = newIndexPath {
                myIncomeTableView.insertRows(at: [newIndexPath], with: .fade)
            }
            break;
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            myIncomeTableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        case .delete:
            myIncomeTableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        default:
            break;
        }
    }
    
    
    
    
    
    
//    let AppDel = UIApplication.shared.delegate as? AppDelegate
//    let context:NSManagedObjectContext = (AppDel?.managedObjectContext)!
//    let fetchRequest = NSFetchRequest(entityName: "ProductItem")
//    fetchRequest.predicate = NSPredicate(format: "barcodeNum == %@",codeNumber)
//    let results = try! context.executeFetchRequest(fetchRequest) as! [ProductItem]
//    if results.count > 0 { // great, you found (at least one) matching item
//    let scannedProduct = results[0]
//    // from here you can access the attributes of the product
//    // such as title, price, sku, etc.
//    ...
//    } else { // not found
//    ...
//    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
   
        if segue.identifier == "toaddIncome"{
            if let nextViewController = segue.destination as? AddVC{
                    nextViewController.incomeStatus = true
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
    
    

    
    
        func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
    
            if let sections = fetchedResultsController.sections {
                let sectionInfo = sections[section]
                return sectionInfo.numberOfObjects
            }
    
            return 0
        }

    
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! IncomeCell
        
        // Configure Table View Cell
        configureCell(cell: cell, atIndexPath: indexPath as NSIndexPath)
        return cell

        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        cell.textLabel?.text = incomeArray[indexPath.section] as? String
//        return cell
    }

    
    
    
    
    func configureCell(cell: IncomeCell, atIndexPath indexPath: NSIndexPath) {
        // Fetch Record
        let record:NSManagedObject = fetchedResultsController.object(at: indexPath as IndexPath) as! NSManagedObject
        
        print(record,record.value(forKey: "income"))
        // Update Cell
        if let name = record.value(forKey: "incometitle") as? String{//valueForKey("incometitle") as? String {
            cell.lblTitle?.text = name
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE',' MMMM dd','yyyy'"
            let date: NSDate = record.value(forKey: "incomedate") as! NSDate
            cell.lblDescription?.text = dateFormatter.string(from: date as Date)//record.value(forKey: "incomedate") as? String
            
            
            cell.lblIncome?.text = String(format:"%0.2f", (record.value(forKey: "income") as? Double)!)
         }
    
        /* if let done = record.valueForKey("done") as? Bool {
         cell.doneButton.selected = done
         }*/
    }

    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let indexPa  =  NSIndexPath(row: 1, section: 0) as IndexPath //[NSIndexPath indexPathForRow:4 inSection:0]
        let cell = myIncomeTableView.cellForRow(at: indexPa) as! IncomeCell
        
        print(cell.lblIncome?.text)

    
    }
    
    
    // MARK: -
    // MARK: Fetched Results Controller Delegate Methods
//    private func controllerWillChangeContent(controller: NSFetchedResultsController<AnyObject>) {
//        myIncomeTableView.beginUpdates()
//    }
//    
//    private func controllerDidChangeContent(controller: NSFetchedResultsController<AnyObject>) {
//        myIncomeTableView.endUpdates()
//    }
    
    
    
    
    
    
    func SetDate(date:NSDate) -> Void {
     
        
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date as Date)
        let month = calendar.component(.month, from: date as Date)
        let day = calendar.component(.day, from: date as Date)
        
        print(self.lastDayOfMonth (date: date as Date))
        
        
        let c = NSDateComponents()
        c.year = year
        c.month = month
        c.day = -1
        
        let endOfMonth = calendar.date(byAdding: c as DateComponents, to: date as Date)
         print(endOfMonth)

        
        
        // Get NSDate given the above date components
        let date:Date = (NSCalendar(identifier: NSCalendar.Identifier.gregorian)?.date(from: c as DateComponents))!
        
        print(DateFormatter.localizedString(from: date, dateStyle: .medium, timeStyle: .short))
        
        
    }
    
    
    
    
    
    //Picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 1{
        return yearArray.count
        }else{

        return monthArray.count;
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if(component==0){
            return monthArray[row] as? String
        } else{
        return yearArray[row] as? String
        }
        
       
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(component==0)
        {
            lblMonth.text=monthArray[row] as? String

        }
        else
        {
            year=yearArray[row] as? String
            
            print(year! as String)
        }
        
        
        let c = NSDateComponents()
        c.year = 2017
        c.month = row+1
        c.day = 1
        
        // Get NSDate given the above date components
        let date:Date = (NSCalendar(identifier: NSCalendar.Identifier.gregorian)?.date(from: c as DateComponents))!
        self.SetDate(date:date as NSDate)
        
    }
    
    
    
    
    
    
    
    @IBAction func repeateIncomeClick(_ sender: AnyObject) {
        
        
        
    }
    
    
    
    @IBAction func selectMonth(_ sender: AnyObject) {
       
        
        let indexPa  =  NSIndexPath(row: 1, section: 0) as IndexPath //[NSIndexPath indexPathForRow:4 inSection:0]
        let cell = myIncomeTableView.cellForRow(at: indexPa) as! IncomeCell
        
        
        
        if monthPicker.isHidden {
            monthPicker.isHidden = false
        }else{
            monthPicker.isHidden = true
        }
    }
    
    
    
    //Add
    
    
    
   // Cancel
    
    func lastDayOfMonth(date :Date) -> Int {
        let calendar = NSCalendar.current
        let dayRange = calendar.range(of: .day, in: .month, for: date)
        let dayCount = dayRange?.count
        var comp = calendar.dateComponents([.year, .month, .day], from: date)
        comp.day = dayCount
        return dayCount!//calendar.date(from: comp)!
    }

    
}

//extension Date {
//    func lastDayOfMonth() -> Date {
//        let calendar = NSCalendar.current
//        let dayRange = calendar.range(of: .day, in: .month, for: self)
//        let dayCount = dayRange?.count
//        var comp = calendar.dateComponents([.year, .month, .day], from: self)
//        comp.day = dayCount
//        return calendar.date(from: comp)!
//    }
//}
