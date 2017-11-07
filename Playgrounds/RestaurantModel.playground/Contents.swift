//: Playground - noun: a place where people can play

enum RestaurantStyle {
    case chinese
    case burger
    case vegan
    case other
}
struct Restaurant: Equatable {
    
    var name: String
    var address: String
    var style: RestaurantStyle
    var note: Int
    var isVisited: Bool

    mutating func grade(_ note: Int) {
        self.note = note
        isVisited = true
    }
    
    public static func ==(lhs: Restaurant, rhs: Restaurant) -> Bool {
        return lhs.name == rhs.name && lhs.address == rhs.address
    }
}

var resto = Restaurant(name: "", address: "", style: .burger, note: 0, isVisited: false)
resto.grade(5)

class Directory {
    
//    var restos: Array<Restaurant> = []
//    var restos = [Restaurant]()
    private var restos: [Restaurant] = []
    
    func add(_ newRestaurant: Restaurant) {
        restos.append(newRestaurant)
    }
    
    func list() -> [Restaurant] {
    
        for r in restos {
            print(r.name)
        }
        
        return restos
    }
    
    func remove(_ restaurant: Restaurant) {

       if let index = restos.index(of: restaurant) {
            remove(at: index)
       } else {
            print("Resto not in array")
        }
    }
    
    func remove(at index: Int) {
        restos.remove(at: index)
    }
}

let dir = Directory()
let r1 = Restaurant(name: "R1", address: "A1", style: .vegan, note: 0, isVisited: false)
let r2 = Restaurant(name: "R2", address: "A1", style: .chinese, note: 0, isVisited: false)

dir.add(r1)
dir.list()
dir.remove(r1)
dir.list()

var testOptionnal: Optional<Int> = 5

// Teste si non-nil, et déballe automatiquement
if let monInt = testOptionnal {
    monInt * 2
}

// borne sup incluse
for i in 0...10 {
    print(i)
}

// borne sup exclue
for i in 0..<10 {
    print(i)
}

var nbHabitants = ["Paris" : 2250000, "Bordeaux" : 239000, "Lyon" : 491268, "Marseille" : 850636]

for truc in nbHabitants {
    print("La clé est " + truc.key)
    print("La clé est \(truc.value)")
}

var greeting = "Good Morning"

switch greeting {
case "Good Morning":
    print("It's morning")

case "Good Evening":
    print("It's evening")
default:
    print("I don't know")
}

enum TransportStatus {
    case onTime
    case delayed (delay: Int, reason: String)
    case cancelled
    case unknown
}

struct Flight {
    var number: String
    var status: TransportStatus
}

var f1 = Flight(number: "AF72", status: .onTime)
f1.status = .delayed(delay: 5, reason: "Fog")

switch f1.status {
case .onTime:
    print("OK")
case .delayed (let delay, let message):
    print("delay : \(delay) minutes because \(message)")
case .cancelled:
    print("cancelled")
case .unknown:
    print("don't know")
}


