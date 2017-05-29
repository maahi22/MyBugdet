//
//  RepeateShowVC.swift
//  MyBugdet
//
//  Created by Maahi on 15/01/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit
import CoreData

class RepeateShowVC: UIViewController, UITableViewDelegate,UITableViewDataSource,NSFetchedResultsControllerDelegate{

    @IBOutlet weak var repeatetableView: UITableView!
    var repeateIncomeSts:Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setupView()
        do {
            try self.fetchedResultsController.performFetch()
            
            repeatetableView .reloadData()
        } catch {
            let fetchError = error as NSError
            print("\(fetchError), \(fetchError.userInfo)")
        }
        
        self.updateView()
        
        
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
    }
    
    
    fileprivate func updateView() {
        var hasQuotes = false
        if let quotes = fetchedResultsController.fetchedObjects {
            hasQuotes = quotes.count > 0
        }
        repeatetableView.isHidden = !hasQuotes
        repeatetableView .reloadData()
    }

    private func setupView() {
        updateView()
    }
    
    
    
    lazy var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult> = {
       
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Repeat")
       
        /*if repeateIncomeSts == true {
            fetchRequest.predicate = NSPredicate(format: "repeatType = 'income'")
        }else{
            fetchRequest.predicate = NSPredicate(format: "repeatType = 'expenses'")
        }*/
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "modificationdate", ascending: true)]
        fetchRequest.returnsObjectsAsFaults=false
        // fetchRequest.predicate = NSPredicate(format: "user.id = %@", self.friend!.id!)
        //let moc = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        frc.delegate = self
        return frc
    }()
    
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        repeatetableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        repeatetableView.endUpdates()
        
        //updateView()
    }

    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch (type) {
        case .insert:
            if let indexPath = newIndexPath {
                repeatetableView.insertRows(at: [indexPath], with: .fade)
            }
            break;
        case .delete:
            if let indexPath = indexPath {
                repeatetableView.deleteRows(at: [indexPath], with: .fade)
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
                repeatetableView.deleteRows(at: [indexPath], with: .fade)
            }
            
            if let newIndexPath = newIndexPath {
                repeatetableView.insertRows(at: [newIndexPath], with: .fade)
            }
            break;
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            repeatetableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        case .delete:
            repeatetableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        default:
            break;
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepeteIncomeCell", for: indexPath) as! RepeteIncomeCell
        // Configure Table View Cell
        configureCell(cell: cell, atIndexPath: indexPath as NSIndexPath)
        return cell
        
    }
    
    func configureCell(cell: RepeteIncomeCell, atIndexPath indexPath: NSIndexPath) {
        // Fetch Record
        let record:NSManagedObject = fetchedResultsController.object(at: indexPath as IndexPath) as! NSManagedObject
        
        print(record,record.value(forKey: "repeatmode"))
        // Update Cell
        if let name = record.value(forKey: "repeatmode") as? String{//valueForKey("incometitle") as? String {
            cell.lblTitle?.text = name
            cell.lblDescription?.text = String(format:"$ %0.2f",( record.value(forKey: "amount") as? Double)!)
        }
    }


}
