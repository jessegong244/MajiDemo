//
//  RealmTool.swift
//  MajiDemo
//
//  Created by 龚伟强 on 2021/2/25.
//

import Foundation
import RealmSwift

class RealmManager: NSObject {
    static func configureRealm(){
        let config = Realm.Configuration(
             schemaVersion: 0,
             migrationBlock: { migration, oldSchemaVersion in
                     if (oldSchemaVersion < 0) {}
             })
        Realm.Configuration.defaultConfiguration = config
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let Dir = paths[0]
        
        print("url = ",Dir)
    }
    
    static let realm = try! Realm()
    
    static func addModel <T> (model: T){
        do {
            try realm.write {
                realm.add(model as! Object)
            }
        } catch {}
    }
    
    static func queryModel <T> (model: T, filter: String? = nil) -> [T]{
            
        var results : Results<Object>
        
        if filter != nil {
            
            results =  realm.objects((T.self as! Object.Type).self).filter(filter!)
        }
        else {
            
            results = realm.objects((T.self as! Object.Type).self)
        }
        
        guard results.count > 0 else { return [] }
        var modelArray = [T]()
        for model in results{
            modelArray.append(model as! T)
        }
        
        return modelArray
    }
}
