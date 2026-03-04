class Q16; // every hex number is 4 bits. from 0 to e
rand int arr[];
bit [31:0] palindrome;

// constraint size of hex number
constraint c_size{
    arr.size() inside {[1 : 10]};
}

// make sure the msb is not zero
constraint c_msb_non_zero{
    arr[arr.size()-1] != 0;
}
// make sure every element in array is representing a 4 bit hex number
constraint c_hex_digits{
    foreach(arr[i]){
        arr[i] inside {[0:15]};
    }
}

// actual palindrome constraint
constraint c_palindrome {
    foreach(arr[i]){
        if(i < arr.size()/2){
            arr[i] == arr[arr.size()-1-i];
        }
    }
}

// assemble the palindrome
function void post_randomize();
for(int i = 0; i <9; i ++)begin
palindrome[4*i +: 4] = arr[i]; // imprtant point 4*i otherwise you end up overwriting elements
end
$display("%0h ", palindrome);
endfunction
endclass