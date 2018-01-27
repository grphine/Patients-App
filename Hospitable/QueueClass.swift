
import UIKit

struct dataItem {
    
    var name:String!
    var priority:Int!
    
}

class Queue {
    
    // setup the array that will hold the queue
    var queue = [dataItem]()
    
    // holds the current queue positions
    var rear = 0
    var front = 0
    
    var queueSize:Int!
    
    init(lengthOfQueue:Int) {
        
        // create the queue depending on the length asked
        for _ in 0...lengthOfQueue - 1 {
            queue.append(dataItem(name: "nil", priority: -1))
        }
        
        queueSize = lengthOfQueue
    }
    
    // adds an item to the queue
    func addItemToQueue(itemToAdd: dataItem) {
        
        // check if queue is full
        if (rear - front == queueSize) {
            print("Queue full")
            return
        }
        
        // var which keeps track of where we will insert the new item (deafult value is rear as if there are no values in the array we will insert a position 0)
        var insersionIndex = rear % queueSize
        
        // keeps track of if we have found a position for the item
        var foundPosition = false
        
        // init the position we will start searching at
        var currentPosition = front
        
        // keep on searching through the array until we find where the item needs to go
        while ((foundPosition == false) && (front != rear) && ((currentPosition) < (rear))) {
            
            // check if the priorty of the item is greater than the next item in the queue
            if itemToAdd.priority > queue[currentPosition % queueSize].priority {
                
                // we want to insert the item one before this item
                insersionIndex = (currentPosition) % queueSize
                foundPosition = true
            }
            else {
                insersionIndex = rear
            }
            
            // increment to the next position
            currentPosition += 1
        }
        
        // move everthing after the index up one position
        for item in stride(from: rear % queueSize, to: insersionIndex, by: -1) {
            
            // something wierd is going on with moving back the array
            
            queue[item % queueSize] = queue[(item - 1) % queueSize]
            
        }
        
        
        // insert the new item
        queue[insersionIndex % queueSize] = itemToAdd
        
        // increment the rear
        rear += 1
        
    }
    
    // dequeues the next item
    func dequeItem() -> dataItem {
        
        
        // check if queue is empty
        if (rear == front) {
            print("queue empty")
            return dataItem(name: "nil", priority: -1)
        }
        
        // move the front pointer forward one
        front += 1
        
        // return the value
        return queue[(front - 1) % queueSize]
    }
}

