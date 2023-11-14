//
//  12847(꿀 아르바이트).swift
//  SwiftAlgorithm
//
//  Created by Hyung Seo Han on 2023/11/03.
//  link : https://www.acmicpc.net/problem/12847

import Foundation

let input = Array(readLine()!.split(separator: " ").map {
    Int(String($0))!
})

let n = input[0], m = input[1]

let arr = Array<Int>(readLine()!.split(separator: " ").map {
    Int(String($0))!
})

var max = arr[0..<m].reduce(0, {
    return $0 + $1
})
var temp = max

for i in m..<n {
    temp = temp + arr[i] - arr[i-m]
    
    if (temp > max) {
        max = temp
    }
}
print(max)
