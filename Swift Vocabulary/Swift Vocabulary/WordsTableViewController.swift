//
//  WordsTableViewController.swift
//  Swift Vocabulary
//
//  Created by Timothy Rooney on 5/29/20.
//  Copyright © 2020 Timothy Rooney. All rights reserved.
//

import UIKit

class WordsTableViewController: UITableViewController {

    var wordList: [VocabularyWord] = [
        VocabularyWord(word: "Variable", definition: "Variables are containers for storing mutable data values."),
        VocabularyWord(word: "Constant", definition: "Constants refer to fixed values that a program may not alter during its execution."),
        VocabularyWord(word: "Function", definition: "Functions are self-contained chunks of code that perform a specific task.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return wordList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)

        cell.textLabel?.text = wordList[indexPath.row].word

        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDefinitionSegue" {
            guard let definitionVC = segue.destination as? DefinitionViewController else { return }
        
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let vocabWord = wordList[indexPath.row]
            definitionVC.vocabWord = vocabWord
        
        }
    }

}
