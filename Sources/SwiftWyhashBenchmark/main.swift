import SwiftWyhash
import Swimsuit
import Foundation


protocol Formattable {
    func format(pattern: String) -> String
}
extension Formattable where Self: CVarArg {
    func format(pattern: String) -> String {
        return String(format: pattern, arguments: [self])
    }
}
extension Int: Formattable { }
extension Double: Formattable { }
extension Float: Formattable { }



func testRawGeneratorPerformance() {
        var g = WyRand(seed: 42)
        var a = Array(repeating: UInt64(0), count: 524288)
        let nano = Swimsuit.nanotime {
             for i in a.indices {
                 a[i] = g.next()
             }
        }
        let r = Double(nano)  / 524288
        print("testRawGeneratorPerformance ", r.format(pattern: "%.1f") , " ns per value")
}

func testBoundedGeneratorPerformance() {
        var g = WyRand(seed: 42)
        var a = Array(repeating: UInt64(0), count: 524288)
        let b = UInt64.max / 2 + 1
        let nano = Swimsuit.nanotime {
             for i in a.indices {
                 a[i] = g.next(upperBound: b)
             }
        }
        let r = Double(nano)  / 524288
        print("testBoundedGeneratorPerformance ", r.format(pattern: "%.1f"), " ns per value")
}

func testNumberSequenceBoundedPerformance() {
        let numbers = sequence(state: WyRand(seed: 42)) {
           Int.random(in: Int.min...(Int.max / 2 + 1), using: &$0)
        }
        let nano = Swimsuit.nanotime {
           _ = Array(numbers.lazy.prefix(524288))
        }
        let r = Double(nano)  / 524288
        print("testNumberSequenceBoundedPerformance ", r.format(pattern: "%.1f"), " ns per value")
}


testRawGeneratorPerformance()
testBoundedGeneratorPerformance()
testNumberSequenceBoundedPerformance()