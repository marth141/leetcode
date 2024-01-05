public class Solution {
  public int[] TwoSum(int[] nums, int target) {
      Dictionary<int, int> numMap = new Dictionary<int, int>();
      
      for (int i = 0; i < nums.Length; i++)
      {
        int num = nums[i];
        int diff = target - num;
        
        if (numMap.ContainsKey(diff))
          return new int[] {i, (int)numMap[diff]};

        if (!numMap.ContainsKey(num))
          numMap.Add(num, i);
      }
      
      return null;
  }
}