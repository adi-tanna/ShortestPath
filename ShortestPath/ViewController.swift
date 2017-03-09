//
//  ViewController.swift
//  ShortestPath
//
//  Created by Aditya Tanna on 3/9/17.
//  Copyright © 2017 Tanna Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let rows: Int = 5
    let cols: Int = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var matrix = Array(repeating: Array(repeating: 0, count: cols), count: rows)
        
        matrix[0][0] = 3
        matrix[0][1] = 4
        matrix[0][2] = 1
        matrix[0][3] = 2
        matrix[0][4] = 8
        matrix[0][5] = 6
      
        
        matrix[1][0] = 6
        matrix[1][1] = 1
        matrix[1][2] = 8
        matrix[1][3] = 2
        matrix[1][4] = 7
        matrix[1][5] = 4
      
        
        matrix[2][0] = 5
        matrix[2][1] = 9
        matrix[2][2] = 3
        matrix[2][3] = 9
        matrix[2][4] = 9
        matrix[2][5] = 5
       
        
        matrix[3][0] = 8
        matrix[3][1] = 4
        matrix[3][2] = 1
        matrix[3][3] = 3
        matrix[3][4] = 2
        matrix[3][5] = 6

        
        matrix[4][0] = 3
        matrix[4][1] = 7
        matrix[4][2] = 2
        matrix[4][3] = 8
        matrix[4][4] = 6
        matrix[4][5] = 4
        
        print(matrix)
        
        let cost = minCost(cost: matrix, m: 4, n: 5)
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
        var tc:[[Int]] = Array(repeating: Array(repeating: 0, count: cols), count: rows)
        
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
