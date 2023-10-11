//
//  11441.swift
//  SwiftAlgorithm
//
//  Created by Hyung Seo Han on 2023/10/12.
//  link : https://www.acmicpc.net/problem/11441

import Foundation

let N = Int(readLine()!)!

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

let M = Int(readLine()!)!

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

