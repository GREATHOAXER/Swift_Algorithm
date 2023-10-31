//
//  17427(약수의 합2).swift
//  SwiftAlgorithm
//
//  Created by Hyung Seo Han on 2023/11/01.
//  link : https://www.acmicpc.net/problem/17427
/*
약수 문제
 - 표를 그려보고 공통 분모가 무엇인지 파악
 - 1..8 까지 약수가 무엇이 있는지 확인했을 때, 발견되는 규칙이 있음.
 - 규칙 : g(8)일 경우, f(1) ... f(8)까지인데, 이때 8을 1부터 8까지 각각 나눈 몫이 해당 범위 내에 존재하는 나눈 수의 개수를 의미함.
 
*/

import Foundation

let input: Int = Int(readLine()!)!
var ans: Int = 0

for number in 1...input {
    ans += Int(input/number) * number
}

print(ans)
