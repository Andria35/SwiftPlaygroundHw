
protocol Cannons {
    
    var cannonsCount: Int {get set}
    func cannonCount() -> Int
    func fireCannons(_ count: Int)
}

protocol CargoManaging {
    
    var cargo: Set<String> {get set}
    
    func addCargo(_ items: [String])
    func removeCargo(_ items: [String])
    func listCargo() -> [String]
}

protocol CrewManaging {
    
    var crew: Set<String> {get set}
    
    func addCrew(_ crewMembers: [String])
    func removeCrew(_ crewMembers: [String])
    func listCrew() -> [String]
}

class PirateShip: Cannons {
    
    private let name: String
    private let crewManager: CrewManaging
    private let cargoManager: CargoManaging
    var cannonsCount: Int
    
    init(name: String, cannonsCount: Int, crewManager: CrewManaging = CrewManager(), cargoManager: CargoManaging = CargoManager()) {
        self.name = name
        self.cannonsCount = cannonsCount
        // every object can have different crew and cargo managment system implemented
        self.crewManager = crewManager
        self.cargoManager = cargoManager
    }
    
    func getName() -> String {
        name
    }
    
    func cannonCount() -> Int {
        cannonsCount
    }
    
    func fireCannons(_ count: Int) {
        if cannonsCount - count > 0 {
            cannonsCount -= count
            print("Firing \(count) Cannon")
        } else {
            print("Not enough Cannon to fire")
        }
    }
    
    func addCrew(crewMembers: [String]) {
        crewManager.addCrew(crewMembers)
    }
    
    func removeCrew(crewMembers: [String]) {
        crewManager.removeCrew(crewMembers)
    }
    
    func listCrew() {
        let crewMembers = crewManager.listCrew()
        print("⚔️🔫 Crew Members:")
        for member in crewMembers {
            print(member)
        }
    }
    
    func addCargo(items: [String]) {
        cargoManager.addCargo(items)
    }
    
    func removeCargo(items: [String]) {
        cargoManager.removeCargo(items)
    }
    
    func listCargo() {
        let items = cargoManager.cargo
        print("📦 Cargo:")
        for item in items {
            print(item)
        }
    }
}

class CrewManager: CrewManaging {
    
    var crew: Set<String> = []

    func addCrew(_ crewMembers: [String]) {
        crew.formUnion(crewMembers)
    }

    func removeCrew(_ crewMembers: [String]) {
        crew.subtract(crewMembers)
    }
    
    func listCrew() -> [String] {
        Array(crew)
    }
}

class CargoManager: CargoManaging {
    
    var cargo: Set<String> = []

    func addCargo(_ items: [String]) {
        cargo.formUnion(items)
    }

    func removeCargo(_ items: [String]) {
        cargo.subtract(items)
    }
    
    func listCargo() -> [String] {
        Array(cargo)
    }
}

class Frigate: PirateShip {
    
    private var atomicBombCount: Int
    
    init(atomicBombCount: Int, name: String, cannonsCount: Int) {
        self.atomicBombCount = atomicBombCount
        super.init(name: name, cannonsCount: cannonsCount)
    }
    
    func useAtomicBomb() {
        if atomicBombCount > 0 {
            atomicBombCount -= 1
            print("💣 Atomic bomb launched")
        } else {
            print("Not enough atomic bombs!")
        }
    }
}

class Galleon: PirateShip {
    
    private var tressureChestCount:Int
    
    init(tressureChestCount: Int, name: String, cannonsCount: Int) {
        self.tressureChestCount = tressureChestCount
        super.init(name: name, cannonsCount: cannonsCount)
    }
    
    func findTressureChest() {
        print("We just found a new treassure Chest")
        tressureChestCount += 1
    }
}

class TreasureMap {
    private let treasureX: Int
    private let treasureY: Int

    init(treasureX: Int, treasureY: Int) {
        self.treasureX = treasureX
        self.treasureY = treasureY
        print("🗺️ Treasure map found!, with coordinates(\(treasureX), \(treasureY))")
    }

    func hintToTreasure(x: Int, y: Int) {
        if x == treasureX && y == treasureY {
            print("🥂 Congratulations, You found the treasure!")
        } else {
            let hintX = x < treasureX ? "Go East" : "Go West"
            let hintY = y < treasureY ? "Go North" : "Go South"
            print("You are not there yet. To find the treasure you should go \(hintX) on X axis, and  \(hintY) on Y axis.")
        }
    }
}

class SeaAdventure {
    private let adventureType: String

    init(adventureType: String) {
        self.adventureType = adventureType
    }

    func encounter() {
        print("👻 Our ship encountered a \(adventureType) adventure! ")
    }
}

class PirateCode {
    
    private func discussTerms(term: String) {
        print("Negotiations have begun: \(term)")
    }
    
    func parley() {
        discussTerms(term: "Parley")
        print("Parley successful - we shall talk like civilized pirates.")
    }
    
    func mutiny() {
        discussTerms(term: "Mutiny")
        print("Mutiny successful - Fight!")
    }
}

// Simulation

// Create pirate ship, add crew and cargo
let pirateShip = PirateShip(name: "Saber of Xebec", cannonsCount: 100)
pirateShip.addCrew(crewMembers: ["BlackBeard", "Shiryu", "Aokiji", "Laffite", "Avalo Pizaro"])
pirateShip.addCargo(items: ["Rum", "Gold", "Spices", "The Last Road Poneglyph", "Devil Fruits"])
print("🏴‍☠️⛴️ New pirate ship \(pirateShip.getName()) appeared! ")
pirateShip.listCrew()
pirateShip.listCargo()

// Create treasure map
let treasureMap = TreasureMap(treasureX: 25, treasureY: 60)

// Create pirate Code
print("📖 Pirate Code Founded! ")
let pirateCode = PirateCode()

// Create sea adventure
let seaAdventure = SeaAdventure(adventureType: "FlyingDutchman")

print("It's time to go treasure hunting")
print("Our ship is ready for an adventure!")

// Coordinates at first
let startX = 0
let startY = 0
print("Starting Coordinates: (\(startX), \(startY))")
treasureMap.hintToTreasure(x: startX, y: startY)
print("⛴️ Ship started to move at right direction! ")
let treasureX = 25
let treasureY = 60
print("Current Coordinates: (\(treasureX), \(treasureY))")
treasureMap.hintToTreasure(x: treasureX, y: treasureY)

// Sea adventure ecnountered
seaAdventure.encounter()

// Mutiny decided!
pirateCode.mutiny()

// Pirate ship is starting a battle
let bombsToShoot = 60
print("\(pirateShip.getName()) decided to Attack with \(bombsToShoot) bombs 💣")
pirateShip.fireCannons(bombsToShoot)
print("\(pirateShip.getName()) decided to Attack with \(bombsToShoot) bombs 💣")
pirateShip.fireCannons(bombsToShoot)
print("🎬 The End...")
