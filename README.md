## SwiftWyhashBenchmarkBenchmark

Testing the performance of wyhash in Swift.


```
swift build  -Xcc -march=native  --configuration release
$(swift build   --configuration release --show-bin-path)/SwiftWyhashBenchmark
```
Example:

```
testRawGeneratorPerformance  4.0  ns per value
testBoundedGeneratorPerformance  13.2  ns per value
testNumberSequenceBoundedPerformance  16.7  ns per value
```
