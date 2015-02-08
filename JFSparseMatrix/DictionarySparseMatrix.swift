//
//  DictionarySpaseMatrix.swift
//  JFSparseMatrix
//
//  Created by John Fisher on 2/6/15.
//  Copyright (c) 2015 John Fisher. All rights reserved.
//

import Foundation

public class DictionarySparseIndex : SparseIndex, Hashable, Equatable {
    public required init(row: Int, col: Int) {
        super.init(row: row, col: col)
    }
    
    public var hashValue: Int {
        // Modified Szudzik pairing function,
        // http://stackoverflow.com/questions/919612/mapping-two-integers-to-one-in-a-unique-and-deterministic-way
        var A = row >= 0 ? 2 * row : -2 * row - 1
        var B = col >= 0 ? 2 * col : -2 * col - 1
        var C = (A >= B ? A * A + A + B : A + B * B) / 2
        return row < 0 && col < 0 || row >= 0 && col >= 0 ? C : -C - 1
    }
}


public func ==(lhs: DictionarySparseIndex, rhs: DictionarySparseIndex) -> Bool {
    return lhs.row == rhs.row && lhs.col == lhs.col
}

public class DictionarySparseMatrix<T> : SparseMatrix {
    typealias DataType = T
    
    var matrix: [DictionarySparseIndex: T] = [:]
    
    public required init() {
        matrix = [:]
    }
    
    public subscript(row: Int, column: Int) -> T? {
        get {
            return matrix[DictionarySparseIndex(row: row, col: column)]
        }
        set(data) {
            matrix[DictionarySparseIndex(row: row, col: column)] = data
        }
    }
    
    public func generate() -> DictionaryGenerator<DictionarySparseIndex, T> {
        return matrix.generate()
    }
    
    public var count: Int {
        get {
            return matrix.count
        }
    }
}