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

from DataFlow::Node src, DataFlow::Node sink
where TestCommInjFlow::flow(src, sink)
select src, "This input passes to a critical method", sink, "here"
