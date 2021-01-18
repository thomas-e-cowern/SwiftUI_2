//
//  Helper.swift
//  AudioRecorderPlayer
//
//  Created by Thomas Cowern New on 1/16/21.
//

import Foundation


class Helper {
    func getCreationDate(for file: URL) -> Date {
        if let attributes = try? FileManager.default.attributesOfItem(atPath: file.path) as [FileAttributeKey: Any],
            let creationDate = attributes[FileAttributeKey.creationDate] as? Date {
            return creationDate
        } else {
            return Date()
        }
    }
}

