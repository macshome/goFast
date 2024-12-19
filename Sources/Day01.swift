struct Day01 {
    /// Left side numbers sorted.
    let left: [Int] =
    data
        .split(separator: "\n")
        .compactMap {
            $0.split(separator: " ").first
        }
        .compactMap { Int($0) }
        .sorted()

    /// Right side numbers sorted.
    let right: [Int] =
    data
        .split(separator: "\n")
        .compactMap {
            $0.split(separator: " ").last
        }
        .compactMap { Int($0) }
        .sorted()

    // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Int {
        zip(left, right)
            .reduce(0, { $0 + abs($1.0 - $1.1) })
    }

    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Int {
        let rightCount = right.reduce(into: [:]) { counts, num in
            counts[num, default: 0] += 1
        }

        return left.reduce(0) { total, num in
            total + num * (rightCount[num] ?? 0)
        }
    }

    func run() -> (Int, Int) {
        return (part1(), part2())
    }
}
