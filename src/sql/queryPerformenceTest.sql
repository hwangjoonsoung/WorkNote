SELECT @@profiling;
SET profiling=0;
show PROFILEs;

    -- profiling을 1로 두면 query가 실행될때마다 duration time check
    -- profiling을 1로 두고 query를 실행한 후 show profiles를 하면 얼마나 걸렸는지 확인 가능하다.
