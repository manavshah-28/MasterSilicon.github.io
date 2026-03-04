class Q11;
rand int arr[];
int num;

// starting numbers are constrained to be 0 and 1
constraint c_fibbo_seeds{
 arr[0] == 0;
 arr[1] == 1;
}

// fibbo constraint for all following numbers in the array
constraint c_fibbo{
    foreach(arr[i]){
        if(i>1) arr[i] == arr[i-1] + arr[i-2];
    }
}

// random constraint to hold size of array from 10 to 25 numbers of the fibbo sequence
constraint c_arr_size{
    arr.size() inside {[10:25]};
}

// post randomize to make the num int equal to the fibbo number from arr
function void post_randomize();
num = arr[arr.size()-1];
$display("Fibbo Number = %0d", num);
endfunction
endclass