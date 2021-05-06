Array.prototype.myEach = function(callback) {

    for (let i = 0; i < this.length; i++) {
        callback(this[i]);
    }
}

function addOne(num) {
    return num + 1;
}


// console.log([1, 2, 3, 4, 5].myEach(addOne))


Array.prototype.myMap = function(callback) {
    let newArr = []

    // newArr.push((this.myEach(callback)))

    this.myEach(function(ele) {
        newArr.push(callback(ele))
    })
    return newArr


}


Array.prototype.myReduce = function(callback, initialValue) {
    let finalResult = initialValue;
    let arr = this;

    if (initialValue === undefined){
        finalResult = this[0];
        arr = arr.slice(1);
    }


    arr.myEach(function(ele) { 

        finalResult = callback(finalResult, ele);

    })

    return finalResult
}

