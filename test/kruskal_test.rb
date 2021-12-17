require 'minitest/autorun'
require './test/test_helper'
require './lib/visual_graphs/kruskal'

class KruskalTest < Minitest::Test
  def setup
    @filepath = 'test/resources/test_mst_kruskal.json.json'
  end
  git status
  def test_kruskal_1
    graph =  WeightedGraph.load_from_json(@filepath)
    hash_graph = {1 => [[2, 13],[4,17],[5,14]],
                  2 => [[1, 13]],
                  3 => [[4,3]],
                  4 => [[1,17],[3,3],[6,19]],
                  5 => [[1,14]],
                  6 => [[4,19]]
        }
    assert_equal hash_graph, graph.kruskal.adjacency_list, "find set do not work"
    puts "success!"
  end
  def test_kruskal_2
    graph =  WeightedGraph.new
    graph.adjacency_list_init({   1 => [[2, 4],[3,2]],
                 2 => [[1, 4],[3, 4]],
                 3 => [[1, 2],[2,4],[4,3],[5,4],[6,2]],
                 4 => [[3,3],[5,3]],
                 5 => [[3,4],[4,3],[6,3]],
                 6 => [[3,2],[5,3]]
    })
    hash_graph = { 1 => [[3,2]],
                   2 => [[3, 4]],
                   3 => [[1, 2],[2,4],[4,3],[6,2]],
                   4 => [[3,3]],
                   5 => [[6,3]],
                   6 => [[3,2],[5,3]]
    }

    assert_equal hash_graph, graph.kruskal.adjacency_list, "find set do not work"
    puts "success!"
  end
end