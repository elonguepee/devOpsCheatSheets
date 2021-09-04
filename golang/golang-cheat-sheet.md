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
Declaring multiple types of variables in a single line using the := operator. The := is the short variable declaration operator. This operator allows you to omit the var keyword and type when declaring and initializing a variable at the same time.

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