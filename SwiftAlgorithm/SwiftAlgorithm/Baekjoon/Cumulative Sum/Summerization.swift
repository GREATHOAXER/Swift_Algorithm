//
//  Summerization.swift
//  SwiftAlgorithm
//
//  Created by Hyung Seo Han on 2023/10/25.
//

/*
 - 2차원 배열에서의 누적합은, 가령 M*N 짜리 인풋이 들어올 때 M+1 * N+1 짜리 배열을 만들고
 - 누적합을 구할 때 범위를 1...M / 1...N 형태로 interation 돌릴 때 좋음
 var cumulativeSum: [[Int]] = Array(repeating: Array(repeating: 0, count: C+1), count: R+1)
 - 이런식으로 C*R 짜리 사각형이 주어진다면 실상은 [0] 번째 줄과 모든줄의 [0]번째 항은 0이기 때문에
 - 1...M / 1...N 으로 해도 무방하다.
 */
