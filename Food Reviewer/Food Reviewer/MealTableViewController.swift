//
//  MealTableViewController.swift
//  Food Reviewer
//
//  Created by Dev Jhaveri on 1/9/19.
//  Copyright © 2019 Dartmouth College. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var meals = [Meal]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load yummy food
        loadSampleMeals()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create a table view cell identifier
        let cellIdentifier = "MealTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            as? MealTableViewCell else {
                fatalError("The dequeued cell is not an instance of MealTableViewCell")
        }

        // Fetches the appropriate meal for the data source layout.
        let meal = meals[indexPath.row]

        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating
        
        return cell
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    //MARK: Actions
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let source = sender.source as?MealViewController, let meal = source.meal {
            // Add a new meal.
            let newIndexPath = IndexPath(row: meals.count, section: 0)
            meals.append(meal)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    //MARK: Private Methods
    
    private func loadSampleMeals() {
        let paneerPhoto = UIImage(named: "paneer")
        let dosaPhoto = UIImage(named: "dosa")
        let jalebiPhoto = UIImage(named: "jalebi")
        
        guard let paneer = Meal(name: "Paneer", photo: paneerPhoto, rating: 5) else {
            fatalError("Unable to instantiate Paneer")
        }
        
        guard let dosa = Meal(name: "Dosa", photo: dosaPhoto, rating: 5) else {
            fatalError("Unable to instantiate Dosa")
        }
        
        guard let jalebi = Meal(name: "Jalebi", photo: jalebiPhoto, rating: 5) else {
            fatalError("Unable to instantiate Jalebi")
        }
        
        meals += [paneer, dosa, jalebi]
    }

}