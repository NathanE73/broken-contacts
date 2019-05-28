//
//  ViewController.swift
//  BrokenContacts
//
//  Created by Nathan E. Walczak on 5/28/19.
//  Copyright © 2019 Nathan E. Walczak. All rights reserved.
//

import UIKit
import ContactsUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateAuthorizationStatusLabel()
    }
    
    @IBOutlet var authorizationStatusLabel: UILabel!
    
    func updateAuthorizationStatusLabel() {
        let authorizationStatus = CNContactStore.authorizationStatus(for: .contacts)
        switch authorizationStatus {
        case .authorized:
            authorizationStatusLabel.text = "authorized"
        case .denied:
            authorizationStatusLabel.text = "denied"
        case .notDetermined:
            authorizationStatusLabel.text = "not determined"
        case .restricted:
            authorizationStatusLabel.text = "restricted"
        @unknown default:
            authorizationStatusLabel.text = "unknown"
        }
    }
    
    @IBAction func requestAccess() {
        let contactStore = CNContactStore()
        contactStore.requestAccess(for: .contacts) { (authorized, error) in
            if let error = error {
                print(error)
            }
            OperationQueue.main.addOperation {
                self.updateAuthorizationStatusLabel()
            }
        }
    }
    
    @IBAction func presentNewContact() {
        let contactViewController = CNContactViewController(forNewContact: nil)
        contactViewController.delegate = self
        
        let navigationController = UINavigationController(rootViewController: contactViewController)
        present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func presentNewContactWithGroup() {
        let contactStore = CNContactStore()
        
        let groups = try? contactStore.groups(matching: nil)
        guard let parentGroup = groups?.first else {
            return
        }
        
        print("Using group: \(parentGroup.name)")
        
        let contactViewController = CNContactViewController(forNewContact: nil)
        contactViewController.delegate = self
        contactViewController.parentGroup = parentGroup
        
        let navigationController = UINavigationController(rootViewController: contactViewController)
        present(navigationController, animated: true, completion: nil)
    }
    
}

extension ViewController: CNContactViewControllerDelegate {
    
    func contactViewController(_ viewController: CNContactViewController, didCompleteWith contact: CNContact?) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
}
