import UIKit

var arr = [5,4,3,2,1,]

arr.sort { first , second in
    if (first > second) {
        return false
    } else {
        return true
    }
}

print(arr)

class Solution {
     var stones = [Int]()
    var dic = [Int: Int]()
    var memo = [Key: Bool]()
    
    func canCross(_ stones: [Int]) -> Bool {
        self.stones = stones
        for (i, stone) in stones.enumerated() {
            dic[stone] = i
        }
        if (stones[1] != 1) {
              return false
          }
        
        return helper(1, 1)
    }
    
    func helper(_ idx: Int, _ k: Int) -> Bool {
        let key = Key(idx: idx, k: k)
        if memo[key] != nil {
            return memo[key]!
        }
        
        if idx == stones.count - 1 {
            memo[key] = true
            return true
        }
        
        var available = [Int]()
        var jumps = [k, k+1]
        if k > 1 {
            jumps.append(k-1)
        }
        
        for jump in jumps {
            let new_pos = stones[idx] + jump
            if dic[new_pos] != nil {
                available.append(new_pos)
            }
        }
        
        for av in available {
            if helper(dic[av]!, av-stones[idx]){
                memo[key] = true
                return true
            }
        }
        memo[key] = false
        return false
    }
}
struct Key: Hashable {
    let idx: Int
    let k: Int
}
