//
//  Solutionsswift
//  Hangman
//
//  Created by Adam Roberts on 3/10/22
//

import Foundation
class Solutions{
    
    static let usPresidents : [String] = ["George Washington", "John Adams", "Thomas Jefferson", "James Madison", "James Monroe", "John Quincy Adams", "Andrew Jackson", "Martin Van Buren", "William Henry Harrison", "John Tyler", "James K Polk", "Zachary Taylor", "Millard Fillmore", "Franklin Pierce", "James Buchanan", "Abraham Lincoln", "Andrew Johnson", "Ulysses S Grant", "Rutherford B Hayes", "James A Garfield", "Chester A Arthur", "Grover Cleveland", "Benjamin Harrison", "Grover Cleveland", "William McKinley", "Theodore Roosevelt", "William Howard Taft", "Woodrow Wilson", "Warren G Harding", "Calvin Coolidge", "Herbert Hoover", "Franklin D Roosevelt", "Harry S Truman", "Dwight D Eisenhower", "John F Kennedy", "Lyndon B Johnson", "Richard M Nixon", "Gerald R Ford", "Jimmy Carter", "Ronald Reagan", "George HW Bush", "Bill Clinton", "George W Bush", "Barack Obama", "Donald Trump", "Joe Biden"]
    
    static let composers : [String] = ["Ludwig van Beethoven" ,"Wolfgang Amadeus Mozart" ,"Johann Sebastian Bach" ,"Richard Wagner" ,"Joseph Haydn" ,"Johannes Brahms" ,"Franz Schubert" ,"Peter Ilyich Tchaikovsky" ,"George Frideric Handel" ,"Igor Stravinsky" ,"Robert Schumann" ,"Frederic Chopin" ,"Felix Mendelssohn" ,"Claude Debussy" ,"Franz Liszt" ,"Antonín Dvorak" ,"Giuseppe Verdi" ,"Gustav Mahler" ,"Antonio Vivaldi" ,"Richard Strauss" ,"Serge Prokofiev" ,"Dmitri Shostakovich" ,"Béla Bartók" ,"Hector Berlioz" ,"Anton Bruckner"]
    
    static let rockBands : [String] = ["ZZ Top", "Ramones", "Journey", "Cream", "Pearl Jam", "Metallica", "The Rolling Stones", "Black Sabbath", "The Beatles", "Pink Floyd", "Led Zeppelin", "Aerosmith", "Van Halen", "Def Leppard", "The Who", "Guns N Roses", "Nirvana", "Genesis", "Foo Fighters", "Chicago", "Creedence Clearwater Revival", "The Doors", "Lynyrd Skynyrd", "Fleetwood Mac", "Modest Mouse", "Linkin Park", "Red Hot Chili Peppers", "Radiohead", "Green Day", "My Chemical Romance", "Imagine Dragons", "The White Stripes", "Arcade Fire", "Of Monsters and Men", "Cage The Elephant", "Stone Temple Pilots", "Kings of Leon", "Fall Out Boy", "Rage Against The Machine", "Barenaked Ladies", "Smashing Pumpkins", "Collective Soul", "Bon Jovi", "David Bowie", "Bob Dylan", "Bruce Springsteen", "Jimi Hendrix"]
    
    static let usCities : [String] = ["New York City NY", "Los Angeles CA", "Chicago IL", "Houston TX", "Phoenix AZ", "San Antonio TX", "Philadelphia PA", "San Diego CA", "Dallas TX", "Austin TX", "San Jose CA", "Fort Worth TX", "Jacksonville FL", "Charlotte NC", "Columbus OH", "Indianapolis IN", "San Francisco CA", "Seattle WA", "Denver CO", "Washington DC", "Boston MA", "El Paso TX", "Nashville TN", "Oklahoma City OK", "Las Vegas NV", "Portland OR", "Detroit MI", "Memphis TN", "Louisville KY", "Milwaukee WI", "Baltimore MD", "Albuquerque NM", "Tucson AZ", "Mesa AZ", "Fresno CA", "Atlanta GA", "Sacramento CA", "Kansas City MO", "Colorado Springs CO", "Raleigh NC", "Miami FL", "Omaha NE", "Long Beach CA", "Virginia Beach VA", "Oakland CA", "Minneapolis MN", "Tampa FL", "Tulsa OK", "Arlington TX", "Boonton NJ"]
    
    
    class func select(_ myString: String) ->[String]{
        print("made selection with \(SELECTION)")
        switch myString{
        case "usPresidents":
            let mySelection = usPresidents[Int.random(in: 0..<usPresidents.count)].uppercased()
            return mySelection.components(separatedBy: " ")
        case "composers":
            let mySelection = composers[Int.random(in: 0..<composers.count)].uppercased()
            return mySelection.components(separatedBy: " ")
        case "rockBands":
            let mySelection = rockBands[Int.random(in: 0..<rockBands.count)].uppercased()
            return mySelection.components(separatedBy: " ")
        case "usCities":
            let mySelection = usCities[Int.random(in: 0..<usCities.count)].uppercased()
            return mySelection.components(separatedBy: " ")
        default:
            print("never gonna happen")
            return []
        }
        
    }

}
