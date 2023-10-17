//
//  21921(블로그).swift
//  SwiftAlgorithm
//
//  Created by Hyung Seo Han on 2023/10/18.
//  link: https://www.acmicpc.net/problem/21921

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let N = input[0], K = input[1]

let numbers = readLine()!.split(separator: " ").map{Int($0)!}

var cumulativeSum: [Int] = Array<Int>(repeating: 0, count: N)
var temp = 0
for i in 0..<N {
    temp += numbers[i]
    cumulativeSum[i] = temp
}

if (cumulativeSum[N-1] == 0) {
    print("SAD")
}
else {
    var maxNumber: Int = cumulativeSum[K-1]
    var count: Int = 1
    
    for i in K..<N {
        let tempNumber: Int = cumulativeSum[i] - cumulativeSum[i-K]
        if(tempNumber > maxNumber) {
            maxNumber = tempNumber
            count = 1
        } else if(tempNumber == maxNumber) {
            count += 1
        } else {
            continue
        }
    }
    print("\(maxNumber)\n\(count)")
}
