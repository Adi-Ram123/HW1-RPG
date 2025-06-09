// Project: RamaswamyAditya-HW1
// EID: asr3766
// Course: CS371L

//String Array Constants
let WEAPONNAMES = ["dagger", "axe", "staff", "sword", "none"]
let ARMORNAMES = ["plate", "chain", "leather", "none"]

class Weapon {
    let weapon:String
    //DMG constants
    let DAGGER = 4
    let AXE = 6
    let STAFF = 6
    let SWORD = 10
    let NONE = 1
    init(weaponType:String) {
        weapon = weaponType
    }
}

class Armor {
    let armor:String
    //AC constants
    let PLATE = 2
    let CHAIN = 5
    let LEATHER = 8
    let NONE = 10
    init(armorType:String) {
        armor = armorType
    }
}

class RPGCharacter {
    let chName:String
    var hp:Int
    var sp:Int
    var weaponType:Weapon
    var armorType:Armor
    
    init(name:String) {
        chName = name
        weaponType = Weapon(weaponType: "none")
        armorType = Armor(armorType: "none")
        //Override
        hp = 0
        sp = 0
    }
}

class Fighter : RPGCharacter {
    init(character:String) {
        super.init(name: character)
        hp = 40
        sp = 0
    }
    func wield(weaponObject:String) {
        if(WEAPONNAMES.contains(weaponObject)) {
            let weapon = Weapon(weaponType: weaponObject)
            weaponType = weapon
            print("\(chName) is now wielding a(n) \(weaponObject)")
        } else {
            print("Weapon does not exist")
        }
    }
}

class Wizard : RPGCharacter {
    init(character:String) {
        super.init(name: character)
        hp = 16
        sp = 20
    }
    func wield(weaponObject:String) {
        if(WEAPONNAMES.contains(weaponObject) && ((weaponObject == "dagger") || weaponObject == "staff")) {
            let weapon = Weapon(weaponType: weaponObject)
            weaponType = weapon
            print("\(chName) is now wielding a(n) \(weaponObject)")
        } else {
            print("Weapon not allowed for this character class")
        }
    }
    
    //Conditions:
    //Weapon must be dagger or staff or none
    //No Armor
}

print("TEST")


