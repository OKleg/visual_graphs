require_relative 'weighted_graph'

class WeightedGraph

  #MST_Kruskal
  @fathers = []

  def find_set (v)
    if v == @fathers[v]
      return v;
    end
    @fathers[v] = find_set(@fathers[v])
  end

  @rank = []

  def union_set(first, second)

    first = find_set first
    second = find_set second
    if second != first

      if @rank[first] > @rank[second]
        @fathers[second] = first
      else
        @fathers[first] = second
        if rank[second] == @rank[first]
          ++@rank[second]
        end
      end
    end
  end

  def make_set(dest, w)
    self.adjacency_list[dest] = w;
  end

  def kruskal
    #Подготовка
    krusckal = WeightedGraph.new
    for i in (0..self.vertices.length) do
      @fathers[i] = i
      @rank[i] = 0
      krusckal.insert_vertex(i) #make_set
    end
    #Сортировка рёбер по весу
    edges_sorted = self.edges.sort_by { |x| x[1][1] } ##
    # [v,[v,w]]
    #Что-то по крускалу даллее
    edges_sorted.each { |kruskal_edge|
      f = kruskal_edge[0]
      s = kruskal_edge[1][0]
      if find_set(f) != find_set(s)
        union_set(f, s)
         krusckal.adjacency_list[f].insert_edge(s, kruskal_edge[0])
         krusckal.adjacency_list[s].insert_edge(f, kruskal_edge[0])
      end
    }
    krusckal
  end

end