Some simple benchmark through some programming languages
The algorithm consists of getting the nth prime number

  20,000 as input (command line argument) which is 224,737

  (used the "time" command line program to measure)

    1.C (GCC) -                    1.599 secs

    1.Python (CPython + C ext) -   1.608 secs

    2.Java (HotSpot) -             1.690 secs

    3.Python (CPython + ctypes) -  1.810 secs

    4.Python (CPython + numba) -   2.226 secs

    5.JavaScript (nodejs) -        2.585 secs

    6.Go (gc) -                    5.847 secs

    7.Rust (rustc) -               9.409 secs

    8.Haskell (ghc) -             13.710 secs

    9.Ruby (CRuby) -              33.967 secs

    10.Python (CPython) -         48.206 secs

    11.Bash (GNU bash) -              + 5 min
