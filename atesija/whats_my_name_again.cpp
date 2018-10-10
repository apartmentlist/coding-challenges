#include <iostream>
#define x(A) template<typename t> struct A:t{static void p(){std::cout<<#A; t::p();}};
struct End{static void p(){}};x(A)
x(E)x(N)x(J)x(O)x(Y)
x(T)x(H)x(I)x(S)
int main(){A<N<T<H<O<N<Y<T<E<S<I<J<A<End> > > > > > > > > > > > >::p();}