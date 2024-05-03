

import Foundation
/*:
🍫 Iterator
-----------

The iterator pattern is used to provide a standard interface for traversing a collection of items in an aggregate object without the need to understand its underlying structure.

### Example:
*/


struct Employee{
    let name : String
    let age : Int
}

struct Employees{
    let employees : [Employee]
}

struct EmployeesIterator : IteratorProtocol{
    typealias Element = Employee
    var counter : Int = 0
    var employees : [Employee]
    
    
   mutating func next() -> Element? {
        defer { self.counter += 1}
        return self.counter < self.employees.count ? self.employees[counter] : nil
    }
}

extension Employees : Sequence{
    
    func makeIterator() -> EmployeesIterator {
        return EmployeesIterator(employees: employees)
    }
}





 let employees : Employees = Employees(employees: [Employee(name: "ramez", age: 26),Employee(name: "Hamdi", age: 60)])

for employee in employees {
    print("employee name :\(employee.name) employee age :\(employee.age) ")
}
