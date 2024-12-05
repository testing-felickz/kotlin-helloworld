fun main(args: Array<String>) {
    if (args.isEmpty()) {
        println("Please provide an input.")
        return
    }

    val input = args[0]

    // Define the lambda function
    val executeCommand: (String) -> Unit = { input ->
        val command = "cmd /c dir $input"
        val process = Runtime.getRuntime().exec(command)
        process.inputStream.bufferedReader().use { it.lines().forEach { line -> println(line) } }
    }

    // Invoke the lambda function
    executeCommand(input)
}