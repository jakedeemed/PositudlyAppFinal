//
//  DetailViewController.swift
//  Positudly
//
//  Created by Jake Dotts on 2/25/16.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    @IBOutlet weak var gratefuleOneField: UITextField!
    @IBOutlet weak var gratefuleTwoField: UITextField!
    @IBOutlet weak var gratefuleThreeField: UITextField!
    @IBOutlet weak var accomplishmentsField: UITextView!
    @IBOutlet weak var reflectionField: UITextView!

    
    
    
    
    var detailItem: AnyObject? {
        
        didSet {
            
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if objects.count == 0 {
            return
        }
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        detailViewController = self
        self.configureView()
        
        //tap gesture
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    @IBAction func buttonOne(sender: AnyObject) {
        let one = gratefuleOneField.text
        let two = gratefuleTwoField.text
        let three = gratefuleThreeField.text
        
        
        NSUserDefaults.standardUserDefaults().setObject(one, forKey: "one");
        NSUserDefaults.standardUserDefaults().setObject(two, forKey: "two");
        NSUserDefaults.standardUserDefaults().setObject(three, forKey: "three");
        NSUserDefaults.standardUserDefaults().synchronize();
        
    }*/
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //enter detail description info here if you want that to update
        
        saveAndUpdate()
    }

    func saveAndUpdate(){
        masterView?.save()
        masterView?.tableView.reloadData()
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

}

