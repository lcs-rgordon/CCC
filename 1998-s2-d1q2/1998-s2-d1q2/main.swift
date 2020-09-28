//
//  main.swift
//  1998-s2-d1q2
//
//  Created by Russell Gordon on 2020-09-28.
//

import Foundation

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

// get ciphertext phrases
for _ in 1...lines {
    
    // get phrase
    let cipherText = readLine()!
    
    // check a possible plaintext
    for k in 1...26 {
        
        // build plaintext
        var plaintext = ""
        for letter in cipherText {
            plaintext.append(shift(letter: letter, by: k))
        }
        print(plaintext)
    }
    print("===")
    
}


//
//if let scalar = UnicodeScalar(i) {
//
//    // If we got here, inside the "if let" statement, the Unicode scalar was successfully created
//    let newLetter = String(scalar) // Convert the scalar into a single letter
//    print("About to add this letter to the string: \(newLetter)")
//    builtStringFromLoop += newLetter // Now add the letter to the built string
//
//}
