
class StationModule {
    private let moduleName: String
    private var drone: Drone? = nil
    
    init(moduleName: String) {
        self.moduleName = moduleName
    }
    
    
    func setDroneTask(task: String) {
        drone?.setTask(task: task)
    }
    func getDroneTask() {
        drone?.checkTask()
    }
    
    func setDrone(drone: Drone) {
        self.drone = drone
    }
    func getName() -> String {
        moduleName
    }
}

class ControlCenter: StationModule {
    private var isLockedDown: Bool
    private let securityCode: String // Stores password
    
    init(isLockedDown: Bool = false, securityCode: String, stationModuleName: String) {
        self.isLockedDown = isLockedDown
        self.securityCode = securityCode
        // initialize StationModule properties
        super.init(moduleName: stationModuleName)
    }
    
    // lockdown control center if password == securityCode
    func lockdown(password: String) {
        if securityCode == password {
            isLockedDown = true
        } else {
            isLockedDown = false
        }
    }
    
    func printLockdownStatus() {
        print("ControlCenter is under lockdown: \(isLockedDown)")
    }
    
}

class ResearchLab: StationModule {
    private var labSamples: [String]
    
    init(labSamples: [String] = [], stationModuleName: String) {
        self.labSamples = labSamples
        // initialize StationModule properties
        super.init(moduleName: stationModuleName)
    }
    
    func addSamples(sample: String) {
        labSamples.append(sample)
    }
}

class LifeSupportSystem: StationModule {
    private let oxygenLevel: Int
    
    init(oxygenLevel: Int, stationModuleName: String) {
        self.oxygenLevel = oxygenLevel
        // initialize StationModule properties
        super.init(moduleName: stationModuleName)
    }
    
    func getOxygenStatus() {
        
        if oxygenLevel > 90 {
            print("Oxygen Status(\(oxygenLevel)): Normal🟢")
        } else if oxygenLevel > 70 {
            print("Oxygen Status(\(oxygenLevel)): Low, BREATHE MORE AIR!🟡")
        } else {
            print("Oxygen Status(\(oxygenLevel)): Critical, SEEK HELP!🔴")
        }
    }
}

class Drone {
    private var task: String?
    private unowned var assignedModule: StationModule
    // missionControlLink will be initialized later outside of init(), bcs we want it to be connected
    // to the specific MissionControl class that we create at the end
    private weak var missionControlLink: MissionControl?
    
    init(task: String? = nil, assignedModule: StationModule) {
        self.task = task
        self.assignedModule = assignedModule
    }
    
    func checkTask() {
        if let task = task {
            print("Drones' task: \(task)")
        } else {
            print("Drone does not have a task yet!")
        }
    }
    
    func setTask(task: String) {
        self.task = task
    }
    
    func setMissionControlLink(missionControlLink: MissionControl) {
        self.missionControlLink = missionControlLink
    }
}

class OrbitronSpaceStation {
    private let stationModule = StationModule(moduleName: "The Death Star")
    
    private let controlCenterDrone: Drone
    private let researchLabDrone: Drone
    private let lifeSupportSystemDrone: Drone
    
    let controlCenter: ControlCenter
    let researchLab: ResearchLab
    let lifeSupportSystem: LifeSupportSystem
    
    init() {
        // initialize modules
        self.controlCenter = ControlCenter(securityCode: "12345", stationModuleName: stationModule.getName())
        self.researchLab = ResearchLab(stationModuleName: stationModule.getName())
        self.lifeSupportSystem = LifeSupportSystem(oxygenLevel: 100, stationModuleName: stationModule.getName())
        
        // initialize drones
        self.controlCenterDrone = Drone(assignedModule: stationModule)
        self.researchLabDrone = Drone(assignedModule: stationModule)
        self.lifeSupportSystemDrone = Drone(assignedModule: stationModule)
        // give drones to modules
        assignDronesToModules()
    }
    
    private func assignDronesToModules() {
        controlCenter.setDrone(drone: controlCenterDrone)
        researchLab.setDrone(drone: researchLabDrone)
        lifeSupportSystem.setDrone(drone: lifeSupportSystemDrone)
    }
    
    func lockdown(password: String) {
        controlCenter.lockdown(password: password)
        controlCenter.printLockdownStatus()
    }
    
    func setMissionControlToDrones(missionControl: MissionControl) {
        controlCenterDrone.setMissionControlLink(missionControlLink: missionControl)
        researchLabDrone.setMissionControlLink(missionControlLink: missionControl)
        lifeSupportSystemDrone.setMissionControlLink(missionControlLink: missionControl)
    }
}

class MissionControl {
    private(set) var spaceStation: OrbitronSpaceStation? = nil

    func connectToStation(orbitronSpaceStation: OrbitronSpaceStation) {
        spaceStation = orbitronSpaceStation
    }
    
    func requestControlCenterStatus() {
        spaceStation?.controlCenter.printLockdownStatus()
    }
    func requestOxygenStatus() {
        spaceStation?.lifeSupportSystem.getOxygenStatus()
    }
    // finds out what drone does
    func requestDroneStatus() {
        print("Control Center Drone:")
        spaceStation?.controlCenter.getDroneTask()
        print("Life Support Drone:")
        spaceStation?.lifeSupportSystem.getDroneTask()
        print("Research Lab Drone:")
        spaceStation?.researchLab.getDroneTask()
    }
}

// Simulation

let orbitronSpaceStation = OrbitronSpaceStation()
let missionControl = MissionControl()
missionControl.connectToStation(orbitronSpaceStation: orbitronSpaceStation)
missionControl.requestControlCenterStatus()
// set mission control link to drones
missionControl.spaceStation?.setMissionControlToDrones(missionControl: missionControl)

// give tasks to drones
missionControl.spaceStation?.controlCenter.setDroneTask(task: "Search for enemies")
missionControl.spaceStation?.researchLab.setDroneTask(task: "Search for aliens")
missionControl.spaceStation?.lifeSupportSystem.setDroneTask(task: "Bring more oxygen balloon to everyone who needs")

// check drone status
missionControl.requestDroneStatus()

// check oxygen level
missionControl.spaceStation?.lifeSupportSystem.getOxygenStatus()

// lockdown
print("1st try")
missionControl.spaceStation?.lockdown(password: "123")
print("2nd try")
missionControl.spaceStation?.lockdown(password: "12345")

