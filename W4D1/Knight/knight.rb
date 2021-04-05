require_relative 'tree.rb'
require "byebug"
class KnightPathFinder

    def self.root_node(pos)
        PolyTreeNode.new(pos)
    end

    def self.valid_moves(pos)
        row, col = pos
        (0..7).to_a.include?(row) && (0..7).to_a.include?(col)
    end
    attr_reader :tree, :consider_position, :start_pos
    def initialize(start_pos)
        @start_pos = KnightPathFinder.root_node(start_pos)
        @consider_position = [@start_pos.value]
        @tree = build_move_tree(@start_pos)
    end

    def build_move_tree(orig_node)
        path_tree = [orig_node]
        until path_tree.empty? 
            curr_node = path_tree.shift
            new_move_position(curr_node.value).each do |node|
                curr_node.add_child(node)
                path_tree << node
            end
        end
    end

    def find_path(end_pos)
        end_node = @start_pos.bfs(end_pos) 
        trace_back_path(end_node)
    end

    def trace_back_path(node)
        way = [node.value]
        curr_node = node
        until way[0] == @start_pos.value
            way.unshift(curr_node.parent.value)
            curr_node = curr_node.parent
        end
        way
    end


    
    def new_move_position(pos)
        arr = []
        row = pos[0]
        col = pos[1]
        arr << PolyTreeNode.new([row-2,col+1]) if KnightPathFinder.valid_moves([row-2,col+1]) && !@consider_position.include?([row-2,col+1])
        arr << PolyTreeNode.new([row+2,col+1]) if KnightPathFinder.valid_moves([row+2,col+1]) && !@consider_position.include?([row+2,col+1])
        arr << PolyTreeNode.new([row-2,col-1]) if KnightPathFinder.valid_moves([row-2,col-1]) && !@consider_position.include?([row-2,col-1])
        arr << PolyTreeNode.new([row+2,col-1]) if KnightPathFinder.valid_moves([row+2,col-1]) && !@consider_position.include?([row+2,col-1])
        arr << PolyTreeNode.new([row-1,col+2]) if KnightPathFinder.valid_moves([row-1,col+2]) && !@consider_position.include?([row-1,col+2])
        arr << PolyTreeNode.new([row-1,col-2]) if KnightPathFinder.valid_moves([row-1,col-2]) && !@consider_position.include?([row-1,col-2])
        arr << PolyTreeNode.new([row+1,col+2]) if KnightPathFinder.valid_moves([row+1,col+2]) && !@consider_position.include?([row+1,col+2])
        arr << PolyTreeNode.new([row+1,col-2]) if KnightPathFinder.valid_moves([row+1,col-2]) && !@consider_position.include?([row+1,col-2])
        arr.each {|ele| @consider_position << ele.value}
        return arr
    end

end



kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]