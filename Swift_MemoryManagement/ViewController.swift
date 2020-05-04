//
//  ViewController.swift
//  Swift_MemoryManagement
//
//  Created by Ravikumar on 4/23/20.
//  Copyright © 2020 Ravikumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController,Second_VCDelegate {
    
    
    func getNameSample(name: String) {
        print("get name\(name)")
        audioPlayer = nil
    }
    
    
    
    var audioPlayer: Second_VCDelegate?


    @IBOutlet weak var myLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //........................... Notifications Memory Leaks
   //     NotificationCenter.default.post(name: Notification.Name("notify"), object: nil)

//        var first:Myclass? = Myclass()
//          var second  = first
//       //   second.myInt = 5
//        var third = second
//
//        first = nil
//        second = nil
//        third = nil
//        print(first?.myInt as Any) // Here value will be nil beacuse reference count 0
//        print(second?.myInt as Any) // Here value will be nil because reference count 0
//
//
//
//
//        var mom: Parent? = Parent()
//        mom = nil

        
        var joe: Person?
        var dev : Job?
        
        joe = Person()
        dev = Job()
        
        joe?.job = dev
        dev?.person = joe
        
        joe = nil
        dev = nil

        
        //................... Closures
//        var sampl = {
//            print("Sample Closure")
//        }
//
//        var printName = { (name : String) -> Void in
//            print("name -->\(name)") }
        self.sample()
    }
   
    
    func sample() {
        
        
        //..................... Here We can test Callbacks memory leaks
        
      
        

    }
    @IBAction func pushView(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Second_VC") as? Second_VC
        vc?.audioPlayer = self
        self.navigationController?.pushViewController(vc!, animated: true)


    }
    
    
    func doAnimation(showlable:Bool) {
        let text = "Some Text"
    }
    
    deinit {
        print("Deallocated Protocol Objects")
    }
    
}






//class Myclass {
//    var myInt  = 8
//
//    deinit {
//        print("My class will be deallocated")
//    }
//
//}

//.........................Start Parent and Child

//class Child {
//
//    deinit {
//        print("Child class will be deallocated")
//    }
//}
//class Parent {
//    var child = Child()
//    deinit {
//        print("Parent class will be deallocated")
//    }
//}
//.........................End Parent and Child


class Job {
    
    var person: Person?
    deinit {
        print("Deallocating Job")
    }
}

class Person {
    
  weak  var job: Job?
    deinit {
        print("Deallocating Person")
    }
}

