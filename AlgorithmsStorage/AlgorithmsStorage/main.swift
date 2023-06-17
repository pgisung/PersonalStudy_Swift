//
//  baekjoon_10845.swift
//  AlgorithmsStorage
//
//  Created by JOHNNY_MAC_1 on 2023/06/17.
//

import Foundation

/// Defines Pointer Queue for the reason that double stacks queue would take over clock than expected in the worst situation
struct Queue<T: Equatable> {
    /// The array going to role as Queue
    private var inputArray: [T]
    /// An index of the element going to be poped next
    private var headPointer: Int
    /// A cycle to slice inputArray to make only have exists elements in Queue
    private let cycle: Int
    
    /// Capacitty of Queue
    var count: Int {
        inputArray.count - headPointer
    }
    
    /// Determines whether Queue is empty
    var isEmpty: Bool {
        headPointer == inputArray.count
    }
    
    /// Initializes a new instance of Queue that is empty and has the default initial capacity
    init () {
        inputArray = []
        headPointer = 0
        /* Set this cycle as you would like to make cycle to update the inputArray */
        /* cycle have to be at least over 1 */
        cycle = 10
    }
    
    /// Adds an item to the inputArray
    mutating func enqueue(_ item: T) {
        inputArray.append(item)
    }
    
    /// Removes and returns the item at the beginning of Queue
    mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        
        /// Points the next element after dequeue if exists
        defer {
            headPointer += 1
            updateArray()
        }
        
        return inputArray[headPointer]
    }
    
    /// Updates the inputArray to make only have exist elements in queue
    mutating func updateArray() {
        guard !isEmpty else { return }
        
        guard headPointer >= cycle else { return }
        
        inputArray = Array( inputArray.suffix(from: headPointer) )
        headPointer = 0
    }
    
    /// Removes all elements from the inputArray
    mutating func clear () {
        guard !inputArray.isEmpty else { return }
        
        inputArray.removeAll()
        headPointer = 0
    }
    
    /// Determines whether an element is in the inputArray
    func contains(_ item: T) -> Bool {
        var result: Bool = false
        
        guard !isEmpty else { return result }
        
        let queue: [T] = Array(inputArray[headPointer..<inputArray.count])
        
        for element in queue {
            if item == element {
                result = true
                break
            }
        }
        
        return result
    }
    
    /// Returns Queue into Array
    mutating func toArray () -> Array<T> {
        guard !isEmpty else { return [] }
        
        let queue: [T] = Array(inputArray[headPointer..<inputArray.count])
        let result: [T] = queue.reversed()
        
        return result
    }
}

//var arrInteger: [Int] = []
//
//func push(iElement: Int){
//    arrInteger.append(iElement)
//}
//func pop(){
//    arrInteger.remove(at: 0)
//
//    let iCount: Int = arrInteger.count
//    guard iCount > 0 else {
//        print("\(-1)\n")
//        return
//    }
//
//    for iLoopCount in 0 ..< arrInteger.count {
//        print("\(arrInteger[iLoopCount])\n")
//    }
//}
//func empty(){
//    print("\(arrInteger.isEmpty ? 1 : 0)\n")
//}
//func size(){
//    print("\(arrInteger.count)\n")
//}
//func front(){
//    print("\(arrInteger.first ?? -1)\n")
//}
//func back(){
//    print("\(arrInteger.last ?? -1)\n")
//}
//
//var inputNum: String = readLine()!
//let numberOfCommands: Int = Int(inputNum)!
//
//for indexsss in 1...numberOfCommands {
//
//}

var objQueue: Queue<Int> = Queue()
objQueue.enqueue(10)
objQueue.enqueue(20)
objQueue.enqueue(30)
objQueue.enqueue(40)
objQueue.enqueue(50)
let aaa = objQueue.dequeue()
let bbb = objQueue.dequeue()
let ccc = objQueue.dequeue()
let ddd = objQueue.dequeue()
let eee = objQueue.dequeue()
print("\(aaa ?? 0)")
print("\(bbb ?? 0)")
print("\(ccc ?? 0)")
print("\(ddd ?? 0)")
print("\(eee ?? 0)")
