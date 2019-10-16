//
//  PlayViewController.swift
//  Football
//
//  Created by apcs7 on 10/27/17.
//  Copyright © 2017 apcs7. All rights reserved.
//

import UIKit
import CoreData

class PlayViewController: UIViewController
{
    @IBOutlet weak var formationNameText: UITextField!
    @IBOutlet weak var downText: UITextField!
    @IBOutlet weak var yardsText: UITextField!
    @IBOutlet weak var formationView: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        print(viewNum)
    }
    
    @IBAction func saveButton(_ sender: UIButton)
    {  
        if viewNum == 1 {
            saveData(num: 1)
        } else if viewNum == 2 {
            saveData(num: 2)
        }
        //getData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCalc" {
            let this = segue.destination as! CalcViewController
//            this.onsave = { (data) in
//                self.formationNameText.text = data
//            }
            getData()
            //this.calcTableView.reloadData()
        }
    }
    
    func saveData(num: Int)
    {
        var exists = false
        getData()
        
      context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if num == 1 {
            let form = Form(context: context)
            form.formName = formationNameText.text
            //print(form.formName)
            
//            do {
//                var name = try form.formName
//                for i in name! {
//                    print("for loop")
//                    if String(i) == formationNameText.text {
//                        exists = true
//                    } else {
//                        print("form working")
//                    }
//                }
//                if exists == false {
//                    form.formName = formationNameText.text!
//                }
//            } catch {
//                print(error.localizedDescription)
//            }
//
            
//            if let name = form.formName {
//                for i in name {
//                    if String(i) == formationNameText.text {
//                        exists = true
//                    } else {
//
//                    }
//                }
//                if exists == false {
//                    form.formName = formationNameText.text
//                }
//            }
            
            
            //form.formName = formationNameText.text
            
//            guard let name = form.formName else {return print("not working")}
//            for i in name {
//                print("for loop")
//                if String(i) == formationNameText.text {
//                    exists = true
//                } else {
//                    print("form working")
//                }
//            }
//            if exists == false {
//                form.formName = formationNameText.text!
//            }
        } else if num == 2 {
            let play = Play(context: context)
            play.playName = formationNameText.text
            
            
//            guard let name = play.playName else {return print("not working")}
//            for i in name {
//                print("for loop")
//                if String(i) == formationNameText.text {
//                    exists = true
//                } else {
//                    print("play working")
//                }
//                if exists == false {
//                    play.playName = formationNameText.text
//                }
//            }
//            if let name = play.playName {
//                for i in name {
//                    if String(i) == formationNameText.text {
//                        exists = true
//                    } else {
//
//                    }
//                }
//                if exists == false {
//                    play.playName = formationNameText.text
//                }
//            }
           
        }

//        form.down = downText.text!
//        form.yard = yardsText.text!
//        let img = formationView.image
//        let imgData = UIImageJPEGRepresentation(img!, 1)
//        form.formImage = imgData
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
//        do
//        {
//            try context.save()
//        }
//        catch
//        {
//            let nserror = error as NSError
//            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//        }
        
    }
    
}

