//
//  Extensions.swift
//  To do list
//
//  Created by Hisano Sato on 24/6/2024.
//

import Foundation

//Extension: add new functionality to an existing class, structure, enumeration, or protocol type
extension Encodable{
    func asDictionary()->[String:Any]{
        //try?: This attempts the encoding and returns nil if it fails, rather than throwing an error.
        //guard let data = try? ... else { return [:] }: If encoding fails (i.e., data is nil), the method returns an empty dictionary ([:]).
        guard let data = try? JSONEncoder().encode(self) else{
            return [:]
        }
        //JSONSerialization.jsonObject(with: data): This line attempts to convert the JSON data into a JSON object
        //as? [String: Any]: This casts the JSON object to a dictionary with keys of type String and values of type Any. If the cast fails, json will be nil
        //return json ?? [:]: If json is not nil, it returns the dictionary. Otherwise, it returns an empty dictionary
        do{
            let json = try JSONSerialization.jsonObject(with: data) as? [String:Any]
            return json ?? [:]
            
        }catch {
            return [:]
        }
    }
}
