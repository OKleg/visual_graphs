require 'minitest/autorun'
require './test/test_helper'
require './lib/visual_graphs/kruskal'

class KruskalTest < Minitest::Test
  def setup
    @filepath = 'test/resources/test_mst_kruskal.json.json'
  end

  def teardown
    # Do nothing
  end
  def test_kruskal
    graph = WeightedGraph.load_from_json(@filepath)
    hash_graph = {1 => [[2, 13],[4,17],[5,14]],
                  2 => [[1, 13]],
                  3 => [[4,3]],
                  4 => [[1,17],[3,3],[6,19]],
                  5 => [[1,14]],
                  6 => [[4,19]]
        }
    put graph.kruskal
    # assert_equal hash_graph, graph.kruskal, "find set do not work"
  end

end