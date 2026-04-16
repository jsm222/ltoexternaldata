set -x
rm ./main ./shlib.so ./mainltofails ./mainltoworks ./mainnolto
set -e
/usr/local/llvm20/bin/clang++ -std=c++17 -O2 -shared -fPIC -Wl,-Bsymbolic-functions shlib.cpp  -fno-direct-access-external-data -o shlib.so
/usr/local/llvm20/bin/clang++ -std=c++17 -O2 -fPIC -flto -O2 -DBUG=1 -fno-direct-access-external-data main.cpp ./shlib.so -Wl,-rpath=. -o mainltofails
/usr/local/llvm20/bin/clang++ -std=c++17 -O2 -fPIC -flto -O2 -fno-direct-access-external-data main.cpp ./shlib.so -Wl,-rpath=. -o mainltoworks
/usr/local/llvm20/bin/clang++ -std=c++17 -O2 -fPIC -O2 -DBUG=1 -fno-direct-access-external-data main.cpp ./shlib.so -Wl,-rpath=. -o mainnolto


