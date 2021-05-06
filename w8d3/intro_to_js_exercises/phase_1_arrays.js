Array.prototype.uniq = function () {
    let uniqueArray = []
    for (let i = 0; i < this.length; i++) {
        if (!uniqueArray.includes(this[i])) {
            uniqueArray.push(this[i])
        }
    }
    return uniqueArray
}

Array.prototype.twoSum = function () {
    let positionsArray = []
    for (let i = 0; i < this.length; i++) {
        for (let j = i+1; j < this.length; j++) {
            if (this[i] + this[j] === 0) {
                positionsArray.push([i, j])
            }
        }
    }
    return positionsArray
}

// console.log([1, 5, -1, 3, 6, -5].twoSum())

Array.prototype.transpose = function () {
    let arr = []
    for (let i = 0; i < this[0].length; i++) {
        let subArr = []
        for (let j = 0; j < this.length; j++) {
            subArr.push(this[i][j])
        }
        arr.push(subArr)
    }
    return arr
}


// [  
//  //  0  1  2  3   = length of the subArr
//     [1, 2, 3, 4] // 0    
//     [5, 6, 7, 8] // 1 
//                 // this.length length of Array
// ]

// [  
//   // 0  1
//     [1, 5] // 0
//     [2, 6] // 1
//     [3, 7] // 2
//     [4, 8] // 3
// ]