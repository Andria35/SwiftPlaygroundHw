
// MARK: Task 1, Library

print("Task 1: \n\n")

class Book: Equatable {
    
    let bookID: Int
    let title: String
    let author: String
    var isBorrowed: Bool
    
    init(bookID: Int, title: String, author: String, isBorrowed: Bool = false) {
        self.bookID = bookID
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs.bookID == rhs.bookID
    }
    
    func markAsBorrowed() {
        if !isBorrowed {
            isBorrowed = true
            print("\(title) by \(author) has been marked as borrowed.")
        } else {
            print("\(title) by \(author) is already borrowed.")
        }
    }
    
    func markAsReturned() {
        if isBorrowed {
            isBorrowed = false
            print("🔙\(title) by \(author) has been marked as returned.")
        } else {
            print("\(title) by \(author) is not borrowed at this moment.")
        }
    }
    
    func printBook() {
        print("-------------------------------------------")
        print("Title: \(title)")
        print("Author: \(author)")
        print("ID: \(bookID)")
        print("book is borrowed: \(isBorrowed)")
        print("-------------------------------------------")

    }
}

class Owner: Equatable {

    let ownerID: Int
    let name: String
    var borrowedBooks: [Book]
    
    init(ownerID: Int, name: String, borrowedBooks: [Book] = []) {
        self.ownerID = ownerID
        self.name = name
        self.borrowedBooks = borrowedBooks
    }
    
    static func == (lhs: Owner, rhs: Owner) -> Bool {
        lhs.ownerID == rhs.ownerID
    }
    
    func borrowBook(_ book: Book) {
        if !book.isBorrowed {
            book.markAsBorrowed()
            borrowedBooks.append(book)
            print("\(name) has borrowed \(book.title) by \(book.author).")
        } else {
            print("\(book.title) by \(book.author) is already borrowed.")
        }
    }
    
    func returnBook(_ book: Book) {
        if borrowedBooks.contains(where: { $0 == book }) {
            book.markAsReturned()
            if let index = borrowedBooks.firstIndex(of: book) {
                borrowedBooks.remove(at: index)
            }
            print("\(name) has returned \(book.title) by \(book.author)")
        } else {
            print("\(name) cannot return \(book.title) by \(book.author) as it was not borrowed by them.")
        }
    }
    
    func printBorrowedBooksByOwner() {
        
        print("📚Books borrowed by \(name):")
        for book in borrowedBooks {
            book.printBook()
        }
    }
}

class Library {
    
    var books: [Book]
    var owners: [Owner]
    
    init(books: [Book] = [], owners: [Owner] = []) {
        self.books = books
        self.owners = owners
    }
    
    func addBook(_ book: Book) {
        if !books.contains(where: { $0 == book }) {
            books.append(book)
            print("✅📖\(book.title) by \(book.author) has been added to the library.")
        } else {
            print("\(book.title) by \(book.author) is already in library.")
        }
    }
    
    func addOwner(_ owner: Owner) {
        owners.append(owner)
        print("✅🧍‍♂️\(owner.name) has been added as an owner to the library.")
    }
    
    func availableBook() -> [Book] {
        return books.filter { !$0.isBorrowed }
    }
    
    func borrowedBook() -> [Book] {
        return books.filter { $0.isBorrowed }
    }
    
    func findOwnerByID(_ ownerID: Int) -> Owner? {
        return owners.first { $0.ownerID == ownerID }
    }
    
    func booksBorrowedByOwner(_ owner: Owner) -> [Book] {
        return borrowedBook().filter { book in
            owner.borrowedBooks.contains { $0 == book }
        }
    }
    
    func letOwnerBorrowBook(owner: Owner, book: Book) {
        if !book.isBorrowed {
            owner.borrowBook(book)
        } else {
            print("\(book.title) by \(book.author) is already borrowed.")
        }
    }
    
    func printBorrowedBooks() {
        for book in borrowedBook() {
            book.printBook()
        }
    }
    
    func printAvailableBooks() {
        for book in availableBook() {
            book.printBook()
        }
    }

}

// Simulation

let book1 = Book(bookID: 1, title: "The Catcher in the Rye", author: "Author: J. D. Salinger")
let book2 = Book(bookID: 2, title: "To Kill a Mockingbird", author: "Harper Lee")
let book3 = Book(bookID: 3, title: "Moby-Dick", author: "Herman Melville")
let book4 = Book(bookID: 4, title: "1984", author: "George Orwell")
let book5 = Book(bookID: 5, title: "Invisible Man", author: "Ralph Ellison")

let owner1 = Owner(ownerID: 1, name: "Jack")
let owner2 = Owner(ownerID: 2, name: "Emily")
let owner3 = Owner(ownerID: 3, name: "Kevin")

