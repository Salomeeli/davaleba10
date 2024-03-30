import UIKit

var greeting = "Hello, playground"
//შექმენით ციკლური რეფერენცები და გაწყვიტეთ
//აუცილებელია ქლოჟერების გამოყენება
//აუცილებელია value და რეფერენს ტიების გამოყენება (კლასები, სტრუქტურები, ენამები და პროტოკოლები)
//აუცილებელია გამოიყენოთ strong, weak & unowned რეფერენსები ერთხელ მაინც
//დაიჭირეთ self ქლოჟერებში
//გატესტეთ მიღებული შედეგები ინსტანსების შექმნით და დაპრინტვით

//weak
class Sport {
    weak var definition: TypeOfSport?
    var typeOfSport: String
    
    init(definition: TypeOfSport? = nil, typeOfSport: String) {
        self.definition = definition
        self.typeOfSport = typeOfSport
    }
    deinit {
        print ((typeOfSport), "is deallocated")
    }
    
    func someClosure1() {
        definition?.someClosure { [weak self] in
            print(self?.definition as Any)
        }
    }
    
    class TypeOfSport {
        let definition: Sport?
        var teamSport: String
        
        init(definition: Sport?, teamSport: String) {
            self.definition = definition
            self.teamSport = teamSport
        }
        
        
        func someClosure( _: ()-> Void) {
            print("---")
        }
    }
    
    var someSport: Sport? = Sport(typeOfSport: "ინდივიდუალური")
    var someTypeOfSport: TypeOfSport? = TypeOfSport(definition: <#T##Sport?#>, teamSport: "კალათბურთი")
    
    
    //strong
    class DualSport {
        var tennis: String
        var racquetball: TeamSpors?
        
        init(tennis: String, racquetball: TeamSpors? = nil) {
            self.tennis = tennis
            self.racquetball = racquetball
        }
        
        class TeamSpors {
            var racquetball: DualSport?
            var football: String
            
            init(racquetball: DualSport? = nil, football: String) {
                self.racquetball = racquetball
                self.football = football
            }
        }
    }
}
//unowned
class DualSport1 {
    unowned var bowling: IndividualSport?
    var billiard: String
    
    init(bowling: IndividualSport? = nil, billiard: String) {
        self.bowling = bowling
        self.billiard = billiard
    }
}

class IndividualSport {
    var bowling: DualSport1
    var swimming: String
    
    init(bowling: DualSport1, swimming: String) {
        self.bowling = bowling
        self.swimming = swimming
    }
}

//protocol

protocol SuperClass{
    var text: String {get}
}

class Document: SuperClass {
    var signature: String
    var text: String
    
    init(signature: String, text: String) {
        self.signature = signature
        self.text = text
    }
  
    class Book: SuperClass {
        var text: String
        var title: String
        
        init(text: String, title: String) {
            self.text = text
            self.title = title
        }
    }

}
