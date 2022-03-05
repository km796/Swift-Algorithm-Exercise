import UIKit

import Foundation
class Node {
    var data: Int
    var prev: Node?
    var next: Node?
    
    init(_ data: Int, _ prev: Node?, _ next: Node?) {
        self.data = data
        self.prev = prev
        self.next = next
    }
}

var stack = [Node]()

var lli: Node?


func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    
    var prev = Node(0, nil, nil)
    lli = prev
    for i in 1...n-1 {
        let node = Node(i, prev, nil)
        prev.next = node
        prev = node
        //print(prev.prev?.data, prev.data)
        if i == k{
            lli = node
        }
    }
    
    for cm in cmd{
        let c = cm.split(separator: " ")
        switch c[0] {
        case "D":
            D(x: Int(c[1])!)
        case "U":
            U(x: Int(c[1])!)
        case "Z":
            Z()
        case "C":
            C()
        default:
            break
        }
    }
//    while start != nil {
//        //print(start!.data)
//        start = start!.next
//    }
    var ans = [String]()
    for _ in 0...n-1 {
        ans.append("O")
    }
    for s in stack {
        let idx = s.data
        ans[idx] = "X"
    }
    
    return ans.joined(separator: "")
}

func D(x: Int) {
    //print("D \(x): \(lli!.data)")
    for _ in 0...x-1 {
        lli = lli!.next
    }
}

func U(x: Int) {
    if lli == nil {
        //print("lli is nil")
        return
    }
    //print("U \(x): \(lli!.data)")
    for _ in 0...x-1 {
        if lli != nil {
            lli = lli!.prev
        }
    }
}

func Z() {
    if stack.isEmpty { return }
    let cur = stack.popLast()
    let pr = cur?.prev
    let nx = cur?.next
    if pr != nil {
        pr?.next = cur
    }
    if nx != nil {
        nx?.prev = cur
    }
}

func C() {
    stack.append(lli!)
    let pr = lli?.prev
    let nx = lli?.next
    if let pr = pr {
        pr.next = nx
    }
    if let nx = nx {
        nx.prev = pr
        lli = nx
    } else {
        lli = pr
    }
}
