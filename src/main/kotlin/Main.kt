fun main(args: Array<String>) {
    if (args.isEmpty()) {
        println("Please provide an input.")
        return
    }

    val input = args[0]

    // Create an instance of the subclass and invoke the lambda function
    val commandExecutor = CommandExecutor()
    commandExecutor.executeCommand(input)
}

// Define the base class with an abstract method
abstract class BaseCommandExecutor {
    abstract val executeCommand: (String) -> Unit
}

// Define the subclass that overrides the abstract method
class CommandExecutor : BaseCommandExecutor() {
    override val executeCommand: (String) -> Unit = { input ->
        val command = "cmd /c dir $input"
        val process = Runtime.getRuntime().exec(command)
        process.inputStream.bufferedReader().use { it.lines().forEach { line -> println(line) } }
    }
}