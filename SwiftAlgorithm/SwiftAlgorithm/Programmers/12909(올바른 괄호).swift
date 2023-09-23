//
//  12909(올바른 괄호).swift
//  SwiftAlgorithm
//
//  Created by Hyung Seo Han on 2023/09/24.
// link : https://school.programmers.co.kr/learn/courses/30/lessons/12909

import Foundation
struct Stack<T> {
    private var stack: [T] = []
    
    public var count: Int {
        return stack.count
    }
    
    public var isEmpty: Bool {
        return stack.isEmpty
    }
    
    public mutating func push(_ element: T) {
        stack.append(element)
    }
    
    public mutating func pop() -> T? {
        return isEmpty ? nil : stack.popLast()
    }
}

func solution(_ s:String) -> Bool
{
    var stack = Stack<Character>()
    
    // [실행] 버튼을 누르면 출력 값을 볼 수 있습니다.
    for char in s {
        if (char == "(") {
            stack.push("(")
        }
        else if(char == ")") {
            if(stack.isEmpty) {
                return false
            }
            else {
                stack.pop()
            }
        }
    }
    if(!stack.isEmpty) {
        return false
    }
    else {
        return true
    }
}

print(solution("((()"))
