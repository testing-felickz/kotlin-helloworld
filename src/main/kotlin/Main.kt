fun main(args: Array<String>) {
    if (args.isEmpty()) {
        println("Please provide an input argument.")
        return
    }

    val input = args[0]
    println("Hello, World!")

    // Add intentional vulnerable code
    val command = "cmd /c dir $input"
    val process = Runtime.getRuntime().exec(command)
    process.inputStream.bufferedReader().use { it.lines().forEach { line -> println(line) } }

}