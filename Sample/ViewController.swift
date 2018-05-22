//
//  ViewController.swift
//  Sample
//

import UIKit
import KeychainService

class ViewController: UIViewController {
    
    @IBOutlet weak var edEmail: UITextField!
    @IBOutlet weak var edPass: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSave() {
        let kch = KeychainService(service: Bundle.main.bundleIdentifier!, account: edEmail.text!)
        
        do {
            try kch.savePassword(edPass.text!)
        } catch {
            
        }
        
    }
    
    @IBAction func btnResive() {
        let kch = KeychainService(service: Bundle.main.bundleIdentifier!, account: edEmail.text!)
        do {
            try lbResult.text = kch.readPassword()
        } catch
        {
            lbResult.text = "Nothing was retrieved from the keychain."
        }
    }
}

