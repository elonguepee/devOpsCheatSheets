# Golang Cheatsheet
## This is a cheatsheet for golang syntax, commands, and concepts

### Syntax - Basic
```go
var name type = expression
```
Single Variable declaration

```go
var var1name,var2name type
```
Declaring multiple variables of the same type

```go
stringVar1,stringVar2,NumberVar1 := "StringValue1","StringValue2", 123
```
Declaring multiple types of variables in a single line using the := operator. The := is the short variable declaration operator. This operator allows you to omit the var keyword and type when declaring and initializing a variable at the same time. Can only be used inside of a function

```go
for i := 0; i <10 ; i++ {
    sum += i
}
```
A for loop in Go. A for loop in go has 3 components that are separated by semicolons: the init statement which is run before the first iteration, the condition expression which is run before every iteration and the post statement which is run at the end of every iteration. The init and post statements are optional

```go
strings := ["String1", "String2", "String3"]
for _, stringVal :=  range strings {
    fmt.PrintLn(stringVal)
}
```
A for loop that iterates over each value in an array. The _ character is there to take the place of the index, which is unused in this case. 

```go
type <structName> struct {
    <var1Name> <var1Type>
}
```
A struct in go

```go
func example(x, y string)(string, string) {
    return y, x
}
```
An example of a function that returns multiple values. Additionally an example of the syntax for declaring multiple variables of the same type.

```go
func split(sum int) (x, y int) {
	x = sum * 4 / 9
	y = sum - x
	return
}
```
An example of naming return values in go. If they are named, they can be treated as variables.

```go
const = (
    First = 1
    Last = 10
)
```
An example declaring a group of constants

```go
if v := math.Pow(x,n); v <= lim {
    return lim
}
```
An example of using an init state for a if statement. It will run before execution of the if statement and the variable can be used within the if statement as well as any else if, else statements

### Commands/tools

```go
gofmt
```
A formatting tool for go code. Lot's of options

### Concepts

#### Exported names
A name is exported if it starts with a capital. When importing a package, you can only refer to it's exported names. Anything starting with a lower capital letter will be unexported.

