// Project: RamaswamyAditya-HW1
// EID: asr3766
// Course: CS371L

//String Array Constants
let WEAPONNAMES = ["dagger", "axe", "staff", "sword", "none"]
let ARMORNAMES = ["plate", "chain", "leather", "none"]
let SPELLNAMES = ["Fireball", "Lightning Bolt", "Heal"]

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
    init(character:String) {
        chName = character
        weaponType = Weapon(weaponType: "none")
        armorType = Armor(armorType: "none")
        //Override
        hp = 0
        sp = 0
    }
    func unwield() {
        weaponType = Weapon(weaponType: "none")
        print("\(chName) is no longer wielding anything")
    }
    func takeOffArmor() {
        armorType = Armor(armorType: "none")
        print("\(chName) is no longer wearing any armor")
    }
    func checkForDefeat(character:RPGCharacter){
        if(character.hp <= 0) {
            print("\(character.chName) has been defeated!")
        }
    }
    func fight(opponent:RPGCharacter) {
        print("\(chName) attacks \(opponent.chName) with a(n) \(weaponType.weapon)")
        let dmg:Int
        if(weaponType.weapon == "dagger") {
            opponent.hp -= weaponType.DAGGER
            dmg = weaponType.DAGGER
        } else if(weaponType.weapon == "axe") {
            opponent.hp -= weaponType.AXE
            dmg = weaponType.AXE
        } else if(weaponType.weapon == "staff") {
            opponent.hp -= weaponType.STAFF
            dmg = weaponType.STAFF
        } else if(weaponType.weapon == "sword"){
            opponent.hp -= weaponType.SWORD
            dmg = weaponType.SWORD
        } else {
            opponent.hp -= weaponType.NONE
            dmg = weaponType.NONE
        }
        print("\(chName) does \(dmg) damage to \(opponent.chName)")
        print("\(opponent.chName) is now down to \(opponent.hp) health")
        checkForDefeat(character: opponent)
    }
    func show() {
        print(chName)
        print("\tCurrent Health: \(hp)")
        print("\tCurrent Spell Points: \(sp)")
        print("\tWielding: \(weaponType.weapon)")
        print("\tWearing: \(armorType.armor)")
        let ac:Int
        if(armorType.armor == "plate") {
            ac = armorType.PLATE
        } else if(armorType.armor == "chain") {
            ac = armorType.CHAIN
        } else if(armorType.armor == "leather") {
            ac = armorType.LEATHER
        } else {
            ac = armorType.NONE
        }
        print("\tArmor Class: \(ac)")
    }
}

//HP = 40 SP = 0
//Can Wield any weapon
//Can put on any armor
class Fighter : RPGCharacter {
    let HP = 40
    let SP = 0
    init(name:String) {
        super.init(character: name)
        hp = HP
        sp = SP
    }
    func wield(weaponObject:Weapon) {
        if(WEAPONNAMES.contains(weaponObject.weapon)) {
            weaponType = weaponObject
            print("\(chName) is now wielding a(n) \(weaponObject.weapon)")
        } else {
            print("Weapon does not exist")
        }
    }
    func putOnArmor(armorObject:Armor) {
        if(ARMORNAMES.contains(armorObject.armor)) {
            armorType = armorObject
            print("\(chName) is now wearing \(armorObject.armor)")
        } else {
            print("Armor does not exist")
        }
    }
}

//HP = 16 SP = 20
//Can Wield only dagger or staff
//Can not put on any armor
class Wizard : RPGCharacter {
    let HP = 16
    let SP = 20
    let FIREBALL = 5
    let LIGHTNINGBOLT = 10
    let HEAL = 6
    let FIREBALLSP = 3
    let LIGHTNINGBOLTSP = 10
    let HEALSP = 6
    init(name:String) {
        super.init(character: name)
        hp = HP
        sp = SP
    }
    func wield(weaponObject:Weapon) {
        if(WEAPONNAMES.contains(weaponObject.weapon) && ((weaponObject.weapon == "dagger") || weaponObject.weapon == "staff")) {
            weaponType = weaponObject
            print("\(chName) is now wielding a(n) \(weaponObject.weapon)")
        } else {
            print("Weapon not allowed for this character class")
        }
    }
    func putOnArmor(armorObject:String) {
        print("Armor not allowed for this character class")
    }
    func castSpell(spellName:String, target:RPGCharacter){
        if(SPELLNAMES.contains(spellName)) {
            print("\(chName) casts \(spellName) at \(target.chName)")
            if(spellName == "Fireball") {
                if(sp >= FIREBALLSP) {
                    target.hp -= FIREBALL
                    sp -= FIREBALLSP
                    print("\(chName) does \(FIREBALL) damage to \(target.chName)")
                    print("\(target.chName) is now down to \(target.hp) health")
                    checkForDefeat(character: target)
                } else {
                    print("Insufficient spell points")
                }
            } else if(spellName == "Lightning Bolt") {
                if(sp >= LIGHTNINGBOLTSP) {
                    target.hp -= LIGHTNINGBOLT
                    sp -= LIGHTNINGBOLTSP
                    print("\(chName) does \(LIGHTNINGBOLT) damage to \(target.chName)")
                    print("\(target.chName) is now down to \(target.hp) health")
                    checkForDefeat(character: target)
                } else {
                    print("Insufficient spell points")
                }
            } else {
                if(sp >= HEALSP) {
                    let oldHp = target.hp
                    target.hp = min(HP, target.hp + HEALSP)
                    sp -= HEALSP
                    let healed = target.hp - oldHp
                    print("\(chName) heals \(target.chName) for \(healed) health points.")
                    print("\(target.chName) is now at \(target.hp) health")
                } else {
                    print("Insufficient spell points")
                }
            }
        } else {
            print("Unknown spell name. Spell failed.")
        }
    }
}

// top level code

// Create one of each armor and weapon for use
let plateMail = Armor(armorType:"plate")
let chainMail = Armor(armorType:"chain")
let sword = Weapon(weaponType:"sword")
let staff = Weapon(weaponType:"staff")
let axe = Weapon(weaponType:"axe")

let gandalf = Wizard(name:"Gandalf the Grey")
gandalf.wield(weaponObject:staff)

let aragorn = Fighter(name:"Aragorn")
aragorn.putOnArmor(armorObject:plateMail)
aragorn.wield(weaponObject:axe)

gandalf.show()
aragorn.show()

gandalf.castSpell(spellName:"Fireball",target:aragorn)
aragorn.fight(opponent:gandalf)

gandalf.show()
aragorn.show()

gandalf.castSpell(spellName:"Lightning Bolt",target:aragorn)
aragorn.wield(weaponObject:sword)

gandalf.show()
aragorn.show()

gandalf.castSpell(spellName:"Heal",target:gandalf)
aragorn.fight(opponent:gandalf)

gandalf.fight(opponent:aragorn)
aragorn.fight(opponent:gandalf)

gandalf.show()
aragorn.show()
