//
//  StringExtension.swift
//  Hangman
//
//  Created by Adam Roberts on 3/7/22.
//

import Foundation
extension String {
 
    func index(at position: Int, from start: Index? = nil) -> Index? {
        let startingIndex = start ?? startIndex
        return index(startingIndex, offsetBy: position, limitedBy: endIndex)
    }
 
    func character(at position: Int) -> Character? {
        guard position >= 0, let indexPosition = index(at: position) else {
            return nil
        }
        return self[indexPosition]
    }
    func locations(_ letter: Character) -> [Int]{
        var myLocs : [Int] = []
        for (index, char) in self.enumerated(){
            if(char == letter){
                myLocs.append(index)
            }
        }
        return myLocs
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
