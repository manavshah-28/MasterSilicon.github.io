class Q6;
rand bit [3:0] a;

// this question needs a queue solution.
int que[$];

constraint c_not_same_as_previous_5{
    !(a inside {que});
}

constraint c_range{
    a inside {[0:5]};
}
function void post_randomize();
que.push_front(a);
if(que.size() == 6)
que.pop_back();
$display("a is %0d ", a);
endfunction
endclass