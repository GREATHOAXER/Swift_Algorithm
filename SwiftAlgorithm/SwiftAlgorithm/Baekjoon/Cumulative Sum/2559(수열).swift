//
//  2559(수열).swift
//  SwiftAlgorithm
//
//  Created by Hyung Seo Han on 2023/10/15.
//  link : https://www.acmicpc.net/problem/2559

import Foundation

let inputNumbers = readLine()!.split(separator: " ").map {
    Int(String($0))!
}

let N: Int = inputNumbers[0]
let K: Int = inputNumbers[1]

let temperatures = Array(readLine()!.split(separator: " ").map {
    Int(String($0))!
})

var sumOftemperatures = Array<Int>(repeating: 0, count: N-K+1)

var temp: Int = 0

//맨 처음의 합을 구해서 제일 높은 값으로 설정
for i in 0..<K {
    temp += temperatures[i]
}
var highestSum: Int = temp

// K번째부터 시작하여, 한칸씩 이동하면서 빼고 더하기
for i in K..<N {
    temp -= temperatures[i-K]
    temp += temperatures[i]
    // 비교후에 temp값이 높으면 값 변경
    if(temp > highestSum) {
        highestSum = temp
    }
}

print(highestSum)

