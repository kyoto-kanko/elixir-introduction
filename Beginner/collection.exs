# リスト=========================================
# リストは値の単純なコレクションで、複数の型を含むことができます。
# また、一意ではない値を含むことができます。

[3.14, :pie, "Apple"]
# => [3.14, :pie, "Apple"]

# 末尾に追加
list = [3.14, :pie, "Apple"]

# 先頭に追加（リストの長さを計算しないので早い）
list = [:orange | list]
IO.inspect(list)
# => [:orange, 3.14, :pie, "Apple"]

# 末尾に追加（リストの長さを計算するので比較的遅い）
list = list ++ ["Cherry"]
IO.inspect(list)
# => [:orange, 3.14, :pie, "Apple", "Cherry"]

# リストの連結
join = [1, 4] ++ [2, 3]
IO.inspect(join)
# => [1, 4, 2, 3]

# リストの要素を削除
reduce = ["foo", :bar, 42] -- [42, "bar"]
IO.inspect(reduce)
# => ["foo", :bar] (存在しない値を引いても問題ない)

reduce = [1, 2, 2, 3, 2, 3] -- [1, 2, 3, 2]
IO.inspect(reduce)
# => [2, 3] (要素の左順から削除される)

# リストの操作
head = hd([3.14, :pie, "Apple"])
IO.inspect(head)
# => 3.14

tail = tl([3.14, :pie, "Apple"])
IO.inspect(tail)
# => [:pie, "Apple"]

# タプル=========================================
# タプルはリストに似ていますが、各要素はメモリ上に隣接して格納されます。
# このため、タプルの長さを得るのは高速ですが、修正を行うのは高コストとなります。
# というのも、新しいタプルは全ての要素がメモリにコピーされるからです。タプルは波括弧を用いて定義されます
# レスポンスがこの型で帰ってくることが多い

tuples = {3.14, :pie, "Apple"}
IO.inspect(tuples)
# => {3.14, :pie, "Apple"}

# キーワードリスト=========================================
# キーワードリストとマップはElixirの連想コレクションです。
# Elixirでは、キーワードリストは最初の要素がアトムのタプルからなる特別なリストで、リストと同様の性能になります

IO.inspect(foo: "bar", hello: "world")
# => [foo: "bar", hello: "world"]

# マップ=========================================
# Elixirではマップは”花形の”キーバリューストアです。
# キーワードリストとは違ってどんな型のキーも使え、順序付けされません。 マップは %{} 構文で定義することができます

map = %{:foo => "bar", "hello" => :world}
IO.inspect(map)
# => %{:foo => "bar", "hello" => :world}

IO.inspect(map[:foo])
# => "bar"

# マップのもう一つの興味深い特性は、
# マップの更新のための固有の構文があることです(注: 更新と言っていますが、新しいmapが作成されます)
map = %{foo: "bar", hello: "world"}
# => %{foo: "bar", hello: "world"}

%{map | foo: "baz"}
# => %{foo: "baz", hello: "world"}
