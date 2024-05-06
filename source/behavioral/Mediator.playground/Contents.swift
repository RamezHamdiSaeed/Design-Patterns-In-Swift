/*:
💐 Mediator
-----------

The mediator pattern is used to reduce coupling between classes that communicate with each other. Instead of classes communicating directly, and thus requiring knowledge of their implementation, the classes send messages via a mediator object.

### Example
*/

enum LandingStatus{
    case Free
    case Busy
}

protocol Reciever{
    func recieveLandingStatus(landingStatus:LandingStatus)

}

protocol Sender{
    var airPlanes :[Reciever] { get }
    func sendLandingStatus(landingStatus:LandingStatus)
    func registerAirPlane(reciever:Reciever)

    
}


struct AirPlane : Reciever{
    let number : Int
    func recieveLandingStatus(landingStatus: LandingStatus) {
        print("I Got the Status of : \(landingStatus)")
    }
    
    
}

class AirPlaneTower : Sender{
    
    var airPlanes: [Reciever] = []
    func sendLandingStatus(landingStatus: LandingStatus) {
        for airPlane in airPlanes{
            airPlane.recieveLandingStatus(landingStatus: .Busy)
        }
    }
    
    func registerAirPlane(reciever: Reciever) {
        self.airPlanes.append(reciever)
    }
    
    
}



 let airPlaneTower = AirPlaneTower()

 let airPlane1 = AirPlane(number: 1)
 let airPlane2 = AirPlane(number: 2)
 let airPlane3 = AirPlane(number: 3)

 airPlaneTower.registerAirPlane(reciever: airPlane1)
 airPlaneTower.registerAirPlane(reciever: airPlane2)
 airPlaneTower.registerAirPlane(reciever: airPlane3)

 airPlaneTower.sendLandingStatus(landingStatus: .Busy)

