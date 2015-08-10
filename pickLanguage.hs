#!/usr/bin/env runghc

import System.Random

languages = [ "Haskell"
            , "Python"
            , "Java"
            , "Obejctive-C"
            , "Swift"
            , "C"
            , "C++"
            , "PHP"
            , "JS"
            , "Assembly"
            , "Bash"
            , "OCaml"
            , "Erlang"
            , "Fortran"
            , "Go"
            , "Julia"
            , "CommonLisp"
            , "Lua"
            , "MATLAB"
            , "ML"
            , "Perl"
            , "R"
            , "Racket"
            , "Ruby"
            , "Rust"
            , "SmallTalk"
            ]

main = do 
  index <- getStdRandom (randomR (0, length languages - 1))
  print $ languages !! index