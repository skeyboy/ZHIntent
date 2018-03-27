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
open class Intent: Serializable {
  private  var map:[String:Serializable] = [String: Serializable]()
   public var fromVC:UIViewController?
   public var toVC:UIViewController?
  public  var animated:Bool = true
  public  var completion:(()->Void)?
    
   public var present:Present?
    
  public  var requestCode:Int = -1
   public var resultCode:Int = -1
    public init(){}
    private  let semaphore = DispatchSemaphore(value: 1)
}
extension Intent{
    public convenience init(from fromVC:UIViewController, to toVC:UIViewController){
        self.init()
      
     
        
        self.fromVC = fromVC
        self.toVC = toVC
        self.present = DefaultPresent()
    }
}
extension Intent: Equatable{
    public static func ==(lhs: Intent, rhs: Intent) -> Bool{
        
        return false
    }
}

extension Intent{
    public func get(valueForKey key:String ) ->Serializable?{
        return map[key]
    }
}
extension Intent{
  open  func put(_ key:String, extractInt extract:Int) -> Void {
        semaphore.wait()
        map[key] = extract
        semaphore.signal()
    }
   open func put(_ key:String, extractInt extract:Int8) -> Void {
        semaphore.wait()
        map[key] = extract
        semaphore.signal()
    }
  open  func put(_ key:String, extractInt extract:Int16) -> Void {
    semaphore.wait()
    map[key] = extract
    semaphore.signal()
    }
   open func put(_ key:String, extractInt extract:Int32) -> Void {
    semaphore.wait()
    map[key] = extract
    semaphore.signal()
    }
   open func put(_ key:String, extractInt extract:Int64) -> Void {
    semaphore.wait()
    map[key] = extract
    semaphore.signal()
    }
    
}
extension Intent{
   open func put(_ key:String, extractUInt extract:UInt) -> Void {
    semaphore.wait()
    map[key] = extract
    semaphore.signal()
    }
   open func put(_ key:String, extractUInt extract:UInt8) -> Void {
    semaphore.wait()
    map[key] = extract
    semaphore.signal()
    }
   open func put(_ key:String, extractUInt extract:UInt16) -> Void {
    semaphore.wait()
    map[key] = extract
    semaphore.signal()
    }
    open func put(_ key:String, extractUInt extract:UInt32) -> Void {
        semaphore.wait()
        map[key] = extract
        semaphore.signal()
    }
   open func put(_ key:String, extractUInt extract:UInt64) -> Void {
    semaphore.wait()
    map[key] = extract
    semaphore.signal()
    }
    
}

extension Intent{
   open func put(_ key:String, extractFloat extract:Float) -> Void {
    semaphore.wait()
    map[key] = extract
    semaphore.signal()
    }
  open  func put(_ key:String, extractDouble extract:Double) -> Void {
    semaphore.wait()
    map[key] = extract
    semaphore.signal()
    }
}

extension Intent{
   public func put(_ key:String, extractString extract:String) -> Void {
    semaphore.wait()
    map[key] = extract
    semaphore.signal()
    }
  public  func put<T>(_ key:String, extractArray extract:Array<T>) -> Void {
        map[key] = extract
    }
  public  func put(_ key:String, extractDictionary extract:Dictionary<String, Any>) -> Void {
    semaphore.wait()
    map[key] = extract
    semaphore.signal()
    }
    
   public func put(_ key:String, extractSerializable extract:Serializable) -> Void {
    semaphore.wait()
    map[key] = extract
    semaphore.signal()
    }
    
}
extension Intent{
   public func put<T:Serializable>(_ key:String, extractSerializable extract:T) -> Void {
    semaphore.wait()
    map[key] = extract
    semaphore.signal()
    }
   public func put(_ key:String, extractIntent extract:Intent) -> Void {
    semaphore.wait()
    map[key] = extract
    semaphore.signal()
    }
}

extension Intent {
    open func dismiss(animated flag: Bool, completion: (() -> Swift.Void)? = nil){
        toVC?.dismiss(animated: animated, completion: completion)
    }
}
