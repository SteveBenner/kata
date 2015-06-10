// Binary search implementation

binary_search = function(arr, n, val) {
    if (n == 1) {
        return arr[0] == val;
    } else {
        mid = Math.round(n/2)
        if (val < arr[mid]) {
            return binary_search(arr.slice(0, mid - 1))
        }
    }
};