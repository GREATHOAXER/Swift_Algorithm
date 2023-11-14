//
//  2851(슈퍼 마리오).swift
//  SwiftAlgorithm
//
//  Created by Hyung Seo Han on 2023/11/03.
//  link : https://www.acmicpc.net/problem/2851

import Foundation

var input = Array<Int>(repeating: 0, count: 10)
for i in 0..<10 {
    input[i] = Int(readLine()!)!
}

var ans: Int = 0
var temp: Int = 0
for i in 0..<10 {
    temp += input[i]
    if (temp == 100) {
        ans = 100
        break
    }
    else {
        if (temp <= 100 && temp > ans) {
            ans = temp
        }
        else if (abs(temp-100) <= abs(ans-100)) {
            ans = temp
            break
        }
        
    }
}
print(ans)
