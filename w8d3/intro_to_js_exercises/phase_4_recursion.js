function range(start, end) {
    if (start === end) {
        return [end]
    }
    return [start].concat(range(start + 1, end))
}

// range(1, 4)
// [1, 2, 3, 4]
// [1, 2, 3] + [4]
// [1, 2] + [3]
// [1] + [2]
// [1]

