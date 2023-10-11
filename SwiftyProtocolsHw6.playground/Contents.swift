import Foundation

class SuperEnemy {
    let name: String
    var hitPoint: Int
    
    init(name: String, hitPoint: Int) {
        self.name = name
        self.hitPoint = hitPoint
    }
}

protocol Superhero {
    
    var name: String { get }
    var alias: String { get }
    var isEvil: Bool { get }
    var superPowers: [String:Int] { get }
    
    // Returns targets' HP left after attack
    func attack(target: SuperEnemy) -> Int
    mutating func performSuperPower(target: SuperEnemy) -> Int
}

extension Superhero {
    func printSuperheroInfo() {
        print("🚀")
         print("Superhero Name: \(name)")
         print("Superhero Alias: \(alias)")
         print("Is Evil: \(isEvil ? "Yes" : "No")")
         print("Superpowers:")
         for (power, damage) in superPowers {
             print("- \(power): Damage \(damage)")
         }
     }
}

struct Spiderman: Superhero{
    let id = UUID()
    var name: String
    
    var alias: String
    
    var isEvil: Bool
    
    var superPowers: [String : Int]
    
    func attack(target: SuperEnemy) -> Int {
        let attackDamage = Int.random(in: 20..<40)
        target.hitPoint -= attackDamage
        if target.hitPoint < 0 {
            target.hitPoint = 0
        }
        print("\(self.name) final Blow(with knuckles👊): \(attackDamage) damage")
        return target.hitPoint
    }
    
    mutating func performSuperPower(target: SuperEnemy) -> Int {
        // pick random superpower
        guard let randomSuperPower = superPowers.keys.randomElement(),
              let attackDamage = superPowers[randomSuperPower] else {
            print("No superpowers left")
            return target.hitPoint
        }
        // deal dmg
        print("\(self.name) used \(randomSuperPower): \(attackDamage) damage")
        target.hitPoint -= attackDamage
//        if target.hitPoint < 0 {
//            target.hitPoint = 0
//        }
        // remove superpower
        superPowers.removeValue(forKey: randomSuperPower)
        return target.hitPoint
    }
    
}
extension Spiderman: Equatable {
    static func == (lhs: Spiderman, rhs: Spiderman) -> Bool {
        lhs.id == rhs.id
    }
}

class SuperheroSquad {
    let superheroes: [Superhero]
    
    init(superheroes: [Superhero]) {
        self.superheroes = superheroes
    }
    func printSuperheroes() {
        for superhero in superheroes {
            superhero.printSuperheroInfo()
        }
    }
}

func simulateShowdown(superheroSquad: SuperheroSquad, superEnemy: SuperEnemy) {
    var remainingSuperheroes = superheroSquad.superheroes
    
    while !remainingSuperheroes.isEmpty && superEnemy.hitPoint > 0 {
        for var superhero in remainingSuperheroes {
            // this method makes console unreadable so its commented
//            superhero.printSuperheroInfo()
            if superhero.superPowers.isEmpty {
                superhero.attack(target: superEnemy)
                // i know that force unwrapping is bad practice but since am only going to use spiderman struct i decided
                // to leave it like that, plus am too tired to change this 😂
                if let index = remainingSuperheroes.firstIndex(where: { $0 as! Spiderman == superhero as! Spiderman }) {
                    remainingSuperheroes.remove(at: index)
                }
            } else {
                superhero.performSuperPower(target: superEnemy)
            }
            // Update remainingSuperheroes array! I struggled bcs of this 2 line for 3 hours 😞
            if let index = remainingSuperheroes.firstIndex(where: { $0 as! Spiderman == superhero as! Spiderman }) {
                remainingSuperheroes[index] = superhero
            }
        }
        if superEnemy.hitPoint <= 0 {
            print("\nCongratulations! The superheroes have defeated \(superEnemy.name).")
        } else if remainingSuperheroes.isEmpty {
            print("\nThe superheroes have run out of superpowers. \(superEnemy.name) wins. \(superEnemy.hitPoint) HP left.")
        }

    }
}


// Battle
let peterParker = Spiderman(name: "Peter Parker",
                            alias: "Spider-Man",
                            isEvil: false,
                            superPowers: ["Web Shoot": 10, "Spider-Sense": 5])
let milesMorales = Spiderman(name: "Miles Morales",
                             alias: "Spider-Man",
                             isEvil: false,
                             superPowers: ["Bio-electric energy threads produced from fingers": 5, "Web Shoot": 20, "Invisibility": 5])
let spiderGwen = Spiderman(name: "Gwen Steffany",
                           alias: "Spider-Woman",
                           isEvil: false,
                           superPowers: ["Web Shoot": 5, "Speed": 10])

let superheroSquad = SuperheroSquad(superheroes: [peterParker, milesMorales, spiderGwen])
print("Superheroes(🦸 🦸‍♀️):")
superheroSquad.printSuperheroes()

print("🔴Battle 1:")
let superEnemy1 = SuperEnemy(name: "Green Goblin", hitPoint: 12)
simulateShowdown(superheroSquad: superheroSquad, superEnemy: superEnemy1)

print("🔴Battle 2:")
let superEnemy2 = SuperEnemy(name: "Venom", hitPoint: 500)
simulateShowdown(superheroSquad: superheroSquad, superEnemy: superEnemy2)



