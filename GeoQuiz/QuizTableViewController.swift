//
//  QuizTableViewController.swift
//  GeoQuiz
//
//  Created by Naghmeh on 12/13/16.
//  Copyright © 2016 Naghmeh. All rights reserved.
//

import UIKit

class QuizTableViewController: UITableViewController {
    
    weak var model: CountryModel?
    var correctCapital: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("in get's in here")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        model = appDelegate.model
        if correctCapital != nil{
            print("correct capital is: \(correctCapital!)")
            model?.capitalChoicesList.removeAll()
            model?.setRandomChoiceList(correctCapital: correctCapital!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        print("sections")
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("numrows")
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        print("each cell")
        // Configure the cell...
        if model?.capitalChoicesList.count != 0
        {
            cell.textLabel?.text = model?.capitalChoicesList[indexPath.row]
        }
        else{
            cell.textLabel?.text = "hello"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("selected row number \(indexPath.row)")
        if(model?.capitalChoicesList[indexPath.row] == correctCapital)
        {
            model?.increaseScore()
            
            if let index = model?.listOfCountries.index(where:{($0 as! Location).capital == correctCapital})
            {
                model?.listOfCountries.remove(at: index)
            }
            
        }
        let message = "Correct answer is: \(correctCapital!) \nYou chose: \(model!.capitalChoicesList[indexPath.row])\nYour score is:\(model!.score)"
        let alert = UIAlertController(title: "Answer", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK",style: .default, handler: {action in self.performSegue(withIdentifier: "backToMap", sender: self)}))
        self.present(alert, animated: true, completion: nil)
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
