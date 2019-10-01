//
//  MarvelAPI.swift
//  HeroisMarvel
//
//  Created by Luann Marques Luna on 05/07/19.
//  Copyright © 2019 Eric Brito. All rights reserved.
//

import Foundation
import Alamofire

class MarvelAPI {
    static private let basePath = "https://gateway.marvel.com:443/v1/public/characters?"
    static private let privateKey = "edffff7fd98b665fed400dfde2c187a9918213b7"
    static private let publicKey = "20f5ebe43ac313e14fac2aa6909cf4d6"
    static private let limit = 50
    
    static private let manager = Alamofire.SessionManager.default
    
    class func loadHeros(name: String?, page: Int = 0, onComplete: @escaping (MarvelInfo?) -> Void) {
        let offSet = page * limit
        let startsWith: String
        if let name = name, !name.isEmpty {
            startsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        } else {
            startsWith = ""
        }
        let url = basePath + "offset=\(offSet)&limit=\(limit)&" + startsWith + getCredentials()
        
        manager.request(url).responseJSON{ response in
            
            guard let data = response.data else {
                onComplete(nil)
                return
            }
            do {
                let marvelInfo = try JSONDecoder().decode(MarvelInfo.self, from: data)
                onComplete(marvelInfo)
            } catch {
                print("Error: \(error.localizedDescription)")
                onComplete(nil)
            }
        }
    }
    
    private class func getCredentials() -> String {
        let ts = String(describing: Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}
