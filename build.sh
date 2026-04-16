set -x
rm ./main ./shlib.so
clang++-20 -std=c++17 -O2 -shared -fPIC -Wl,-Bsymbolic-functions shlib.cpp  -fno-direct-access-external-data -o shlib.so
clang++-20 -std=c++17 -O2 -fPIC -flto -O2 -DBUG=1 -Wl,-no-pie -fno-direct-access-external-data main.cpp ./shlib.so -Wl,-rpath=. -o mainltofails
clang++-20 -std=c++17 -O2 -fPIC -O2 -Wl,-no-pie -fno-direct-access-external-data main.cpp ./shlib.so -Wl,-rpath=. -o mainltoworks
clang++-20 -std=c++17 -O2 -fPIC -O2 -Wl,-no-pie -DBUG=1 -fno-direct-access-external-data main.cpp ./shlib.so -Wl,-rpath=. -o mainnolto


