
/// Action node represents a course of action.
public class ActionNode: TreeNode {
    
    /**
     Initialize new random subtree with specified maximum depth.
     
     - parameter factory:      Object used to generate subtree of this node.
     - parameter maximumDepth: Longest path between this node and a leaf node.
     
     - returns: New random subtree.
     */
    public required init(factory: RandomTreeFactory, maximumDepth: Int) {
        super.init(factory: factory, maximumDepth: maximumDepth)
    }
    
    /**
     Perform the action in evaluation context.
     
     - parameter interpreter: Current evaluation context.
     
     - warning: This method is abstract. You *must* override it in a subclass.
     */
    public func perform(interpreter: TreeInterpreter) {
        preconditionFailure("This method must be implemented in a subclass.")
    }
    
}
