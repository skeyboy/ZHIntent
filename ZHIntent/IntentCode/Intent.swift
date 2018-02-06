//
//  Intent.swift
//  ZHIntent
//
//  Created by le on 2018/2/6.
//  Copyright © 2018年 le. All rights reserved.
//

import Foundation
    #if os(iOS)
import UIKit
    #endif
class Intent: Serializable {
    var map:[String:Serializable] = [String: Serializable]()
    var fromVC:UIViewController?
    var toVC:UIViewController?
    var animated:Bool = true
    var completion:(()->Void)?
    var present:Present = DefaultPresent()
    var requestCode:Int = -1
    var resultCode:Int = -1
}
extension Intent{
    convenience init(from fromVC:UIViewController, to toVC:UIViewController){
        self.init()
        self.fromVC = fromVC
        self.toVC = toVC
    }
}
extension Intent: Equatable{
    public static func ==(lhs: Intent, rhs: Intent) -> Bool{
        
        return false
    }
}
extension Intent{
    func put(_ key:String, extractInt extract:Int) -> Void {
        map[key] = extract
    }
    func put(_ key:String, extractInt extract:Int8) -> Void {
        map[key] = extract
    }
    func put(_ key:String, extractInt extract:Int16) -> Void {
        map[key] = extract
    }
    func put(_ key:String, extractInt extract:Int32) -> Void {
        map[key] = extract
    }
    func put(_ key:String, extractInt extract:Int64) -> Void {
        map[key] = extract
    }
    
}
extension Intent{
    func put(_ key:String, extractUInt extract:UInt) -> Void {
        map[key] = extract
    }
    func put(_ key:String, extractUInt extract:UInt8) -> Void {
        map[key] = extract
    }
    func put(_ key:String, extractUInt extract:UInt16) -> Void {
        map[key] = extract
    }
    func put(_ key:String, extractUInt extract:UInt32) -> Void {
        map[key] = extract
    }
    func put(_ key:String, extractUInt extract:UInt64) -> Void {
        map[key] = extract
    }
    
}

extension Intent{
    func put(_ key:String, extractFloat extract:Float) -> Void {
        map[key] = extract
    }
    func put(_ key:String, extractDouble extract:Double) -> Void {
        map[key] = extract
    }
}

extension Intent{
    func put(_ key:String, extractString extract:String) -> Void {
        map[key] = extract
    }
    func put<T>(_ key:String, extractArray extract:Array<T>) -> Void {
        map[key] = extract
    }
    func put(_ key:String, extractDictionary extract:Dictionary<String, Any>) -> Void {
        map[key] = extract
    }
    
    func put(_ key:String, extractSerializable extract:Serializable) -> Void {
        map[key] = extract
    }
    
}
extension Intent{
    func put<T:Serializable>(_ key:String, extractSerializable extract:T) -> Void {
        map[key] = extract
    }
    func put(_ key:String, extractIntent extract:Intent) -> Void {
        map[key] = extract
    }
}

extension Intent {
    open func dismiss(animated flag: Bool, completion: (() -> Swift.Void)? = nil){
        toVC?.dismiss(animated: animated, completion: completion)
    }
}
