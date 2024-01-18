class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        if not strs:
            return ""
        shortest_str = min(strs,key=len)
        for i, char in enumerate(shortest_str):
            for other_word in strs:
                if other_word[i] != char:
                    return shortest_str[:i]
        return shortest_str

# Personal Notes
# enumerate() is a fantastic function for enumerating things.