let library = Library()
print("\nAdding Books:\n")
// add books
library.addBook(book1)
library.addBook(book2)
library.addBook(book3)
library.addBook(book4)
library.addBook(book5)
print("\nAdding Owners:\n")
// add owners
library.addOwner(owner1)
library.addOwner(owner2)
library.addOwner(owner3)

print("\nBorrow Books:\n")
// borrow book
library.letOwnerBorrowBook(owner: owner1, book: book1)
print("")
library.letOwnerBorrowBook(owner: owner1, book: book2)
print("")
library.letOwnerBorrowBook(owner: owner2, book: book3)
print("")
library.letOwnerBorrowBook(owner: owner2, book: book4)
print("")
library.letOwnerBorrowBook(owner: owner3, book: book5)

print("\nReturn Books:\n")
// return books
owner1.returnBook(book1)
print("")
owner1.returnBook(book3)
print("")
owner2.returnBook(book3)
print("")
owner3.returnBook(book1)
print("")
print("🔴unavailable(Borrowed) Books:")
library.printBorrowedBooks()
print("🟢Available(not Borrowed) Books:")
library.printAvailableBooks()

owner1.printBorrowedBooksByOwner()

// MARK: Task 2, E-commerce
print("Task 2: \n\n")

class Product {
    let productID: Int
    let name: String
    let price: Double
    
    init(productID: Int, name: String, price: Double) {
        self.productID = productID
        self.name = name
        self.price = price
    }
}

class Cart {
    let cartID: Int
    var items: [Product]
    
    init(cartID: Int, items: [Product] = []) {
        self.cartID = cartID
        self.items = items
    }
    
    func addProduct(product: Product) {
        if !items.contains(where: { $0.productID == product.productID }) {
            items.append(product)
            print("\(product.name)(ID:\(product.productID)) has been appended in a cart")
        } else {
            print("\(product.name)(ID:\(product.productID)) already exists in a cart")
        }
    }
    
    func removeByID(productID: Int) {
        if items.contains(where: { $0.productID == productID }) {
            items.removeAll(where: { $0.productID == productID })
            print("ID:(\(productID)) has been removed from a cart")
        } else {
            print("ID:(\(productID)) cannot be located in a cart")
        }
    }
    
    func calculateTotalPrice() -> Double {
        return items.reduce(0.0) { $0 + $1.price }
    }
}

class User {
    let userID: Int
    let username: String
    var cart: Cart
    
    init(userID: Int, username: String, cart: Cart) {
        self.userID = userID
        self.username = username
        self.cart = cart
    }
    
    func addProductToCart(product: Product) {
        cart.addProduct(product: product)
    }
    
    func removeProductFromCart(product: Product) {
        cart.removeByID(productID: product.productID)
    }
    
    func checkout() -> Double {
        let totalAmount = cart.calculateTotalPrice()
        self.cart = Cart(cartID: self.cart.cartID) // Clear Cart
        return totalAmount
    }
}

// imitation

//create products

let product1 = Product(productID: 1, name: "Tea", price: 7.8)
let product2 = Product(productID: 2, name: "Coffe", price: 10.0)
let product3 = Product(productID: 3, name: "Apple", price: 3.5)

// create users
let user1Cart = Cart(cartID: 1)
let user2Cart = Cart(cartID: 2)

// The Lannisters Send Their Regards 🔪
let user1 = User(userID: 1, username: "Jamie", cart: user1Cart)
let user2 = User(userID: 2, username: "Cersei", cart: user2Cart)

// add products to users' cart
user1.addProductToCart(product: product1)
user1.addProductToCart(product: product2)
user2.addProductToCart(product: product2)
user2.addProductToCart(product: product3)
print("")

// print total price
let user1TotalPrice = user1.cart.calculateTotalPrice()
print("\(user1.username)'s Cart Total Price: $\(user1TotalPrice)")

let user2TotalPrice = user2.cart.calculateTotalPrice()
print("\(user2.username)'s Cart Total Price: $\(user2TotalPrice)")
print("Total price of both carts:\(user1TotalPrice + user2TotalPrice)")
print("")

let user1CheckoutAmount = user1.checkout()
let user2CheckoutAmount = user2.checkout()

print("\(user1.username) is checking out. Amount to be paid: $\(user1CheckoutAmount)")
print("\(user2.username) is checking out. Amount to be paid: $\(user2CheckoutAmount)")
print("")

// After checkout, the carts are cleared, so their contents will be empty
print("\(user1.username)'s Cart Contents: \(user1.cart.items)")
print("\(user2.username)'s Cart Contents: \(user2.cart.items)")

