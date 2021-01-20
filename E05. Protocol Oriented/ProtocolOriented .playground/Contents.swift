import UIKit

protocol Bird: CustomStringConvertible {
    var name: String { get }
    var canFly: Bool { get }
}

extension CustomStringConvertible where Self: Bird {
    var description: String {
        canFly ? "I can fly" : "Guess I'll just sit here :("
    }
}

extension Bird {
    var canFly: Bool { self is Flyable }
}

protocol Flyable {
    var airSpeedVelocity: Double { get }
}


struct FlappyBird: Bird, Flyable {
    let name: String
    let canFly: Bool = true
    
    let flappyAmplitude: Double
    let flappyFrequency: Double
    
    
    var airSpeedVelocity: Double {
        3 * flappyFrequency * flappyAmplitude
    }
}

struct Penguin: Bird {
    let name: String
    let canFly: Bool
}

struct SwiftBird: Bird, Flyable {
    
    var name: String { "Swift \(version)" }
    let canFly: Bool = true
    let version: Double
    private var speedFactor = 1000.0
    
    var airSpeedVelocity: Double {
        version * speedFactor
    }
    
    init(version: Double) {
        self.version = version
    }
}

enum UnladenSwallow: Bird, Flyable {
    case african
    case european
    case unknown
    
    var name: String {
        switch self {
        case .unknown:
            return "What do you mean? African or European?"
        default:
            return String(describing: self).localizedCapitalized
        }
    }
    
    var airSpeedVelocity: Double {
        switch self {
        case .african:
            return 10.0
        case .european:
            return 9.9
        case .unknown:
            fatalError("You are thrown from the bridge of death!")
        }
    }
}

extension UnladenSwallow {
    var canFly: Bool { self != .unknown }
}

UnladenSwallow.unknown.canFly         // false
UnladenSwallow.african.canFly         // true
Penguin(name: "King Penguin", canFly: false).canFly



