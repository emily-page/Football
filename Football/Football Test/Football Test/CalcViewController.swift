//
//  CalcViewController.swift
//  Football
//
//  Created by apcs7 on 10/27/17.
//  Copyright © 2017 apcs7. All rights reserved.
//

import UIKit
import CoreData

var play: [Play] = []

class CalcViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    let stuff = ["please", "work", "for", "me"]
    
    @IBOutlet weak var calcTableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var onsave: ((_ data: String) -> ())?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        calcTableView.dataSource = self
        calcTableView.delegate = self
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        getData()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        getData()
    }
    @IBAction func deleteAll(_ sender: UIButton) {
        play.removeAll()
        //let formVar = form[IndexPath]
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Play")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        do {
            try context.execute(deleteRequest)
        } catch {
            print("Fetching Failed")
        }
        saveData()
        calcTableView.reloadData()
    }
    
    func getData()
        {
            do
            {
                play = try context.fetch(Play.fetchRequest())
                
            }
            catch
            {
                print("Fetching Failed")
            }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromCalc" {
            viewNum = 2
        }
    }
    
    @IBAction func addPlay(_ sender: UIButton) {
        viewNum = 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
//        let play = Play(context: context)
//        if let count = play.playName?.count {
//            return count
//        }
//        return 0
        return play.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell: CustomCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? CustomCellTableViewCell else { return UITableViewCell() }
        let playVar = play[indexPath.row]
//        cell.textLabel?.text = form[indexPath.row].down
//        cell.detailTextLabel?.text = form[indexPath.row].yard


        if let cellText = playVar.playName {
            cell.pname.text = cellText
        }




        if let cellText = playVar.playName {
            cell.pname.text = cellText
        }


        if let cellText = playVar.playName {
            cell.pname.text = cellText
        }

//        if let cellText = playVar.playName {
//            cell.textLabel?.text = cellText
//        }
        //cell.pname.text = playVar.playName
        //cell.pname.text = stuff[indexPath.row]
        //cell.textLabel?.text = stuff[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
    }
    
    @IBAction func formationButton(_ sender: UIButton)
    {
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            let playVar = play[indexPath.row]
            context.delete(playVar)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do
            {
                form = try context.fetch(Form.fetchRequest())
            }
            catch
            {
                print("Fetching Failed")
            }
        }
        calcTableView.reloadData()
    }
    
}

