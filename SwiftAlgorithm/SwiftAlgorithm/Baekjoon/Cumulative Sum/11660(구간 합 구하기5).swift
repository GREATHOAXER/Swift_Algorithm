//
//  11660(구간 합 구하기5).swift
//  SwiftAlgorithm
//
//  Created by Hyung Seo Han on 2023/10/28.
//

import Foundation

let input = Array(readLine()!.split(separator: " ").map {
    Int(String($0))!
})


let N = input[0], M = input[1]

var inputArr: [[Int]] = []

for _ in 0..<N {
    inputArr.append(Array(readLine()!.split(separator: " ").map { Int(String($0))!}))
}

var cumulativeSum = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)



for i in 1...N {
    for j in 1...N {
        cumulativeSum[i][j] = cumulativeSum[i-1][j] + cumulativeSum[i][j-1] - cumulativeSum[i-1][j-1] + inputArr[i-1][j-1]
    }
}

var ans: [Int] = []

for _ in 0..<M {
    let coordInput = Array(readLine()!.split(separator: " ").map {Int(String($0))!})
    let x1 = coordInput[0], y1 = coordInput[1], x2 = coordInput[2], y2 = coordInput[3]
    ans.append(cumulativeSum[x2][y2] - cumulativeSum[x2][y1-1] - cumulativeSum[x1-1][y2] + cumulativeSum[x1-1][y1-1])
}

for element in ans {
    print(element)
}
