function twoSum(nums: number[], target: number): number[] {
    let numMap = {};
    let returnable = [];
    nums.forEach((num, i) => {
        const complement = target - num
        if (numMap[complement] !== undefined) { returnable = [numMap[complement], i] }
        numMap[nums[i]] = i
    })
    return returnable
};