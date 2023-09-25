//
//  42748(K번째수).swift
//  SwiftAlgorithm
//
//  Created by Hyung Seo Han on 2023/09/26.
//  알고리즘 종류 : 정렬
//  link : https://school.programmers.co.kr/learn/courses/30/lessons/42748
import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var ans: [Int] = []
    for command in commands {
        let arr = array[command[0]-1...command[1]-1].sorted()
        ans.append(arr[command[2]-1])
    }
    return ans
}

print(solution([1, 5, 2, 6, 3, 7, 4],[[2, 5, 3], [4, 4, 1], [1, 7, 3]]))
