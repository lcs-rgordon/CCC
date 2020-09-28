//
//  main.swift
//  1998-s2-d1q2
//
//  Created by Russell Gordon on 2020-09-28.
//

import Foundation

// probabilities
let probability: [String.Element: Double] = ["A" : 0.082,
                                             "B" : 0.015,
                                             "C" : 0.028,
                                             "D" : 0.043,
                                             "E" : 0.127,
                                             "F" : 0.022,
                                             "G" : 0.020,
                                             "H" : 0.061,
                                             "I" : 0.070,
                                             "J" : 0.002,
                                             "K" : 0.008,
                                             "L" : 0.040,
                                             "M" : 0.024,
                                             "N" : 0.067,
                                             "O" : 0.075,
                                             "P" : 0.019,
                                             "Q" : 0.001,
                                             "R" : 0.060,
                                             "S" : 0.063,
                                             "T" : 0.091,
                                             "U" : 0.028,
                                             "V" : 0.010,
                                             "W" : 0.023,
                                             "X" : 0.001,
                                             "Y" : 0.020,
                                             "Z" : 0.001]

// shift a value based on k
func shift(letter: String.Element, by: Int) -> String {
    
    var shift = Int(letter.asciiValue!) + by
    if shift > 90 {
        //        print("original shift is \(shift)")
        shift -= 64
        //        print("after downwards shift is \(shift)")
        shift %= 26
        //        print("after division is \(shift)")
        shift += 64
        //        print("after upward shift is \(shift)")
    }
    return String(UnicodeScalar(shift)!)
}


// get number of lines to decipher
let lines = Int(readLine()!)!

// empty array of translated phrases
var bestGuesses: [String] = []

// get ciphertext phrases
for _ in 1...lines {
    
    // get phrase
    let cipherText = readLine()!
    
    // initialize highest score
    var highestScore = 0.0
    var probablePlaintext = ""
    
    // check a possible plaintext
    for k in 1...25 {
        
        // build plaintext
//        print("k is \(k)")
        var plaintext = ""
        var score = 0.0
        for letter in cipherText {
            if letter != " " {
                plaintext.append(shift(letter: letter, by: k))
                score += probability[plaintext.last!]!
            } else {
                plaintext.append(" ")
            }
        }
        
        // check for new highest
        if score > highestScore {
            highestScore = score
            probablePlaintext = plaintext
        }
//        print(plaintext)
//        print(score)
        
    }
//    print("===")
    
    // Save best guess
    bestGuesses.append(probablePlaintext)
    
}

// now print best guesses
for guess in bestGuesses {
    print(guess)
}
