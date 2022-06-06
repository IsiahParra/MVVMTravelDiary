//
//  LogDetailViewController.swift
//  travelDiaryMVVM
//
//  Created by Isiah Parra on 6/6/22.
//

import UIKit

class LogDetailViewController: UIViewController {
    
    @IBOutlet weak var tripNameTextField: UITextField!
    @IBOutlet weak var entryTextView: UITextView!
    
    //MARK: PROPERTIES
    var viewModel: LogDetailViewModel!
    
    //MARK: LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        guard let log = viewModel.log else {return}
        tripNameTextField.text = log.name
        entryTextView.text = log.entry
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = tripNameTextField.text,
              let entry = entryTextView.text else {return}
        
        // save
        viewModel.saveLog(with: name, entry: entry)
        navigationController?.popViewController(animated: true)
    }
    
}
