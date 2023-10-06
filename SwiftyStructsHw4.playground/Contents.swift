
// N1
print("N1")

enum DayOfWeek {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

func checkDayType(day: DayOfWeek) {
    switch day {
    case .monday, .tuesday, .wednesday, .thursday, .friday:
        print("\(day) is weekday")
    case .saturday, .sunday:
        print("\(day) is weekend ")
    }
}

let today = DayOfWeek.friday
let tommorow = DayOfWeek.saturday
checkDayType(day: today)
checkDayType(day: tommorow)

print("------------------------------------------------")

// N2
print("N2")

enum Weather {
    case sunny(temperature: Double)
    case cloudy(temperature: Double)
    case rainy(temperature: Double)
    case snowy(temperature: Double)
}

func howToWear(weather: Weather) {
    switch weather {
    case .sunny(let temperature):
        if temperature >= 20 {
            print("It's Sunny and hot \(temperature)°C, wear light clothing")
        } else {
            print("It's Sunny and chilly \(temperature)°C, wear light clothing but also keep jacket on you")
        }
    case .cloudy(let temperature):
        print("It's cloudy \(temperature)°C, wear jacket ")
    case .rainy(let temperature):
        print("It's rainiy \(temperature)°C, wear raincoat")
    case .snowy(let temperature):
        if temperature <= 0 {
            print("It's snowy and freezing \(temperature)°C, wear very warm clothing, like gloves, coat and scarf ")
        } else {
            print("It's snowy but not freezing \(temperature)°C, wear warm clothing")
        }
    }
}

let mondayWeather = Weather.sunny(temperature: 30)
let tuesdayWeather = Weather.sunny(temperature: 17)
let wednesdayWeather = Weather.cloudy(temperature: 15)
let thursdayWeather  = Weather.rainy(temperature: 16)
let fridayWeather = Weather.snowy(temperature: 5)
let saturdayWeather = Weather.snowy(temperature: -2)

howToWear(weather: mondayWeather)
howToWear(weather: tuesdayWeather)
howToWear(weather: wednesdayWeather)
howToWear(weather: thursdayWeather)
howToWear(weather: fridayWeather)
howToWear(weather: saturdayWeather)

print("------------------------------------------------")

// N3
print("N3")

struct Book {
    let title: String
    let author: String
    let publicationYear: Int
    
    func printBook() {
        print("\(title), by \(author), in \(publicationYear)")
    }
}

func booksReleasedAfter(year: Int, from books: [Book]) -> [Book] {
    return books.filter { $0.publicationYear > year }
}

let books: [Book] = [
    Book(title: "Don Quixote", author: "Miguel de Cervantes", publicationYear: 1605),
    Book(title: "Divine Comedy", author: "Dante Alighieri", publicationYear: 1321),
    Book(title: "The Master and Margarita", author: "Mikhail Bulgakov", publicationYear: 1967),
    Book(title: "Harry Potter and the Half-Blood Prince", author: "J.K.Rowling", publicationYear: 2005),
    Book(title: "A Dance with Dragons", author: "George R. R. Martin", publicationYear: 2011)
]

let yearToFilter = 1900
let filteredBooksByYear = booksReleasedAfter(year: yearToFilter, from: books)

print("Books released after \(yearToFilter): ")
for book in filteredBooksByYear {
    book.printBook()
}

print("------------------------------------------------")

// N4
print("N4")

struct BankAccount {
    var holderName: String
    var accountNumber: String
    var balance: Double
    
    // Add money to balance
    mutating func deposit(amount: Double) {
        // if amount < 0, stop method and print error
        guard amount > 0 else {
            print("Invalid deposit amount, please input amount > 0")
            return
        }
        
        balance += amount
        print("Deposited $\(amount) into account(\(accountNumber)). New balance: $\(balance)")
    }
    
