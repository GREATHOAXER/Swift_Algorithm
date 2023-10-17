//
//  25682(not solved).swift
//  SwiftAlgorithm
//
//  Created by Hyung Seo Han on 2023/10/18.
//

import Foundation

let inputNumbers = Array<Int>(readLine()!.split(separator: " ").map {
    Int(String($0))!
})

let N = inputNumbers[0]
let M = inputNumbers[1]
let K = inputNumbers[2]

var chessPlate : [[String]] = Array(repeating: Array(repeating: "N", count: M), count: N)
var answer: Int = Int.max
var counter: Int = 0

//공백없는 문자열 입력 받을 때 아래처럼 활용
for i in 0..<N {
   chessPlate[i] = Array(readLine()!.map {
       String($0)
   })
}

var pivots: [[Int]] = []


for i in 0...(N-K) {
    for j in 0...(M-K) {
        pivots.append([i,j])
    }
}

for pivot in pivots {
    let height = pivot[0]
    let width = pivot[1]
    var tempChess = chessPlate
    counter = 0
    for i in height..<height+K {
        for j in width..<width+K {
            let element =  tempChess[i][j]
//           //1. 왼쪽 보기
//            if(j - 1 >= 0) {
//                if(element == "B" && tempChess[i][j-1] == element) {
//                    counter += 1
//                    tempChess[i][j-1] = "W"
//                } else if(element == "W" && tempChess[i][j-1] == element) {
//                    counter += 1
//                    tempChess[i][j-1] = "B"
//                }
//            }
            
            //2. 오른쪽 보기
            if(j + 1 < M) {
                if(element == "B" && tempChess[i][j+1] == element) {
                    counter += 1
                    tempChess[i][j+1] = "W"
                }
                else if(element == "W" && tempChess[i][j+1] == element) {
                    counter += 1
                    tempChess[i][j+1] = "B"
                }
            }
            //3. 밑에 보기
            if(i + 1 < N) {
                if(element == "B" && tempChess[i+1][j] == element) {
                    counter += 1
                    tempChess[i+1][j] = "W"
                } else if(element == "W" && tempChess[i+1][j] == element) {
                    counter += 1
                    tempChess[i+1][j] = "B"
                }
            }
        }
    }
    if (answer > counter) {
        answer = counter
    }
}
print(answer)
