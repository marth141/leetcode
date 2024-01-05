/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
var twoSum = function (nums, target) {
    let numMap = {};
    let returnable = [];
    nums.forEach((num, i) => {
        const complement = target - num
        if (numMap[complement] !== undefined) { returnable = [numMap[complement], i] }
        numMap[nums[i]] = i
    })
    return returnable
};