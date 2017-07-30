
#if os(Linux)
    import Glibc
#else
    import Darwin.C
#endif

/// Pseudorandom generator based on the standard arc4random() function.
open class ArcGenerator: EntropyGenerator {
    fileprivate static let maxDouble = Double(UINT32_MAX)
    
    public init() { }
    
    open func next() -> Double {
        #if os(Linux)
            let rnd = random()
        #else
            let rnd = arc4random()
        #endif
        return Double(rnd) / ArcGenerator.maxDouble
    }
}
