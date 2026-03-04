class Q13;
rand bit [31:0] a;
bit [2:0] pattern = 3'b110;
rand int position[3];

// randomize postions array to pick three places where the pattern must occur
constraint c_position{
    foreach(position[i]){
        foreach(position[j]){
            if(i!=j){
                unsigned'(position[i] - position[j]) >= 'd3;
            }
        }
    }
}

// constraint to make sure positions are unique
constraint c_unique_positions{
    unique{position};
}

constraint c_position_range{
    foreach(position[i]){
        position[i] inside {[0:29]};
    }
}
// iterate through the rand bit a and assign pattern on positions
constraint c_pattern_insertion{
    foreach(a[i]){
        if(i<29){
        if(i inside {position}) {
            a[i +: 3] == pattern;
        }
        else a[i +: 3] != pattern;
        }
    }
}

function void post_randomize();
$display("%0b ", a);
endfunction

endclass