//
//  NSManagedObject+Provider.swift
//  CandidatIPad
//
//  Created by Renaud BUISINE on 12/05/17.
//  Copyright © 2017 ALTRAN. All rights reserved.
//

import UIKit
import CoreData

// PROVIDER
public extension NSManagedObject {
    
    public static func entityName() -> String {
        return String(describing: self)
    }
}


// MARK: CREATE
public extension NSManagedObject{
    public static func newObjectInstance() -> NSManagedObject? {
        return MFCoreDataManager.shared.newObjectInstanceFor(entity: self.entityName())
    }
    
    
}

// MARK: REQUEST
public extension NSManagedObject{
    // MARK: - used to retrieve all objects
    public static func allObjects() -> [AnyObject]? {
        return MFCoreDataManager.shared.allObjectsFor(entity: self.entityName())
    }
    
    // MARK: - used to retrieve an object with a predicate
    public static func objectWith(predicate:NSPredicate?) -> AnyObject? {
        return self.objectsWith(predicate: predicate)?.first
    }
    
    public static func objectsWith(predicate:NSPredicate?) -> [AnyObject]? {
        return MFCoreDataManager.shared.objectsWith(entity: self.entityName(), andPredicate: predicate)
    }
}

//MARK: REMOVE
public extension NSManagedObject{
    // MARK: - used to remove objects, returns count of removed elements
    public static func removeAllObjects() -> Int {
        return MFCoreDataManager.shared.removeAllObjectsWith(entity: self.entityName())
    }
    
    public static func removeObjectsWith(predicate:NSPredicate?) -> Int {
        return MFCoreDataManager.shared.removeObjectsWith(entity: self.entityName(), andPredicate: predicate)
    }
}
