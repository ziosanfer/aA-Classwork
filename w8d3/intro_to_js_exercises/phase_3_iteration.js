Array.prototype.bubbleSort = function () {
    let sorted = false
    let arr = this

    while (!sorted) {
        sorted = true

        for (let i = 0; i < arr.length - 1; i++) {
            if (arr[i] > arr[i+1]) {
                let tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i+1] = tmp
                sorted = false
            }
        }
    } 
    return arr
}

// console.log([3, 5, 1, 4, 7, 10, -2].bubbleSort())

String.prototype.substrings = function () {
    let arr = []

    for (let i = 0; i < this.length; i++) {
        for (let j = i; j < this.length; j++) {
            arr.push(this.slice(i, j+1))
        }
    }

    return arr
}

