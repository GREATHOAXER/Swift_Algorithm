//
//  42587(프로세스).swift
//  SwiftAlgorithm
//
//  Created by Hyung Seo Han on 2023/10/08.
//  link : https://school.programmers.co.kr/learn/courses/30/lessons/42587

import Foundation

struct Queue {
    private var queue: [Int] = []
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public mutating func enqueue(_ element: Int) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> Int? {
        return isEmpty ? nil : queue.remove(at:0)
    }
    
    public func maximum() -> Int? {
        if(!self.isEmpty) {
            return queue.max()
        } else {
            return nil
        }
    }
}

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var tempQueue = Queue()
    
    for priority in priorities {
        tempQueue.enqueue(priority)
    }
    
    var cnt = 0
    var loc = location
    while (!tempQueue.isEmpty) {
        let tempElement = tempQueue.dequeue()!
        
        //1.확실한 상황(혼자 남았을 때)
        if(tempQueue.isEmpty) {
            cnt += 1
            break
        }
        //2. 큰 priority가 존재할 때
        else if(tempQueue.maximum()! > tempElement) {
            tempQueue.enqueue(tempElement)
            
            //2-1. 만약에 loc이 0이면 다시 맨뒤로 넘기기
            if (loc == 0) {
                loc = tempQueue.count - 1
            }
            //2-2. 아니면 loc - 1
            else {
                loc -= 1
            }
            continue
        }
        //3. 위의 두 상황이 아니면?
        else {
            cnt += 1
            //3-1. 만약에 loc이 0이면 종료
            if (loc == 0) {
                break
            }
            //3-2. 아니면 loc - 1
            else {
                loc -= 1
            }
        }
    }
    return cnt
}

print(solution([1,1,9,1,1,1], 0))

