import UIKit


func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    var dic = [Int: Int]()
    for (i,num) in nums.enumerated() {
        let temp = target - num
        if dic[temp] != nil {
            return [dic[temp]!, i]
        } else {
            dic[num] = i
        }
    }
    return []
}
