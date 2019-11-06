import UIKit

func mergeSort<T>(arr: [T], by isSorted: (T, T) -> Bool) -> [T] {
    print("runnig merge sort on \(arr)")
    guard arr.count > 1 else { return arr }
    let leftSide = Array(arr[0..<(arr.count/2)])
    let rightSide = Array(arr[(arr.count/2)...])
    let sortedLeftSide = mergeSort(arr: leftSide, by: isSorted)
    let sortedRightSide = mergeSort(arr: rightSide, by: isSorted)
    let mergedArr = merge(sortedArrOne: sortedLeftSide, sortedArrTwo: sortedRightSide, by: isSorted)
    
    return mergedArr
}

func merge<T>(sortedArrOne: [T], sortedArrTwo: [T], by isSorted: (T, T) -> Bool) -> [T] {
    var arrOneIndex = 0
    var arrTwoIndex = 0
    var mergedSortedArr = [T]()
    
    while arrOneIndex < sortedArrOne.count && arrTwoIndex < sortedArrTwo.count {
        if isSorted(sortedArrOne[arrOneIndex], sortedArrTwo[arrTwoIndex]) {
            mergedSortedArr.append(sortedArrOne[arrOneIndex])
            arrOneIndex += 1
        } else {
            mergedSortedArr.append(sortedArrTwo[arrTwoIndex])
            arrTwoIndex += 1
        }
    }
    return mergedSortedArr + Array(sortedArrOne[arrOneIndex...]) + Array(sortedArrTwo[arrTwoIndex...])
}

var testArr = (0...20).map { _ in Int.random(in: 0...200)}.sorted()

let mergedArr = mergeSort(arr: testArr, by: <)
print(mergedArr)
