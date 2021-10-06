import UIKit

class Student {
    var name: String
    var age: Int
    var next: Student?   // next - pointer to next list object
    init(name: String, age: Int, next: Student? = nil) {
        self.name = name
        self.age = age
        self.next = next
    }
}
// Create a list of ten items
func create() -> Student? {
    let head = Student(name: "Student1",
                       age: Int.random(in: 18...25))
    var current = head
    for i in 1..<10 {
        let next = Student(name: "Student\(i + 1)",
                           age: Int.random(in: 18...25))
        current.next = next
        current = next
    }
    return head
}
// Add a new element
func addNewElement(head: Student, newNameElement: String, position: Int) -> Student {
    let newElement = Student(name: newNameElement ,
                             age: Int.random(in: 18...25))
    var previous = head
    var count = 1
    if position == 1{
        newElement.next = previous
        return newElement
    } else {
        while count < position - 1 {
            previous = previous.next!
            count += 1
        }
        let current = previous.next
        newElement.next = current
        previous.next = newElement
    }
    return head
}
// Sorting nodes in order
func printList(_ head: Student?) {
    var current = head
    while current != nil {
        print("\(current!.name) и ему \(current!.age) лет!")
        current = current?.next
    }
}
// Reverse the list
func reverse(_ head: Student) -> Student {
    var start = head
    var previous: Student? = nil
    var current = start
    var next = start.next
    while next != nil {
        current.next = previous
        previous = current
        current = next!
        next = current.next
    }
    current.next = previous
    start = current
    return start
}

//printList(create())
//printList(reverse(create()!))
//printList(addNewElement(head: create()!, newNameElement: "AAA", position: 1))
//printList(reverse(addNewElement(head: create()!, newNameElement: "New Student", position: 3)))
