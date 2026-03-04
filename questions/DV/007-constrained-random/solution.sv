class Q7;
localparam int WIDTH = 3;
localparam int MAX_VALUES = (1 << WIDTH);
rand bit [WIDTH - 1 :0] a;

// create a que
int que[$];

// constraint to make sure that value is not already part of queue
constraint c_new{
    !(a inside {que});
}

function void post_randomize();
que.push_front(a);
if(que.size() == MAX_VALUES) que.pop_back();
$display("%0d ", a);
endfunction
endclass