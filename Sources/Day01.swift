struct Day01 {

    let entities: (left: [Int], right: [Int]) = {
        var left = [Int]()
        var right = [Int]()

        data.split(separator: "\n").forEach { line in
            let components = line.split(separator: " ")
            if let first = components.first, let last = components.last {
                if let leftValue = Int(first) {
                    left.append(leftValue)
                }
                if let rightValue = Int(last) {
                    right.append(rightValue)
                }
            }
        }

        return (left.sorted(), right.sorted())
    }()

    // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Int {
        zip(entities.left, entities.right)
            .reduce(0, { $0 + abs($1.0 - $1.1) })
    }

    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Int {
        let rightCount = entities.right.reduce(into: [:]) { counts, num in
            counts[num, default: 0] += 1
        }

        return entities.left.reduce(0) { total, num in
            total + num * (rightCount[num] ?? 0)
        }
    }

    func run() -> (Int, Int) {
        return (part1(), part2())
    }
}
