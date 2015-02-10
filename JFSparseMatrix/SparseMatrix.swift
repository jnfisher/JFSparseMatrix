//
//  SparseMatrix.swift
//  JFSparseMatrix
//
//  Created by John Fisher on 2/6/15.
//  Copyright (c) 2015 John Fisher. All rights reserved.
//

import Foundation

public class SparseMatrix<T> : SequenceType {
    var matrix: [SparseIndex: T] = [:]
    
    public required init() {
        matrix = [:]
    }
    
    public subscript(row: Int, column: Int) -> T? {
        get {
            return matrix[SparseIndex(row: row, col: column)]
        }
        set(data) {
            matrix[SparseIndex(row: row, col: column)] = data
        }
    }
    
    public func generate() -> DictionaryGenerator<SparseIndex, T> {
        return matrix.generate()
    }
    
    public var count: Int {
        get {
            return matrix.count
        }
    }
}
