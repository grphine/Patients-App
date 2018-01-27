//: [Previous](@previous)

import Foundation

class CircularQueue{
    
    var theQueue = ["","","","","","","","","",""]
    var front : Int = 0
    var rear : Int = -1
    var size : Int = 0
    var maxsize : Int = 10
    
    func isEmpty() -> Bool{
        if size == 0{
            return true
        }
        else{
            return false
        }
    }
    
    func isFull() -> Bool{
        if size == maxsize{
            return true
        }
        else{
            return false
        }
    }
    
    func enQueue(anyItem:String){
        if isFull(){
            print("The Queue is full")
        }
        else{
            rear = (rear + 1) % maxsize
            theQueue[rear] = anyItem
            size = size + 1
        }
    }
    
    func deQueue(){
        if isEmpty(){
            print("The queue is empty")
        }
        else{
            print("The item \(theQueue[front]) has be dequeued")
            front = (front + 1) % maxsize
            size = size - 1
        }
    }
    
}
