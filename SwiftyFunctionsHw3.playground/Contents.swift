import Foundation

// N1
print("N1")

func calculateFactorial(_ num: Int) -> Int {
    if num < 0 {
        return -1 // factorial is not defined
    } else if num == 0 || num == 1 {
        return 1
    } else {
        var result = 1
        for i in 2...num {
            result *= i
        }
        return result
    }
}
let numForFactorial = 5
print("Factorial of \(numForFactorial):", calculateFactorial(numForFactorial))
print("-----------------------------------------------------")

// N2
print("N2")

func generateFibonacciNumbers(count: Int) -> [Int] {
    var fibonacciNumbers = [0,1] // i assumed that fibonacci sequence starts from 0,1 and not 1,1
    
    while fibonacciNumbers.count < count {
        let nextNumber = fibonacciNumbers[fibonacciNumbers.count - 1] + fibonacciNumbers[fibonacciNumbers.count - 2]
        fibonacciNumbers.append(nextNumber)
    }
    return fibonacciNumbers
}

let twentyFibonacciNumbers = generateFibonacciNumbers(count: 20)
print("The first 20 numbers of fibonacci sequence: \(twentyFibonacciNumbers)")
print("-----------------------------------------------------")

// N3
print("N3")

func isPalindrome (_ word: String) -> Bool {
    let characters = Array(word)
    var left = 0
    var right = characters.count - 1
    
    while left < right {
        if characters[left] != characters[right] {
            return false
        }
        left += 1
        right -= 1
    }
    return true
}

let palindrome = "madam"
let secondPalindrome = "racecar"
let notPalindrome = "adam"
print(palindrome, "is palindrome:", isPalindrome(palindrome))
print(secondPalindrome, "is palindrome:", isPalindrome(secondPalindrome))
print(notPalindrome, "is palindrome:", isPalindrome(notPalindrome))
print("-----------------------------------------------------")


// N4
print("N4")

func squareArray(_ numbers: [Int]) -> [Int] {
    var squaredArray: [Int] = []
    for number in numbers {
        let squaredValue = number * number
        squaredArray.append(squaredValue)
    }
    print("regular array:",numbers, "\nsquared array:", squaredArray)
    return squaredArray
}

let numberArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let squaredArray = squareArray(numberArray)
print("-----------------------------------------------------")

// N5
print("N5")

func countWords(_ inputString: String) -> [String: Int] {
    let lowercasedString = inputString.lowercased()
    let words = lowercasedString.split(separator: " ")
    var wordFrequencies: [String : Int] = [:]
    for word in words {
        let trimmedWord = String(word).trimmingCharacters(in: [",", ".", "?", "!"])
        wordFrequencies[trimmedWord, default: 0] += 1
    }
    return wordFrequencies
}

let testString = "TBC x USAID, tbc it academy, we are in TBC academy."
let wordFrequencies = countWords(testString)
print("String for testing: \(testString)")
print("Result:", wordFrequencies)
print("-----------------------------------------------------")

// N6
print("N6")

let convertToBinary: (Int) -> String = { number in
    return String(number, radix: 2)
}

let decimalRepresentation = 3
let binaryRepresentation = convertToBinary(decimalRepresentation)
print("Decimal Representation:", decimalRepresentation, "\nBinary Representation:", binaryRepresentation)
print("-----------------------------------------------------")

// N7
print("N7")

let filterOddNumbers: ([Int]) -> [Int] = { numbers in
    return numbers.filter { $0 % 2 == 0 }
}
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
let filteredNumbers = filterOddNumbers(numbers)
print("Numbers:", numbers)
print("Filtered numbers:", filteredNumbers)
print("-----------------------------------------------------")

// N8
print("N8")

let mapNumbers: ([Int]) -> [Int] = { numbers in
    return numbers.map { $0 * 10 }
}
let myNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
let mappedMyNumbers = mapNumbers(myNumbers)
print("Numbers:", myNumbers)
print("Mapped Numbers(num*10):", mappedMyNumbers)
print("-----------------------------------------------------")

// N9
print("N9 - this task is delayed")

func delayedSum(_ numbers: [Int], completion: @escaping (Int) -> Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
        let sum = numbers.reduce(0, +)
        completion(sum)
    }
    print("N9 - numbers: \(numbers)")
}
let myArray = [1, 2, 3, 4, 5, 6]
delayedSum(myArray) { sum in
    print("N9 - Print sum after 3 secons: \(sum)")
}
print("-----------------------------------------------------")

// N10
print("N10")

func convertStringsToOddNumbers(_ words :[String]) -> [Int] {
    let numbers = words.compactMap{ Int($0) }
    let oddNumbers = numbers.filter { $0 % 2 != 0 }
    return oddNumbers
}
let stringArray = ["abc", "9", "10", "11", "13", "bdsx", "!", "fdsfsfda", "99999", "111111"]
let oddNumbers = convertStringsToOddNumbers(stringArray)
print("String array:", stringArray)
print("Odd numbers:", oddNumbers)
print("-----------------------------------------------------")

