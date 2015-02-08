//
//  SparseMatrix.swift
//  JFSparseMatrix
//
//  Created by John Fisher on 2/6/15.
//  Copyright (c) 2015 John Fisher. All rights reserved.
//

import Foundation

public class SparseIndex {
    public let row: Int = 0
    public let col: Int = 0
    
    public required init(row: Int, col: Int) {
        self.row = row
        self.col = col
    }
    
    public var moore: [(Int, Int)] {
        get {
            return [(row-1, col  ),
                    (row-1, col+1),
                    (row  , col+1),
                    (row+1, col+1),
                    (row+1, col  ),
                    (row+1, col-1),
                    (row  , col-1),
                    (row-1, col-1)]
        }
    }
}
    
public protocol SparseMatrix : SequenceType {
    typealias DataType
    subscript(row: Int, column: Int) -> DataType? { get set }
    init()
}