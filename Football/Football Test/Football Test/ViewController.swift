//
//  ViewController.swift
//  Football
//
//  Created by apcs7 on 10/23/17.
//  Copyright © 2017 apcs7. All rights reserved.
//

import UIKit
import CoreData

var form: [Form] = []
var viewNum = 0
var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
func getData()
{
    do
    {
        form = try context.fetch(Form.fetchRequest())
        play = try context.fetch(Play.fetchRequest())
    }
    catch
    {
        print("Fetching Failed")
    }
}

func saveData()
{
    // Use this part where we save the images
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let form = Form(context: context) // Link Task & Context
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
    do
    {
        try context.save()
    }
    catch
    {
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
    }
}

class ViewController: UIViewController, UITableViewDelegate, UISearchControllerDelegate
{
    
    fileprivate let reuseCellIdentifier = "reuseCellIdentifier"
    fileprivate let footList = SearchDataSource.createList()
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    fileprivate var filteredFootList = [Search]()
    
    @IBOutlet weak var formTableView: UITableView!
    //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let formVar = Form(context: context)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        //testData()
        //let value = UIInterfaceOrientation.portrait.rawValue
        //UIDevice.current.setValue(value, forKey: "orientation")
        getData()
        configureSearchController()
        //formVar.formName = "Test"
        formTableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        getData()
        formTableView.reloadData()
    }
    
    func configureSearchController()
    {
        searchController.searchResultsUpdater = self as UISearchResultsUpdating
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        formTableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.scopeButtonTitles = ["All", "Pro", "Trip", "Iso"]
        searchController.searchBar.delegate = self
    }
    
    func filterSearchController(_ searchBar: UISearchBar) {
        guard let scopeString = searchBar.scopeButtonTitles?[searchBar.selectedScopeButtonIndex] else { return }
        let selectedElement = Search.Element(rawValue: scopeString) ?? .All
        let searchText = searchBar.text ?? ""
        
        // filter pokemonList by element and text
        filteredFootList = footList.filter { words in
            let isElementMatching = (selectedElement == .All) || (words.element == selectedElement)
            let isMatchingSearchText = words.name.lowercased().contains(searchText.lowercased()) || searchText.lowercased().characters.count == 0
            return isElementMatching && isMatchingSearchText
        }
        formTableView.reloadData()
    }
    
    func testData()
    {
        let form = Form(context: context)
        form.formName = "Hello"
    }

//    func testData() {
//        let form = Form(context: context)
//        form.formName = "Hello"
//    }

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
//    {
//        return form.count
//    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
//    {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
//        let formVar = form[indexPath.row]
//        if let cellText = formVar.formName
//        {
//            cell.textLabel?.text = cellText
//        }
//        //cell.detailTextLabel?.text = ""
//        //        let data = try? Data(contentsOf: imageURL)
//        //        if let data = data
//        //        {
//        //            let image = UIImage(data: data)
//        //            DispatchQueue.main.async
//        //                {
//        //                    cell.imageView?.image = image
//        //                }
//        //        }
//        //        if let cellImage = formVar.formImage {
//        //            imageView.image = cellImage
//        //        }
//        //  if let cellImage = formVar.formImage {
//        //            let img = UIImage(named: .formImage)
//        //            let imageData = UIImagePNGRepresentation(img)
//        //            imageView.image = UIImage(data:imageData as Data,scale:1.0)
//        //            imageView.image = cellImage as? UIImage
//        //            cell.imageView?.image = UIImage(data: formVar.formImage!)
//        //  }
//        //        let imgItem = imageItemArray[indexPath.row]
//        //        cell.formationView.image = UIImage(named: imgItem.imageName!)
//        //        cell.formationNameText.text = imgItem.imageName!
//        return cell
//    }

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
//    {
//        return form.count
//    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
//    {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
//        let formVar = form[indexPath.row]
//        if let cellText = formVar.formName
//        {
//            cell.textLabel?.text = cellText
//        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
//        let wordSearch = searchController.isActive ? filteredPokemonList[indexPath.row] : pokemonList[indexPath.row]
//        cell.textLabel!.text = wordSearch.name
//        cell.detailTextLabel?.text = wordSearch.element.rawValue
//        cell.imageView!.image = wordSearch.image
//                let data = try? Data(contentsOf: imageURL)
//                if let data = data
//                {
//                    let image = UIImage(data: data)
//                    DispatchQueue.main.async
//                        {
//                          cell.imageView?.image = image
//                        }
//                }
//                if let cellImage = formVar.formImage {
//                    imageView.image = cellImage
//                }
//          if let cellImage = formVar.formImage {
//                    let img = UIImage(named: .formImage)
//                    let imageData = UIImagePNGRepresentation(img)
//                    imageView.image = UIImage(data:imageData as Data,scale:1.0)
//                    imageView.image = cellImage as? UIImage
//                    cell.imageView?.image = UIImage(data: formVar.formImage!)
//          }
//                let imgItem = imageItemArray[indexPath.row]
//                cell.formationView.image = UIImage(named: imgItem.imageName!)
//                cell.formationNameText.text = imgItem.imageName!
//        return cell
//    }


    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            let formVar = form[indexPath.row]
            context.delete(formVar)
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
        formTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        viewNum = 1
    }
}

extension ViewController : UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int)
    {
        filterSearchController(searchBar)
    }
}

extension ViewController : UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController)
    {
        filterSearchController(searchController.searchBar)
    }
}

extension ViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let wordSearch = searchController.isActive ? filteredFootList[indexPath.row] : footList[indexPath.row]
        cell.textLabel!.text = wordSearch.name
        cell.detailTextLabel?.text = wordSearch.element.rawValue
        cell.imageView!.image = wordSearch.image
        let formVar = form[indexPath.row]
        if let cellText = formVar.formName
                {
                    cell.textLabel?.text = cellText
                }
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return searchController.isActive ? filteredFootList.count : footList.count
    }
}
