//
//  RegisterViewController.swift
//  Positudly
//
//  Created by Jake Dotts on 2/25/16.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let userRepeatPassword = repeatPasswordTextField.text;
        
        //check for empty fields
        if (userEmail!.isEmpty || userPassword!.isEmpty || userRepeatPassword!.isEmpty)
        {
            
            //display alert message
            
            displayMyAlertMessage("All fields are required");
            
            return;
            
        }
        //check if passwords match
        if(userPassword != userRepeatPassword)
        {
            //display an alert message
            
            displayMyAlertMessage("Passwords do not match");
            
            return;
        }
        
        //store data
        //store in a database when making app live
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey: "userEmail");
        NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey: "userPassword");
        NSUserDefaults.standardUserDefaults().synchronize();
        
        
        //NSUserDefaults.standardUserDefaults().setObject(userRepeatPassword, forKey: "userEmail");
        
        //display alert message with confirmation
        let myAlert = UIAlertController(title: "Alert", message: "Registration is successful, THANK YOU!", preferredStyle: UIAlertControllerStyle.Alert);
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default){
            action in
            self.dismissViewControllerAnimated(true, completion: nil);
        }
        
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated:true, completion: nil);
        
        
    }
    
    
    func displayMyAlertMessage(userMessage:String){
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler:nil);
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated: true, completion: nil);
        
    }
    
    @IBAction func registerCancelButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
