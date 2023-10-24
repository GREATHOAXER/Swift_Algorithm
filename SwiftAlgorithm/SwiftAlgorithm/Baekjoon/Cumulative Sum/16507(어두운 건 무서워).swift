//
//  16507(어두운 건 무서워).swift
//  SwiftAlgorithm
//
//  Created by Hyung Seo Han on 2023/10/25.
//  link : https://www.acmicpc.net/problem/16507

import Foundation


let input = Array(readLine()!.split(separator: " ").map {
    Int(String($0))!
})


let R = input[0], C = input[1], Q = input[2]

var arr: [[Int]] = []

for _ in 0..<R {
    arr.append(readLine()!.split(separator: " ").map{
        Int(String($0))!
    })
}

var cumulativeSum: [[Int]] = Array(repeating: Array(repeating: 0, count: C+1), count: R+1)

for i in 1...R{
    for j in 1...C {
        cumulativeSum[i][j] = cumulativeSum[i-1][j] + cumulativeSum[i][j-1] - cumulativeSum[i-1][j-1] + arr[i-1][j-1]
    }
}

var ans: [Int] = []
for _ in 0..<Q {
    var answer = 0
    
    let input = Array(readLine()!.split(separator: " ").map {
        Int(String($0))!
    })
    
    let r1 = input[0], c1 = input[1], r2 = input[2], c2 = input[3]
    answer = (cumulativeSum[r2][c2] - cumulativeSum[r1-1][c2] - cumulativeSum[r2][c1-1] + cumulativeSum[r1-1][c1-1]) / ((r2-r1+1) * (c2-c1+1))
    ans.append(answer)
}

for element in ans {
    print(element)
}
