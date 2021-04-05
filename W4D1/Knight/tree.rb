class PolyTreeNode

    def next_step
        child = PolyTreeNode.new(children.sample)
    end

    attr_reader :parent, :children, :value

    def initialize(new_node, parent = nil)
        # @grid 
        @parent = nil 
        @children = []
        @value = new_node
        # @passed = true
        @child = nil
    end

    # def board
    #     @grid ||= Array.new(8) {Array.new}
    # end
    def parent=(parent_node)
        if @parent == nil
            @parent = parent_node
            parent_node.children << self
        elsif parent_node == nil
            @parent.children.delete(self)
            @parent = nil
        else 
            @parent.children.delete(self)
            @parent = parent_node
            parent_node.children << self
        end
    end

    def add_child(node)
        node.parent = self
    end

    def parent=(parent_node)
        if @parent == nil
            @parent = parent_node
            parent_node.children << self
        elsif parent_node == nil
            @parent.children.delete(self)
            @parent = nil
        else 
            @parent.children.delete(self)
            @parent = parent_node
            parent_node.children << self
        end
    end

    def bfs(target)
        arr = [self]
        until arr.empty?
            if arr[0].value != target
                if !arr[0].children.empty?
                    arr += arr[0].children
                    arr.shift
                else
                    arr.shift
                end
            else
                return arr[0]
            end
        end
    end

end
