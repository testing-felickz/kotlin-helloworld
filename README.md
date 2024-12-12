# Hello World Kotlin Project

This is a simple Kotlin project that prints "Hello, World!" to the console.


```
helloworld> kotlinc src\main\kotlin\Main.kt -include-runtime -d dist\hello.jar
helloworld> java -jar dist\hello.jar
```

## Finds a sample vulnerable flow from a parameter in our known vulnerable input method  (note: not using remote flow input style query)

Using a custom query [Sample.ql](./.github/codeql/queries/Sample.ql)

![image](https://github.com/user-attachments/assets/9d8ccec9-a5fa-4d76-b552-951eb9536eb0)

![image](https://github.com/user-attachments/assets/3c59d3f9-d6d6-4528-971c-776213f21541)
