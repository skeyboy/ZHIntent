//
//  Serializable.swift
//  ZHIntent
//
//  Created by le on 2018/2/6.
//  Copyright © 2018年 le. All rights reserved.
//

import Foundation
public protocol Serializable {
    
}

extension String:Serializable{}

extension Dictionary:Serializable{}

extension Array:Serializable{}

extension Float: Serializable{}

extension Double:Serializable{}


extension UInt:Serializable{}
extension UInt8:Serializable{}
extension UInt16:Serializable{}
extension UInt32:Serializable{}
extension UInt64:Serializable{}

extension Int8: Serializable{}
extension Int: Serializable{}
extension Int16: Serializable{}
extension Int32:Serializable{}
extension Int64:Serializable{}

