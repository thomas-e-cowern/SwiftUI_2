//
//  Extensions.swift
//  AudioRecorderPlayer
//
//  Created by Thomas Cowern New on 1/16/21.
//

import Foundation

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}
