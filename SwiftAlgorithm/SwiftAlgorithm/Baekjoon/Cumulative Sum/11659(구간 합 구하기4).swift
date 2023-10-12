//
//  11659(구간 합 구하기4).swift
//  SwiftAlgorithm
//
//  Created by Hyung Seo Han on 2023/10/13.
//  link : https://www.acmicpc.net/problem/11659

import Foundation

let inputArr = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let N = inputArr[0]
let M = inputArr[1]


let array = Array(readLine()!.split(separator: " ")).map {
    Int(String($0))!
}

var cumulativeSumArray = Array<Int>(repeating: 0, count: N)
var temp = 0
//누적합 배열 구해놓기
for i in (0..<N) {
    temp += array[i]
    cumulativeSumArray[i] = temp
}

for _ in (0..<M) {
    let inputRange = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    let start = inputRange[0]
    let end = inputRange[1]
    
    if(start == 1) {
        print(cumulativeSumArray[end-1])
    } else {
        print(cumulativeSumArray[end-1] - cumulativeSumArray[start-2])
    }
}

