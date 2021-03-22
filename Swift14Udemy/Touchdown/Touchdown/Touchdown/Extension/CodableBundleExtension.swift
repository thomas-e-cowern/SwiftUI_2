//
//  CodableBundleExtension.swift
//  Touchdown
//
//  Created by Thomas Cowern New on 3/22/21.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        
        // Step 1 : locate the JSON file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle.")
        }
        
        // Step 2 : Create a property for the data
        guard let data = try? Data(contentsOf: url) else { fatalError("failed to laod \(file) from bundle.") }
        
        // Step 3 : Create a decoder
        let decoder = JSONDecoder()
        
        // Step 4 : Create a property for the decoded data
        guard let decodedData = try? decoder.decode(T.self, from: data) else { fatalError("failed to decode \(file) from bundle.") }
        
        // Step 5 : Return the decoded data
        return decodedData
        
    }
}
