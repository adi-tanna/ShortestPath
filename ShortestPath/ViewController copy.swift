//
//  ViewController.swift
//  ShortestPath
//
//  Created by Aditya Tanna on 3/9/17.
//  Copyright © 2017 Tanna Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var matrix: [[Int]] = [[Int]]()
        
        var co1Rows: [Int] = [Int]()
        
        co1Rows.append(3)
        co1Rows.append(6)
        co1Rows.append(5)
        co1Rows.append(8)
        co1Rows.append(3)
        
        matrix.append(co1Rows)
        
        
        var co2Rows: [Int] = [Int]()
        
        co2Rows.append(4)
        co2Rows.append(1)
        co2Rows.append(9)
        co2Rows.append(4)
        co2Rows.append(7)
        
        matrix.append(co2Rows)

        
        var co3Rows: [Int] = [Int]()
        
        co3Rows.append(1)
        co3Rows.append(8)
        co3Rows.append(3)
        co3Rows.append(1)
        co3Rows.append(2)
        
        matrix.append(co3Rows)
      
        
        var co4Rows: [Int] = [Int]()
        
        co4Rows.append(2)
        co4Rows.append(2)
        co4Rows.append(9)
        co4Rows.append(3)
        co4Rows.append(8)
        
        matrix.append(co4Rows)
        
       
        
        var co5Rows: [Int] = [Int]()
        
        co5Rows.append(8)
        co5Rows.append(7)
        co5Rows.append(9)
        co5Rows.append(2)
        co5Rows.append(6)
        
        matrix.append(co5Rows)
        
        
        var co6Rows: [Int] = [Int]()
        
        co6Rows.append(6)
        co6Rows.append(4)
        co6Rows.append(5)
        co6Rows.append(6)
        co6Rows.append(4)
        
        matrix.append(co6Rows)

        print(matrix)
        
        let cost = minCost(cost: matrix, m: 5, n: 3)
        print(cost)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func min(x: Int, y: Int, z: Int) -> Int {
        if x < y {
            return (x < z) ? x : z
        } else {
            return (y < z) ? y : z
        }
    }
 
    func minCost(cost : [[Int]], m: Int, n: Int) -> Int {
        var tc:[[Int]] = [[Int]]()
        
        
        
        tc[0][0] = cost[0][0]
        
        for i in 1...m {
            tc[i][0] = tc[i-1][0] + cost[i][0]
        }
        
        for j in 1...n {
            tc[0][j] = tc[0][j-1] + cost[0][j]
        }
        
        for i in 1...m {
            for j in 1...n {
                tc[i][j] = min(x: tc[i-1][j-1], y: tc[i-1][j], z: tc[i][j-1]) + cost[i][j]
            }
        }
        
        return tc[m][n]
    }
}

