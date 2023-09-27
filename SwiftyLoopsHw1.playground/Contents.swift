
// N1
print("N1")
let num1: Int = 10
let num2: Int = 20
print(num1 + num2)
print("-------------------------------------------------")
// N2
print("N2")
let testNum: Int = 150

if testNum > 10 && testNum <= 20 {
    print("\(testNum) is between (10, 20]")
} else if testNum > 20 && testNum <= 50 {
    print("\(testNum) is between (20, 50]")
} else if testNum > 50 && testNum <= 100 {
    print("\(testNum) is between (50, 100]")
} else if testNum > 100 {
    print("\(testNum) is more than 100")
} else {
    print("\(testNum) is less than 10")
}
print("-------------------------------------------------")
// N3
print("N3")
for num in 1..<20 {
    print(num, terminator: " ")
}
print("\n-------------------------------------------------")
// N4
print("N4")
var counter: Int = 1

print("Odd number in range 0-100:", terminator: " ")
while counter < 100 {
    if (counter % 2) == 1 {
        print(counter, terminator: " ")
    }
    counter += 1
}
print("\n-------------------------------------------------")
// N5
print("N5")
let dinosaur = "Micropachycephalosaurus"
var reversedDinosaur: String = ""

for char in dinosaur {
    reversedDinosaur = String(char) + reversedDinosaur
}
print(dinosaur + " -",reversedDinosaur)
print("-------------------------------------------------")
// N6
print("N6")
for num in 10...100 {
    let digit2 = num % 10
    let digit1 = (num - digit2) / 10
    if digit1 == digit2 {
        print(num)
    }
}
print("-------------------------------------------------")
// N7
print("N7")
let nineDigitNum = 123456789
var reversedNineDigitNum = ""

for digit in String(nineDigitNum){
    reversedNineDigitNum = String(digit) + reversedNineDigitNum
}
print(nineDigitNum,"- " + reversedNineDigitNum)
print("-------------------------------------------------")
// N8
print("N8")
var isNumberFound: Bool = false
var fiveAndNineMultiple: Int = 1
while !isNumberFound {
    if fiveAndNineMultiple % 5 == 0 && fiveAndNineMultiple % 9 == 0 {
        isNumberFound = true
    } else {
        fiveAndNineMultiple += 1
    }
}
print("\(fiveAndNineMultiple) is multiple of 5 and 9")
print("-------------------------------------------------")
// N9
print("N9")
let month: String = "July"

switch month{
case "March", "April", "May":
    print("It's Spring!")
case "June", "July", "August":
    print("It's Summer")
case "September", "Octomber", "November":
    print("It's Autumn")
case "December", "January", "February":
    print("It's Winter")
default:
    print("Input valid month")
}
print("-------------------------------------------------")
// N10
print("N10")
var light: String = "Red"

while true {
    switch light {
    case "Red":
        print("🔴", terminator: "->")
        light = "Yellow"
    case "Yellow":
        print("🟡", terminator: "->")
        light = "Green"
    default:
        print("🟢", terminator: "->")
        light = "Red"
    }
}


