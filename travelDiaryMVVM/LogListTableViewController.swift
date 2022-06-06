//
//  LogListTableViewController.swift
//  travelDiaryMVVM
//
//  Created by Isiah Parra on 6/6/22.
//

import UIKit

class LogListTableViewController: UITableViewController {

    var viewModel: LogListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Initializing the view model that this view needs
        viewModel = LogListViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadData()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.logs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "logCell", for: indexPath)

        let log = viewModel.logs[indexPath.row]
        cell.textLabel?.text = log.name

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.delete(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? LogDetailViewController else {return}
        if segue.identifier == "toDetailVC" {
            //They are accessing via the cell
           guard let index = tableView.indexPathForSelectedRow else {return}
            let log = viewModel.logs[index.row]
            destination.viewModel = LogDetailViewModel(log: log)
        } else {
            // they are not accessing the detailVC via the cell
            destination.viewModel = LogDetailViewModel()
        }
    }
}
