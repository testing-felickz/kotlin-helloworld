/**
 * @name Uncontrolled command line
 * @description Using externally controlled strings in a command line is vulnerable to malicious
 *              changes in the strings.
 * @kind path-problem
 * @problem.severity error
 * @security-severity 9.8
 * @precision high
 * @id java/command-line-injection-test
 * @tags security
 *       external/cwe/cwe-078
 *       external/cwe/cwe-088
 */


import semmle.code.java.dataflow.TaintTracking

// Define the dataflow configuration
module TestCommInjConfig implements DataFlow::ConfigSig
{
  // Define sources: Input parameters to methods named "handle"
   predicate isSource(DataFlow::Node source) {
    exists( Parameter p |
        
        source.asParameter() = p and p.getName() = "input"
    )
  }



  // Define sinks: Calls to "exec"
   predicate isSink(DataFlow::Node sink) {
    exists(MethodCall ma, Method m |
          ma.getMethod() = m  
        and m.getName() = ["exec"]
    )

  }
}

module TestCommInjFlow = TaintTracking::Global<TestCommInjConfig>;
import TestCommInjFlow::PathGraph

from TestCommInjFlow::PathNode src, TestCommInjFlow::PathNode sink
where TestCommInjFlow::flowPath(src, sink)
select src.getNode(), src, sink, "This command line depends on a $@.", src.getNode(),    "possible user-provided value"

//from DataFlow::Node src, DataFlow::Node sink
//where TestCommInjFlow::flow(src, sink)
//select src, "This input passes to a critical method", sink, "here"
