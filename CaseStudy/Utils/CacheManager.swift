//
//  CacheManager.swift
//  CaseStudy
//
//  Created by Başak on 1/23/23.
//

import Foundation

class CacheManager{
    static let shared = CacheManager()
    
    let memoryCache = NSCache<AnyObject, AnyObject>()
    public var cachedKeys = [String]()
    
    func getObjectByKey(_ cacheKey: String) -> AnyObject?{
        return memoryCache.object(forKey: cacheKey as AnyObject)
    }
    
    func setObjectByKey(_ cacheKey: String, cacheObject: AnyObject){
        memoryCache.setObject(cacheObject, forKey: cacheKey as AnyObject)
        cachedKeys.append(cacheKey)
    }
    
    func removeObjectByKey(_ cacheKey: String){
        cachedKeys.remove(cacheKey)
        memoryCache.removeObject(forKey: cacheKey as AnyObject)
    }
    
    func removeAllObjects(){
        cachedKeys.removeAll()
        memoryCache.removeAllObjects()
    }
}
