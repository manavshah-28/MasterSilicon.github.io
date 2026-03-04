class Q10;
rand int unsigned arr[];
int unsigned palindrome;

// confine the number of digits in the palindrome number
constraint c_size{
    arr.size() inside {[1:10]};
}
// confine every element of arr to be 0 to 9. make them a digit
constraint c_digits_range{
    foreach(arr[i]) arr[i] inside {[0:9]};
}

// make sure the most significant digit of the palindrome is not a zero 
constraint c_significant{
        arr[arr.size()-1]!= 0;
}

// actual palindrome constraint on arr
constraint c_palindrome{
    foreach(arr[i]){
        if(i<arr.size()/2) arr[i] == arr[arr.size()-1-i];
    }
}
function void post_randomize();
palindrome = 0;
foreach(arr[i]) palindrome = palindrome*10 + arr[i];
endfunction
endclass