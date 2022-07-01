//
//  JsonDecoder.swift
//  Cooknyummy
//
//  Created by traoreao on 27/06/2022.
//

import Foundation
public class ReceipeLoader {
    struct Receipe : Decodable {
        var name: String
        var description: String
        var time: Int
        var ingredients: String
        var steps: String
    }
    //@Published var ReceipeData = [Receipe]()
    func start() -> [Receipe]{
        return load()
    }
    func  load()->[Receipe] {
        if let fileLocation = Bundle.main.path(forResource: "receipes", ofType: "json") {
            // do catch in case of an error
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: fileLocation))
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Receipe].self, from: data)
                return dataFromJson
            } catch {
                
                print(error)
                return []
            }
        }
        else{
            return []
        }
        
    }
    
}
