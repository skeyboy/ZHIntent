//
//  IntentManager.swift
//  ZHIntent
//
//  Created by le on 2018/2/6.
//  Copyright © 2018年 le. All rights reserved.
//

import Foundation
#if os(iOS)
import UIKit
#endif
public typealias IntentForResult = (_ resultCode:Int, _ requestCode: Int, _ data:Serializable)->Void
public protocol Present {
    func start(_ intent:Intent) -> Void
    func start(_ intent:Intent, forResult result :@escaping IntentForResult) -> Void
}
public protocol IntentProtocol {
    var intentForResult:IntentForResult?{get set}
}

extension UIViewController{
   open var intent:Intent? {
        set(newValue){
            let key =     UnsafePointer<Any>.init(bitPattern: self.hashValue + "Intent".hashValue)
            objc_setAssociatedObject(self, key!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get{
            let key =     UnsafePointer<Any>.init(bitPattern: self.hashValue + "Intent".hashValue)

            return objc_getAssociatedObject(self, key!) as? Intent
        }
    }
  open  var intentResult: IntentForResult?{
        set(newValue){
            let key =     UnsafePointer<Any>.init(bitPattern: self.hashValue + "intentResult".hashValue)
            objc_setAssociatedObject(self, key!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get{
            let key =     UnsafePointer<Any>.init(bitPattern: self.hashValue + "intentResult".hashValue)

            return objc_getAssociatedObject(self, key!) as? IntentForResult
        }
    }
    
}

class DefaultPresent: Present{
 
   open func start(_ intent:Intent) {
        intent.fromVC?.present(intent.toVC!, animated: intent.animated, completion: intent.completion )
    }
 open   func start(_ intent: Intent, forResult result: @escaping (Int, Int, Serializable) -> Void) {
        
        intent.toVC?.intentResult = result
        intent.fromVC?.present(intent.toVC!, animated: intent.animated, completion: intent.completion )
        
    }
    
}

open class PushPresent: Present {
    
 open   func start(_ intent:Intent) {
        if nil != intent.fromVC?.navigationController {            intent.fromVC?.navigationController?.pushViewController(intent.toVC!, animated: intent.animated)
        }
    }
 open   func start(_ intent: Intent, forResult result: @escaping (Int, Int, Serializable) -> Void) {
        
        intent.toVC?.intentResult = result
        if nil != intent.fromVC?.navigationController {            intent.fromVC?.navigationController?.pushViewController(intent.toVC!, animated: intent.animated)
        }
    }
}
open class IntentManager{
   public static let manager:IntentManager = IntentManager()
    private init() {}
 open   func start(_ intent:Intent) -> Void {
        intent.toVC?.intent = intent
        intent.present.start(intent)
    }
    
  open  func start(_ intent:Intent, forResult result: @escaping IntentForResult) -> Void {
        intent.toVC?.intent = intent
        intent.present.start(intent, forResult: result)
    }
}
