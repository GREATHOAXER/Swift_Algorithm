//
//  17425(약수의 합).swift
//  SwiftAlgorithm
//
//  Created by Hyung Seo Han on 2023/11/01.
//  link : https://www.acmicpc.net/problem/17425
/*
 약수 문제
 - 에라토스테네스의 체를 활용하여
 - g(n)의 값을 먼저 구해버린다.
 - 에라토스테네스의 채가 소수를 판별하기 위해서인데, 어떤 수를 가리킬 때 0이 아니면, 그 수는 소수이며, 가리킨 수의 배수를 전부 0으로 만들고
 - 0일때는 소수가 아니기 때문에 넘어가는 형태
 - 즉, 8의 경우, 1,2,4,8 이므로, 1을 가리킬때 +=1, 2를 가리킬때 += 2, 4를 가리킬때 += 4, 8을 가리킬 때 += 8 식으로 한 다음, 가리킨 수의 배수의 합에
 - 가리킨 수를 더하는 형태로 누적합을 구한다.
*/

import Foundation
let maximum: Int = 1000000
var gcdSumArray: [Int] = Array<Int>(repeating: 1, count: maximum+1) // 0번째 인덱스를 피하기 위해서
var cumulativeSum: [Int] = Array<Int>(repeating: 0, count: maximum+1)
let T: Int = Int(readLine()!)!

gcdSumArray[0] = 0

// 에라토스테네스의 채를 활용하여 i(가리키는 수)의 배수에 i를 더하는 형태로 각 수의 약수의 합을 구함
// 왜냐면, N = AB 일때니깐 즉, i의 배수는 i를 무조건적으로 약수로 가지고 있기 때문에
for i in (2...maximum) {
    var j = 1
    while ( (i * j) <= maximum) {
        gcdSumArray[j*i] += i
        j += 1
    }
}

//누적합 구하기
for i in (1...maximum) {
    cumulativeSum[i] = cumulativeSum[i-1] + gcdSumArray[i]
}

for _ in 0..<T {
    let input = Int(readLine()!)!
    print(cumulativeSum[input])
}


