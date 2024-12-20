import Foundation

let puzzle_1 = data
let day01 = Day01()

testPerformance()

func testPerformance() {
    var runtimeAvg = Double(0)
    let runs = 1_000
    for run in 0..<runs {
        let start = Date()
        // make sure the puzzle is parsed on each iteration:
        let (d10, d11) = day01.run(puzzle: puzzle_1)
        let elapsed = Date().timeIntervalSince(start)
        runtimeAvg += Double(elapsed)
        print(String(format: "run[%d / %d]: Day 1 - result 1: %d, result 2: %d - elapsed: %.3f ms", run, runs, d10, d11, elapsed * 1000))
    }
    print(String(format: "Elapsed on average: %.4f ms", runtimeAvg / Double(runs) * 1000))
}
