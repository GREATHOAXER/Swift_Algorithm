//
//  2839.swift
//  SwiftAlgorithm
//
//  Created by Hyung Seo Han on 2023/10/09.
//  link : https://www.acmicpc.net/problem/2839

import Foundation

var N: Int = Int(readLine()!)!

var count: Int = 0

while (N > 0) {
    //1. 5를 뺐는데 10 이상이면 5 빼버리기
    if (N-5 >= 10) {
        N -= 5
        count += 1
        continue
    }
    
    //2. 3을 뺐는데 8이상이면 3빼버리기
    else if (N-3 >= 8) {
        N -= 3
        count += 1
        continue
    }
    
    //3. 위의 두 상황이 아니라면, 5를 뺀 후 3 또는 5로 나뉘어 지는지 확인
    else if ((N-5 >= 0) && ((N-5) % 5 == 0 || (N-5) % 3 == 0)) {
        N -= 5
        count += 1
        continue
    }
    
    //4. 1,2,3 상황이 아니라면 3을 뺀후 3 또는 5로 나뉘어 지는지 확인
    else if ((N-3 >= 0) && ((N-3) % 5 == 0 || (N-3) % 3 == 0)) {
        N -= 3
        count += 1
        continue
    }
    
    //5. 아니면 무조건 -1
    else {
        count = -1
        break
    }
}

print(count)