    // Withdraw money from balance
    mutating func withdraw(amount: Double) {
        guard amount > 0 else {
            print("Invalid withdrawal amount, please input amount > 0")
            return
        }
        
        if amount <= balance {
            balance -= amount
            print("Withdrawn $\(amount) from account(\(accountNumber)). New balance: $\(balance)")
        } else {
            print("Error: Cannot withdraw $\(amount), current balance is $\(balance)")
        }
    }
    
    // Additional method just for fun
    mutating func transaction(amount: Double, to otherAccount: inout BankAccount) {
        guard amount > 0 && amount <= self.balance else {
            print("Invalid amount for transaction($\(amount)), your balance is $\(self.balance)")
            return
        }
        self.balance -= amount
        otherAccount.balance += amount
        print("Transaction was succesful! ($\(amount))")
        print("\(otherAccount.holderName)s' current balance: $\(otherAccount.balance)")
        print("\(holderName)s' current balance: $\(balance)")
    }
    
    func printInformation() {
        print("name: \(holderName), account number: \(accountNumber), balance: $\(balance)")
    }
}

var bezosAccount = BankAccount(holderName: "Jeff Bezos", accountNumber: "123456789", balance: 1500)
var muskAccount = BankAccount(holderName: "Elon Musk", accountNumber: "987654321", balance: 2500)
var myAccount = BankAccount(holderName: "Andria", accountNumber: "125436233", balance: 5.0) // 😞

myAccount.printInformation()
myAccount.deposit(amount: 50)
myAccount.withdraw(amount: 54)
myAccount.withdraw(amount: 5000)
myAccount.deposit(amount: -500)
myAccount.withdraw(amount: -5)
print("")
bezosAccount.printInformation()
muskAccount.printInformation()
muskAccount.transaction(amount: 700, to: &bezosAccount)

print("------------------------------------------------")

// N5
print("N5")

enum Genre {
    case rock
    case blues
    case jazz
    case hipHop
    case pop
    case electronic
}

struct Song {
    var title: String
    var artist: String
    var duration: Double
    var genre: Genre
    lazy var publisher: String? = nil // some songs have publisher and some dont so variable is optional
    var description: String {
        return "\(title), by \(artist) (\(duration) seconds), \(genre) genre"
    }
}

func filterSongsByGenre(from playlist: [Song], by genre: Genre) -> [Song]{
    return playlist.filter { $0.genre == genre }
}


let playlist: [Song] = [
    Song(
        title: "Shine On You Crazy Diamond",
        artist: "Pink Floyd",
        duration: 1557,
        genre: .rock,
        publisher: "Pink Floyd Music Publishers Ltd"),
    Song(
        title: "Touch",
        artist: "Daft Punk",
        duration: 508,
        genre: .electronic),
    Song(
        title: "Layla",
        artist: "Eric Clapton",
        duration: 728,
        genre: .rock),
    Song(
        title: "You Want It Darker",
        artist: "Leonard Cohen",
        duration: 286,
        genre: .blues,
    publisher: "Columbia Records"),
    Song(
        title: "The Girl In The Yellow Dress",
        artist: "David Gilmour",
        duration: 385,
        genre: .blues)
]

print("Rock Songs:")
let rockSongs = filterSongsByGenre(from: playlist, by: .rock)
for var song in rockSongs {
    if let publisher = song.publisher {
        print("\(song.description), published by \(publisher)")
    } else {
        print(song.description)
    }
}
print("blues Songs:")
let bluesSongs = filterSongsByGenre(from: playlist, by: .blues)
for var song in bluesSongs {
    if let publisher = song.publisher {
        print("\(song.description), published by \(publisher)")
    } else {
        print(song.description)
    }
}
print("Electronic Songs:")
let electronicSongs = filterSongsByGenre(from: playlist, by: .electronic)
for var song in electronicSongs {
    if let publisher = song.publisher {
        print("\(song.description), published by \(publisher)")
    } else {
        print(song.description)
    }
}

print("------------------------------------------------")
