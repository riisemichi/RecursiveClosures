# RecursiveClosures
Library to make recursive closures easy in Swift.

## Why this Library?
Defining a recursive function in Swift is easy:

```swift
func fib(n: Int) {
    return n <= 2 ? 1 : fib(n-1) + fib(n-2)
}
 
println(fib(3)) // 8
```
But how about defining a recursive closure?

```swift
let fib : (Int) -> Int = { n in
   n <= 2 ? 1 : fib(n-1) + fib(n-2)
}
```
In Swift 3.0 this produces the following error: ```error: variable used within its own initial value```

### With RecursiveClosures you can do the following:

```swift
let fib = Recursion<Int, Int> { (n, f) in
   n <= 2 ? 1 : f(n-1) + f(n-2)
}.closure
```
## Requirements
iOS 8, Swift 3.0

## Installation
###CocoaPods
```ruby
pod 'RecursiveClosures' => git: 'https://github.com/riisemichi/RecursiveClosures.git', tag: => '0.0.1'
```
### Carthage
TODO

### Use Class
You can even simply copy the class Recursion to your Project.

## Usage
Recursion is a generic class which takes two Types. One for parameter type, one for return type. Inside the closure you will have a parameter f, which represents the function itself, that can be called recursively.


```swift
// Create Closure
let fib = Recursion<Int, Int> { (n, f) in
   n <= 2 ? 1 : f(n-1) + f(n-2)
}.closure

// Run it
fib(6)
```

Need multiple parameters or return values? Just use Tuples. Example:

```swift
// DIN-A
let a = Recursion<Int, (Int, Int)> { (i, f) -> (Int, Int) in
    if i <= 0 {
        return (1189, 841)
    }
    let (h, w) = f(i-1)
    return (w / 2, h)
}.closure

a(6)
```

###Cached Recursion
CachedRecursion optimizes your closure by caching already calculated values. Your function will only be executed for a parameter if it is not found in the cache.

Just add a .cached before the .closure.


```swift
// Create Closure
let fib = Recursion<Int, Int> { (n, f) in
   n <= 2 ? 1 : f(n-1) + f(n-2)
}.cached.closure

// Run it
fib(60) //1548008755920
```

Using the cached version will even calculate a fibonacci of 60 lightning fast.

### EmojiCode
If you like it fancy, you can use the Emoji "🌀" instead of "Recursion" (typealias).

```
let fib = 🌀<Int, Int> { (n, f) in
   n <= 2 ? 1 : f(n-1) + f(n-2)
}.cached.closure
```

## Licence
```
MIT License

Copyright (c) 2016 Michael Zurmühle

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```