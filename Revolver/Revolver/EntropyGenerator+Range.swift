extension EntropyGenerator {
    /**
     Generates a pseudorandom floating-point value with double precision in specified range.
     
     - parameter min: Minimum value (inclusive).
     - parameter max: Maximum value (inclusive).
     
     - returns: A new pseudorandom value.
     */
    public func nextInRange(min min: Double, max: Double) -> Double {
        if abs(max - min) < REVOLVER_EPSILON { return max }
        precondition(max > min, "The range is not valid.")
        return min + self.next() * (max - min)
    }
    
    /**
     Generates a pseudorandom floating-point value in specified range.
     
     - parameter min: Minimum value (inclusive).
     - parameter max: Maximum value (inclusive).
     
     - returns: A new pseudorandom value.
     */
    public func nextInRange(min min: Float, max: Float) -> Float {
        if abs(max - min) < Float(REVOLVER_EPSILON) { return max }
        precondition(max > min, "The range is not valid.")
        return min + Float(self.next()) * (max - min)
    }
    
    /**
     Generates a pseudorandom integer in specified range.
     
     - parameter min: Minimum value (inclusive).
     - parameter max: Maximum value (inclusive).
     
     - returns: A new pseudorandom value.
     */
    public func nextInRange(min min: Int, max: Int) -> Int {
        if max == min { return max }
        precondition(max > min, "The range is not valid.")
        return min + Int(self.next() * Double(max - min + 1))
    }
    
    /**
     Generates a pseudorandom floating-point value with double precision in specified range.
     
     - parameter range: Range bounding the generated value inclusively.
     
     - returns: A new pseudorandom value.
     */
    public func nextInRange(range: Range<Int>) -> Double {
        return nextInRange(min: Double(range.startIndex), max: Double(range.endIndex - 1))
    }
    
    /**
     Generates a pseudorandom floating-point value in specified range.
     
     - parameter range: Range bounding the generated value inclusively.
     
     - returns: A new pseudorandom value.
     */
    public func nextInRange(range: Range<Int>) -> Float {
        return nextInRange(min: Float(range.startIndex), max: Float(range.endIndex - 1))
    }
    
    /**
     Generates a pseudorandom integer in specified range.
     
     - parameter range: Range bounding the generated value inclusively.
     
     - returns: A new pseudorandom value.
     */
    public func nextInRange(range: Range<Int>) -> Int {
        return nextInRange(min: range.startIndex, max: range.endIndex - 1)
    }
}
