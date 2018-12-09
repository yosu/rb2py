#!/usr/bin/env ruby

n = nil
b = true
i = 100
f = 1.5
a = [1, 2, 3]
s = 'hello' " world"
sym = :symbol
h = {a: 'apple', b: 'banana'}

# r = 1...3

# メモ
# 長さ: 5分
# 15秒x2=30秒
# 300/30=10個
#
# 方針としては触りの違い
# 詳しいところは本家のドキュメントへ譲る
# 自分でもちゃんと把握してないところは途中まで書いてTODOにする。あとで充実させるか自分のBlogにまとめる
#
# 競技プログラミングやスクリプティングのレベルで日常的に使いそうなものを取り上げる。
# 問題の入力が文字列で与えられる
# 適切なフォーマットで出力すること
#
# Rubyはオブジェクトにすべてが集約されているのが分かる。オブジェクトが出発点になる。
# 何かしたい時も、そのオブジェクトが何であるかを調べ、そのオブジェクトが何ができるか、を見ていけばいい。
# 一方でクラスメソッドについてはややこしい。なるべく少ない仕組みで機能が提供されている。
# そのせいで一見分かりにくい部分もある。
#
# Pythonは組み込み関数が中心的な役割をしつつ、オブジェクトを協調させる。
# 組み込み関数をいかに覚えて、適用していくパターンを覚えることが重要。
# 協調していくための仕組みとしてデータモデルというPython言語が持つフレームワークがある。
#
#
# 戸惑う要素としてはシンボルがないこと。タプルの存在。などの差分。
# ブロックで綺麗に書けるところが綺麗に書けない。どうしてもフラストレーションが溜まる。
# そこは思い切って割り切りが必要。
#
# 型を明示できるのはよい。ある程度の規模のアプリケーションでモデリングする概念の数が多いときは特に。
# 明示するルールにすると、ビジネスロジックに近い高レイヤーの関数が:str, :intがばかりの引数をとるとか、
# モデリング不足というのがすぐに分かる。

# a. 文字列への変数埋め込み
v = 'foo'
i = 100
s = "embedded: #{v} #{i}"
puts s

# b. 数値のフォーマッティング
# 0埋め
# 小数点以下2桁の表示
printf('')

# b1. 文字列のシングルクォートとダブルクォートの使い分け
foo = 'hello!'
sq = 'write "double quote" #{foo}'
dq = "write 'single quote' #{foo}"
puts sq
puts dq

# c. 関数コメントの書き方
# yard

# d. ヒアドキュメント
doc = <<END
  hello heredoc
  this is a heredoc
END
puts doc

doc = <<~END
  hello heredoc
  this is a heredoc
END
puts doc

# e. 標準入力
# STDIN


# f. 日付の扱い
# でかいから後にする

# g. 文字列から数値への変換
i = '100'.to_i
puts(i + 10)
# => 110

# h. 数値から文字列への変換
s = 100.to_s
puts(s + ' yen')
# => 100 yen


# j. ハッシュのイテレーション
h = {a: 'apple', b: 'banana'}
h.each do |k, v|
  puts("#{k}: #{v}")
end

h.keys.each do |k|
  puts("#{k}")
end

h.values.each do |v|
  puts("#{v}")
end

# k. リストのイテレーション
l = [1, 2, 3]
l.each do |v|
  puts v
end

# i. リストの長さ
puts l.length
puts l.size

# i.1 map
l = [1, 2, 3]
l.map {|v| v * v}
# => [1, 4, 9]

# i.2 filter
l.select {|v| v.even? }
# => [2]

l.reject {|v| v.even? }
# => [1, 3]

# i.3 reduce 縮約
l.reduce {|acc, v| acc + v}
# => 6

# i.4 sum
l.sum
# => 6

# i.5 all
l.all? {|v| v.even? }
# => false

# i.6 any
l.any? {|v| v.even? }
# => true

# i.7 sort
l = [1, -2, 3, 8, -5]
l.sort
# => [-5, -2, 1, 3, 8]
l
# => [1, -2, 3, 8, -5]

# i.8 逆順sort
l.sort.reverse
# => [8, 3, 1, -2, -5]

l
# => [1, -2, 3, 8, -5]

# 配列自身を変更
l.sort!
# => [-5, -2, 1, 3, 8]
l
# => [-5, -2, 1, 3, 8]

# i.10 ソート基準指定のsort
# https://ref.xaio.jp/ruby/classes/enumerable/sort_by
l = ["apple", "pineapple", "banana", "strawberry"]
l.sort_by {|e| e.length }
# => ["apple", "banana", "pineapple", "strawberry"]

# j1. 自作のオブジェクトに文字列表現を与える
# https://docs.ruby-lang.org/ja/latest/method/Object/i/to_s.html
class Foo
  def to_s
    "I'm foo"
  end
end
foo = Foo.new
puts "#{foo}"

# j2. クラスメソッドの定義と呼び出し
# https://magazine.rubyist.net/articles/0046/0046-SingletonClassForBeginners.html
class Bar
  def self.hello
    puts 'hello!'
  end

  class << self
    def goodbye
      puts 'goodbye!'
    end
  end
end

Bar.hello
Bar.goodbye
# bar = Bar.new
# bar.hello
# => NoMethodError
# bar.goodbye
# => NoMethodError

# j3. コンストラクタ
class Buzz
  def initialize(message)
    @message = message
  end

  def hello
    puts("hello #{@message}")
  end
end

buzz = Buzz.new('world!')
buzz.hello

# j4. 親クラスのメソッドを子クラスから呼ぶ
class Boo < Buzz
  def initialize(message)
    super(message)
  end

  def hello
    puts("boo hello #{@message} 1")
    super
    puts("boo hello #{@message} 2")
  end

  def new_hello
    puts("new hello #{@message}")
  end
end

boo = Boo.new('world!')
boo.hello
boo.new_hello

# k1. 可変長引数
def print_args(*args)
  puts('args:')
  puts(args)
  puts(args.class)
  # Tupleなことに注意
end
print_args(1, 2, 3)

# k2. キーワード引数
def print_kwargs(**kwargs)
  puts('kwargs:')
  puts(kwargs)
end
print_kwargs(a: 'apple', b: 'banana')

# l. 構造体の定義
# https://docs.ruby-lang.org/ja/latest/class/Struct.html
Dog = Struct.new('Dog', :name, :age)
dog = Dog.new('fred', 5)
puts dog
dog.age += 1
puts dog

puts dog.to_a
puts dog.to_h


# m. 真偽値評価
n = nil
i = 0
s = ''
l = []
h = {}

nil ? true : false
# => false

0 ? true : false
# => true

'' ? true : false
# => true

[] ? true : false
# => true

{} ? true : false
# => true

# n. booleanオペレータ
# Pythonには&&や||が存在しない。迷わないので紹介しない
#
# and/orの有用な使い方の記事。面白い。
# https://techracho.bpsinc.jp/hachi8833/2018_07_12/59092
