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
