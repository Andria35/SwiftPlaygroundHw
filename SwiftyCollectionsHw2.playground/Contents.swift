// N1
print("N1")

var myArray1 = [1,2,3,4,5]
print(myArray1)

if myArray1.count >= 2 {
    let tempValue = myArray1[0]
    myArray1[0] = myArray1[myArray1.count - 1]
    myArray1[myArray1.count - 1] = tempValue
}
print(myArray1)

print("-------------------------------------------")

// N2
print("N2")

var myArray2 = [1,2,3,4,5,6,7,8,9,10,11]
print(myArray2)
var amountToDelete: Int = 0
if myArray2.count % 2 == 0 {
    amountToDelete = myArray2.count / 2
} else {
    amountToDelete = ((myArray2.count - 1) / 2) + 1
}
for _ in 0..<amountToDelete {
    myArray2.remove(at: 0)
}
print(myArray2)

print("-------------------------------------------")

// N3
print("N3")

let myArray3: [Int] = [0,1,2,3,4,5,6,7,8,9,10]
var oddArray: [Int] = []
var evenArray: [Int] = []

for num in myArray3 {
    if num % 2 == 0 {
        evenArray.append(num)
    } else {
        oddArray.append(num)
    }
}
print(myArray3)
print("evenArray: \(evenArray)")
print("oddArray: \(oddArray)")

print("-------------------------------------------")

// N4
print("N4")

let myArray4: [Double] = [3.0, 3.14, 1.5, 10.9, 77.8, 89.9, 105.8]
var maxElement: Double = 0
for num in myArray4 {
    if num >= maxElement {
        maxElement = num
    }
}

print(myArray4)
print("maxElement: \(maxElement)")

print("-------------------------------------------")

// 5
print("N5")

let myArray5 = [8,4,9,9,0,2]
let mySecondArray5 = [1,0,9,2,3,7,0,1]
var sortedArray = myArray5 + mySecondArray5
// Bubble sort
for _ in 0..<sortedArray.count - 1 {
    for j in 0..<sortedArray.count - 1 {
        if sortedArray[j] > sortedArray[j+1] {
            let tmp = sortedArray[j]
            sortedArray[j] = sortedArray[j+1]
            sortedArray[j+1] = tmp
        }
    }
}
print("sortedArray: \(sortedArray)")

/*
 ეს ჩემი შემოქმედება 🦖
 not efficient but it still works.....
 ----------------------------------------
//var sortedArray: [Int] = []
//
//firstLoop: for num in myArray5 + mySecondArray5 {
//    
//    if sortedArray.isEmpty {
//        sortedArray.append(num)
//        continue firstLoop
//    }
//    for (index,element) in sortedArray.enumerated() {
//        
//        if num < element {
//            sortedArray.insert(num, at: index)
//            continue firstLoop
//        } else if num >= sortedArray[sortedArray.count - 1] {
//            sortedArray.append(num)
//            continue firstLoop
//        }
//    }
//}
//print(sortedArray)

 */

print("-------------------------------------------")

// N6
print("N6")

let stringGreeting = "Hello world"
let setGreeting = Set(stringGreeting)
print("stringGreeting = \(stringGreeting)")
      
if stringGreeting.count == setGreeting.count {
    print("All characters in stringGreeting are unique")
} else {
    print("stringGreeting contains duplicate characters")
}

print("-------------------------------------------")

// N7
print("N7")

let set7: Set<Int> = [1,2,3,4,5]
let secondSet7: Set<Int> = [3,4,5,6,7,8]

// union
let unionSet = set7.union(secondSet7)
// Intersection
let intersectionSet = set7.intersection(secondSet7)
// Difference
let differenceSet = set7.subtracting(secondSet7)
let secondDifferenceSet = secondSet7.subtracting(set7)

print(set7)
print(secondSet7)
print("unionSet: \(unionSet)")
print("intersectionSet: \(intersectionSet)")
print("differenceSet: \(differenceSet)")
print("secondDifferenceSet: \(secondDifferenceSet)")

print("-------------------------------------------")

// N8
print("N8")

let animalFarm1: Set<String> = ["Cow", "Chicken", "Sheep", "Dinosaur"] // 🦖 🐓 🦕 🐄 🐑
let animalFarm2: Set<String> = ["Cow", "Chicken", "Sheep", "Dinosaur","Dragon", "Donkey"] // 🦖 🐓 🦕 🐄 🐑 + 🐉 🫏

let isSubset: Bool = animalFarm1.isSubset(of: animalFarm2)

print("animalFarm1:\(animalFarm1)")
print("animalFarm2:\(animalFarm2)")

if isSubset {
    print("animalFarm1 is subset of animalFarm2")
} else {
    print("animalFarm1 is not a subset of animalFarm2")
}

print("-------------------------------------------")

// N9
print("N9")

let myArray9 = [1,2,3,4,5,1,2,3]
let mySet9 = Set(myArray9)

print(myArray9)

if myArray9.count == mySet9.count {
    print("All the elemnts in array are distinct")
} else {
    print("Array contains similar elements")
}

print("-------------------------------------------")

// N10
print("N10")

let movieRatings: [String: Double] = [
    "The Dark Knight" : 9.0,
    "The Lord of the Rings: The Return of the King" : 9.0,
    "Goodfellas" : 8.7,
    "Spider-Man: Across the Spider-Verse" : 8.7,
    "The Silence of the Lambs" : 8.6,
    "Django Unchained" : 8.5
]
var totalRating: Double = 0
let numberOfMovies = Double(movieRatings.count)

for movieRating in movieRatings.values {
    totalRating += movieRating
}

let averageRating = totalRating / numberOfMovies
print("averageRating: \(averageRating)")

print("-------------------------------------------")
