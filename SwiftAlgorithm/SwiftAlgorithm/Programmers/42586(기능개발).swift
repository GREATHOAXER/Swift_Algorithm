//
//  42586(기능개발).swift
//  SwiftAlgorithm
//
//  Created by Hyung Seo Han on 2023/10/01.
//

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var index: Int = 0
    var day: Int = 1
    var count: Int = 0
    var ans: [Int] = []
    
    while(index < progresses.count) {
        //0. 100이 넘으면 count에 += 1 및 다음 인덱스로
        if(progresses[index] + day*speeds[index] >= 100) {
            count += 1
            index += 1
            continue
        }
        //1. 100이 넘지 않은 상황, 인덱스는 지금 보는 인덱스로 계속
        //만약 count 가 0이 아니면 ans에 추가하고 day 증가
        else if(count != 0){
            ans.append(count)
            count = 0
            day += 1
        } else {
            day += 1
        }
    }
    if (count != 0) {
        ans.append(count)
    }
    return ans
}

print(solution([95, 90, 99, 99, 80, 99], [1, 1, 1, 1, 1, 1]))
