struct Day01 {

    // Replace this with your solution for the first part of the day's challenge.
    func part1(_ entities: ([Int],[Int])) -> Int {
        zip(entities.0, entities.1)
            .reduce(0, { $0 + abs($1.0 - $1.1) })
    }

    // Replace this with your solution for the second part of the day's challenge.
    func part2(_ entities: ([Int],[Int])) -> Int {
        let rightCount = entities.0.reduce(into: [:]) { counts, num in
            counts[num, default: 0] += 1
        }

        return entities.1.reduce(0) { total, num in
            total + num * (rightCount[num] ?? 0)
        }
    }

    func run(puzzle: String) -> (Int, Int) {
        let entities = {
            var left = [Int]()
            var right = [Int]()

            // split is twice as fast as enumerateLines on my machine
            // puzzle.enumerateLines { line, stop in
            for line in puzzle.split(separator: "\n") {
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
        return (part1(entities), part2(entities))
    }
}
