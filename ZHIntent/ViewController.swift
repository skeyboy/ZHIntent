//
//  ViewController.swift
//  ZHIntent
//
//  Created by le on 2018/2/6.
//  Copyright © 2018年 le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func finished(_ sender: Any) {
        let result = self.intentResult
        if nil != result {
            result!(1,3,1234)
        }
        
        intent?.dismiss(animated: true, completion: {
            print("finish completion")
        })
    }
    @IBAction func startForResult(_ sender: Any) {
        let toVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")
        
        let intent = Intent(from: self, to: toVC!)
        intent.completion = {() in
            
        }
        intent.put("A", extractInt: 32)
        IntentManager.manager.start(intent) { (reqCode, resultCode, data) in
            print("\(reqCode) \(resultCode) \(data)")
        }
    }
    
    @IBAction func start(_ sender: Any) {
        let toVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")

        let intent = Intent(from: self, to: toVC!)
        intent.completion = {() in
            
        }
        intent.put("A", extractInt: 32)
        IntentManager.manager.start(intent)
//        IntentManager.manager
//            .start(intent) { (reqCode, resultCode, data) in
//            
//        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

