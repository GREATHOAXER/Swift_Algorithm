//
//  42583(다리를 지나는 트럭).swift
//  SwiftAlgorithm
//
//  Created by Hyung Seo Han on 2023/10/08.
//
//  link : https://school.programmers.co.kr/learn/courses/30/lessons/42583
//  문제에서의 큐 구현 : 따로 구조체를 만들지 않고, Array를 한칸씩 늘리고, rear와 front를 += 1씩 하는 형태로 트럭의 이동을 구현함


import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var rear: Int = 0
    var front: Int = bridge_length - 1
    
    var trucks = truck_weights
    var bridge: [Int] = Array<Int>(repeating: 0, count: bridge_length)
    var remain: Int = trucks.count // 앞으로 보내야하는 트럭의 개수

    //0. 첫단추를 무조건 끼워넣기
    bridge[front] = trucks.removeFirst()
    var time: Int = 1
    var bridgeWeightCount: Int = bridge[front]
    
    while(true) {
        //1-1. 시간 늘려주기
        time += 1
        rear += 1
        front += 1
        //1-2. 현 다리에서 뒤에 0 하나 붙여서 한칸 이동시키는것처럼 보이기
        bridge.append(0)
        
        //2. 만약에 맨 앞쪽의 트럭이 이동되었다면 제거
        if(rear != 0 && bridge[rear-1] != 0) {
            bridgeWeightCount -= bridge[rear-1]
            bridge[rear-1] = -1
            remain -= 1
            //2-1. 마지막 트럭까지 지나갔을 때
            if(remain == 0) {
                break
            }
        }
        
        //3. 마지막 트럭이 운반될때는 더이상 올릴 무게가 없으니깐 트럭만 계속 이동시키기
        if(trucks.count == 0) { continue }
        
        //3-1. 그게 아니라면, 다리위의 트럭들의 무게와 앞으로 넣어야할 트럭의 무게 합산이 최대 중량보다 낮은지 확인
        else if(trucks[0] + bridgeWeightCount <= weight) {
            bridge[front] = trucks.removeFirst()
            bridgeWeightCount += bridge[front]
        }
    }
    
    return time
}

print(solution(100, 100, [10,10,10,10,10,10,10,10,10,10]))
