//: Playground - noun: a place where people can play

//: Variables & constantes

var firstName: String = "Ludovic"

var languageName = "Swift"
var version: Float = 4.0
let introductionYear = 2014
let isAwesome = true
let intial: Character = "S"

//: Typage fort
//languageName = 52

//: Constante
//introductionYear = 2015

version = 5.0

//: Type inference
// Ne pas écrire le type, mais laisser Swift le déduire

var a = 5
let b = 2

let doubleA = Double(a)

let c = Double(a)/Double(b)

//:# Classes et Structures

struct Engine {

    var brand = "Opel"
    var nbOfCylinders = 4

    func start() {
        print("Started")
    }
}

var monMoteur = Engine()
monMoteur.nbOfCylinders
monMoteur.start()

let moteur2 = monMoteur
monMoteur.nbOfCylinders = 6

moteur2.nbOfCylinders

class Car {

    var brand = "Opel"
    var wheels = 4

    func board(passengers nbOfPax: Int = 4) {
        print("On a embarqué \(nbOfPax) passagers dans la voiture")
    }

    func go(destination: String, speed: Int) {

    }
}

let maVoiture = Car()
maVoiture.wheels

let voiture2 = maVoiture
maVoiture.wheels = 6

voiture2.wheels

//Appel méthodes
maVoiture.board(passengers: 25)
maVoiture.board()
maVoiture.go(destination: "Paris", speed: 3)

func 🗑(at index: Int) {

}

🗑(at: 5)

func insert(value: Int, 🤣: Int) {

}

insert(value: 5, 🤣: 10)

func loadURL() -> (statusCode: Int, message: String) {
    //On essaye de charger une URL

    return (200, "OK")
}

let result = loadURL()
result.message



















