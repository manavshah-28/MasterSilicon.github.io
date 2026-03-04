class Q3;
    rand int val;

    constraint c_range {
        val dist {[0:100] :/ 70, [101:255] :/ 30};                // dist :/
    }

    function void post_randomize();
        $write("%0d ", val);
    endfunction
endclass