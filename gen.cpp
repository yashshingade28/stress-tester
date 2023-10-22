#include <bits/stdc++.h>
using namespace std;

std::mt19937_64 rng(std::random_device{}());
inline int64_t randint(int64_t l, int64_t r) {return std::uniform_int_distribution<int64_t>(l, r)(rng);}

int main() {
    cout << randint(1, 10) << " " << randint(1, 10);
}