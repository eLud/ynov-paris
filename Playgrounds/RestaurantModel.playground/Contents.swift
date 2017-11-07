//: Playground - noun: a place where people can play

struct Restaurant: Equatable {
    
    var name: String
    var address: String
    var style: String
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

var resto = Restaurant(name: "", address: "", style: "", note: 0, isVisited: false)
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
let r1 = Restaurant(name: "R1", address: "A1", style: "", note: 0, isVisited: false)
let r2 = Restaurant(name: "R2", address: "A1", style: "", note: 0, isVisited: false)

dir.add(r1)
dir.list()
dir.remove(r1)
dir.list()

var testOptionnal: Optional<Int> = 5

// Teste si non-nil, et déballe automatiquement
if let monInt = testOptionnal {
    monInt * 2
}


