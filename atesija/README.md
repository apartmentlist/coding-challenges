Compile command: **g++ whats_my_name_again.cpp -o its**   
Run command: **./its**

<details>
  <summary>How it works</summary>
    
Prettying up the code into a more readable format leaves you with this:
```c++
#include <iostream>

#define Letter(A) template<typename t> struct A { static void Print(){ std::cout << #A; t::Print(); } };

struct End
{
    static void Print(){}
};

Letter(A);
Letter(N);
Letter(T);
Letter(H);
Letter(O);
Letter(Y);
Letter(E);
Letter(S);
Letter(I);
Letter(J);

int main()
{
    A<N<T<H<O<N<Y<T<E<S<I<J<A<End> > > > > > > > > > > > >::Print();
}
```

The line `#define Letter(A) template<typename t> struct A { static void Print(){ std::cout << #A; t::Print(); } };` is a c++ macro which is a way of metaprogramming. It unfolds the code before compiling it. The lines `Letter(A) ... Letter(J)` invoke that code and unfold into this:
```c++
template<typename t> 
class A : public t 
{
    public:
    static void Print()
    { 
        std::cout << 'A'; 
        t::Print(); 
    } 
};

template<typename t> 
class N : public t 
{
    public:
    static void Print()
    { 
        std::cout << 'N'; 
        t::Print(); 
    } 
};

...

template<typename t> 
class J : public t 
{
    public:
    static void Print()
    { 
        std::cout << 'J'; 
        t::Print(); 
    } 
};
```
These are classes that have a function to print the letter they are and then they print their parent's letter. `: public t ` says that this class inherits from the templated type `t` and `t::Print();` says call `Print` on the parent class. [C++ uses templates](https://en.wikipedia.org/wiki/Template_(C%2B%2B)) to work with generic types because it is a statically typed language. Usually you'd use templates to do something like this:
```c++
template <typename T>
inline T max(T a, T b) 
{
    return a > b ? a : b;
}

max<int>(3, 7);
max<float>(3.0f, 7.0f);
max<char>('a', 't');
```
The same function can be written once and then used with different types which is common in dynamically typed languages. You still have to supply the function with the type you'll be using so that it can compile correctly but you can defer that until the time you want to use the function instead of when you write it. In my case above I use the template to tell the class what it's going to inherit from which is weird and gross and exactly why I used it.

So in the end this line `A<N<T<H<O<N<Y<T<E<S<I<J<A<End> > > > > > > > > > > > >::Print();` is saying call `Print` on class `A` which inherits from class `N` which inherits from class `T` **...** which inherits from class `A` which inherits from class `End`. The print method on each of those classes will print the letter of the class and the print method on End does nothing, and the class doesn't inherit from anything, which stops the chain.
</details>
