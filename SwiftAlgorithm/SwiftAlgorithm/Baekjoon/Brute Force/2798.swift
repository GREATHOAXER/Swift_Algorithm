//
//  2798.swift
//  SwiftAlgorithm
//
//  Created by Hyung Seo Han on 2023/10/09.
//  link : https://www.acmicpc.net/problem/2798
//

import Foundation

let input = readLine()?.split(separator: " ").map {
    Int(String($0))!
}

//N: # of cards, M: # of dealer calls
let N: Int = input![0]
let M: Int = input![1]

//cards : 펼처진 카드
let cards = Array(readLine()!.split(separator: " ")).map {
    Int(String($0))!
}

var i: Int = 0
var j: Int = 0
var k: Int = 0

var firstCard: Int = 0
var secondCard: Int = 0
var thirdCard: Int = 0
var result: Int = 0

for i in (0..<cards.count - 2) {
   firstCard = cards[i]
    
    for j in (i+1..<cards.count - 1) {
        secondCard = cards[j]
        
        for k in (j+1..<cards.count) {
            thirdCard = cards[k]
            
            //딜러가 외친 값보다 카드의 합이 작고, 현재 최대값보다 클 경우
            if ((firstCard + secondCard + thirdCard) <= M && (firstCard + secondCard + thirdCard) >= result) {
                result = (firstCard + secondCard + thirdCard)
                continue
            }
            
            //초깃값이 0 일때
            else if (result == 0 && (firstCard + secondCard + thirdCard <= M)) {
                result = (firstCard + secondCard + thirdCard)
                continue
            }
        }
    }
}

print(result)
