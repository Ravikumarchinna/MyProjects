//
//  Second_VC.swift
//  Swift_MemoryManagement
//
//  Created by Ravikumar on 4/23/20.
//  Copyright © 2020 Ravikumar. All rights reserved.
//

import UIKit

protocol Second_VCDelegate:AnyObject {
    func getNameSample(name:String)
}

//enum Gender:String {
//    case male
//    case female
//}
//
//
//
//
//
//class service {
//    var vc:Second_VC? = nil
//   }


class Second_VC: UIViewController {
    
    var params = [String:String]()
    
    @IBOutlet weak var getProtocol: UIButton!
    
  weak var audioPlayer: Second_VCDelegate?

    @IBAction func getprotocolAction(_ sender: Any) {
        audioPlayer?.getNameSample(name: "Ravikumar")
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //........................ in closure Memory management
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "notify"), object: nil, queue: .main) {[unowned self] (notification) in
            self.showalert()
        }
    }
    
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: "notify"), object: nil)
    }
    
    
    //.....................This is good example for closure memorymangement.
    @objc func showalert() {
        let alertvc = UIAlertController.init(title: "Info", message: "it is processing", preferredStyle: .alert)
        present(alertvc, animated: true, completion: nil)

    }


}


























































