//
//  Solutionsswift
//  Hangman
//
//  Created by Adam Roberts on 3/10/22
//

import Foundation
class Solutions{
    
    static let usPresidents : [String] = ["George Washington", "John Adams", "Thomas Jefferson", "James Madison", "James Monroe", "John Quincy Adams", "Andrew Jackson", "Martin Van Buren", "William Henry Harrison", "John Tyler", "James K Polk", "Zachary Taylor", "Millard Fillmore", "Franklin Pierce", "James Buchanan", "Abraham Lincoln", "Andrew Johnson", "Ulysses S Grant", "Rutherford B Hayes", "James A Garfield", "Chester A Arthur", "Grover Cleveland", "Benjamin Harrison", "Grover Cleveland", "William McKinley", "Theodore Roosevelt", "William Howard Taft", "Woodrow Wilson", "Warren G Harding", "Calvin Coolidge", "Herbert Hoover", "Franklin D Roosevelt", "Harry S Truman", "Dwight D Eisenhower", "John F Kennedy", "Lyndon B Johnson", "Richard M Nixon", "Gerald R Ford", "Jimmy Carter", "Ronald Reagan", "George HW Bush", "Bill Clinton", "George W Bush", "Barack Obama", "Donald Trump", "Joe Biden"]
    
    class func select(_ myArray: String) ->[String]{
        switch myArray{
        case "usPresidents":
            let mySelection = usPresidents[Int.random(in: 1..<myArray.count)].uppercased()
            return mySelection.components(separatedBy: " ")
        default:
            print("never gonna happen")
            return []
        }
        
    }

}
