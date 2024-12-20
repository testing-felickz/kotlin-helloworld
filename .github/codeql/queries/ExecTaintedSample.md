# Command Injection into Runtime.exec() with dangerous command
Code that implements this method signature is externally callable by remote user input to an arugment of a call of `exec` that executes a scripting executable will allow the user to execute malicious code.


## Recommendation
If possible, use hard-coded string literals to specify the command or script to run, or library to load. Instead of passing the user input directly to the process or library function, examine the user input and then choose among hard-coded string literals.

If the applicable libraries or commands cannot be determined at compile time, then add code to verify that the user input string is safe before using it.


## Example
The following example shows code that takes a shell script that can be changed maliciously by a user, and passes it straight to the array going into `Runtime.exec` without examining it first.


```java
class CommandExecutor : BaseCommandExecutor() {
    override val executeCommand: (String) -> Unit = { input ->
        val command = "cmd /c dir $input"
        val process = Runtime.getRuntime().exec(command)
        process.inputStream.bufferedReader().use { it.lines().forEach { line -> println(line) } }
    }
}
```

## References
* OWASP: [Command Injection](https://www.owasp.org/index.php/Command_Injection).
* SEI CERT Oracle Coding Standard for Java: [IDS07-J. Sanitize untrusted data passed to the Runtime.exec() method](https://wiki.sei.cmu.edu/confluence/display/java/IDS07-J.+Sanitize+untrusted+data+passed+to+the+Runtime.exec()+method).
* Common Weakness Enumeration: [CWE-78](https://cwe.mitre.org/data/definitions/78.html).
