//: [Previous](@previous)

import Foundation

class Queue {
    
    
    // struct of people in the crew
    struct Person {
        
        var name: String
        var priority: Int
        
        init () {
            
            name = ""
            // priority 21 denotes a non-element in the queue
            priority = 21
        }
    }
    
    
    // properties of the class
    var theQueue = [Person]()
    var frontPointer: Int = 0
    var rearPointer: Int = 0
    var size: Int = 0
    
    // length of queue input to fit the need - but once created cannot be changed
    init (lengthOfQueue: Int) {
        for _ in 0...(lengthOfQueue - 1) {
            // create an array of correct length of non-element persons
            theQueue.append(Person())
        }
    }
    
    
    // method to check if the queue is empty
    func isEmpty() -> Bool {
        if size == 0 {
            return true
        }
        else {
            return false
        }
    }
    
    
    // method to check if the queue is full
    func isFull() -> Bool {
        if size == theQueue.count {
            return true
        }
        else {
            return false
        }
    }
    
    
    // method to add a person to the queue in the correct place
    func enQueue(personName: String, personPriority: Int) {
        // create a new person record using input parameters
        var newPerson = Person()
        newPerson.name = personName
        newPerson.priority = personPriority
        // can't enqueue if the queue is full
        if !isFull() {
            // add 1 to the size
            size = size + 1
            // find the location of the point where the new element should go
            var insertLocation = frontPointer
            while theQueue[insertLocation].priority <= newPerson.priority {
                insertLocation = ((insertLocation + 1) % theQueue.count)
            }
            // shift elements above the insertion point up
            var elementAboutToBeShifted = rearPointer
            while elementAboutToBeShifted != insertLocation {
                theQueue[(elementAboutToBeShifted + 1) % theQueue.count] = theQueue[elementAboutToBeShifted]
                if elementAboutToBeShifted == 0 {
                    elementAboutToBeShifted = theQueue.count - 1
                }
                else {
                    elementAboutToBeShifted = elementAboutToBeShifted - 1
                }
            }
            // insert the new element
            theQueue[insertLocation] = newPerson
            // increment the rear pointer, unless the final index of the queue, in which case the rear pointer sets to 0
            rearPointer = ((rearPointer + 1) % theQueue.count)
        }
    }
    
    
    // method to dequeue the front element
    func deQueue() {
        // can't dequeue if the queue is empty
        if !isEmpty() {
            // clear the front of the queue
            theQueue[frontPointer] = Person()
            // increment the front pointer, unless the final index of the queue, in which case the front pointer sets to 0
            frontPointer = ((frontPointer + 1) % theQueue.count)
            size = size - 1
            
        }
    }
    
}
