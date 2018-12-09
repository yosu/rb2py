#!/usr/bin/env python
# z. Pythonにしかない要素
# z1. タプルの定義
t = (1, 2, 3)
print(t)

# z2. タプルからの値の取り出し
print(t[1])

# z3. グローバル変数の参照



class MyCollection:
  def __len__(self):
    return 0

# データモデル
# https://pybit.es/python-data-model.html

i = 100
f = 1.5
b = True
l = [1, 2, 3]
s = 'hello' " world"
# sym = :symbol
h = {'a': 'apple', 'b': 'banana'}
n = None
t = (1, 2)
st = {1, 2}
r = range(1, 3)


#
# a. 文字列への変数埋め込み
# TODO: クォートの種類の違い
v = 'foo'
s = f'#{v}'
print(s)

# a. 文字列への変数埋め込み
v = 'foo'
i = 100
s = f"embedded: #{v} #{i}"
print(s)

# b. 数値のフォーマッティング
# 0埋め
# 小数点以下2桁の表示
printf('')

# b1. 文字列のシングルクォートとダブルクォートの使い分け
foo = 'hello!'
sq = f'write "double quote" #{foo}'
dq = f"write 'single quote' #{foo}"
print(sq)
print(dq)

# c. 関数コメントの書き方
# yard

# d. ヒアドキュメント
doc = """
  hello heredoc
  this is a heredoc
"""
print(doc)

# doc = <<~END
#   hello heredoc
#   this is a heredoc
# END
#print(doc)

# e. 標準入力
# STDIN


# f. 日付の扱い
# でかいから後にする

# g. 文字列から数値への変換
i = int('100')
print(i + 10)

# h. 数値から文字列への変換
s = str(100)
print(s + ' yen')

# j. ハッシュのイテレーション
h = {'a': 'apple', 'b': 'banana'}
for k, v in h.items():
    print(f'{k}: {v}')

for k in h:
    print(k)


for v in h.values():
    print(v)

# k. リストのイテレーション
l = [1, 2, 3]
for v in l:
    print(v)

# i. リストの長さ
print(len(l))

# i.1 map
[v * v for v in l]

# i.2 filter
[v for v in l if v % 2 == 0]

[v for v in l if v % 2 != 0]

# i.3 reduce 縮約
from functools import reduce

reduce(lambda acc, v: acc + v, l)

# i.4 sum
sum(l)

# i.5 all
all([x % 2 == 0 for x in l])

# i.6 any
any([x % 2 == 0 for x in l])

# 昇順ソート（配列自身は変更しない）
# https://docs.python.jp/3/howto/sorting.html
l = [1, -2, 3, 8, -5]
sorted(l)
# => [-5, -2, 1, 3, 8]

# 降順ソート
sorted(l, reverse=True)
# => [8, 3, 1, -2, -5]

# 配列自身を変更
l.sort()
# => None
l
# => [-5, -2, 1, 3, 8]

# i.10 ソート基準指定のsort
l = ["apple", "pineapple", "banana", "strawberry"]
sorted(l, key=len)
# => ['apple', 'banana', 'pineapple', 'strawberry']


# j1. 自作のオブジェクトに文字列表現を与える
# https://docs.ruby-lang.org/ja/latest/method/Object/i/to_s.html
class Foo:
    def __str__(self):
        return "I'm foo"

foo = Foo()
print(f"{foo}")

# j2. クラスメソッドの定義と呼び出し
# https://magazine.rubyist.net/articles/0046/0046-SingletonClassForBeginners.html
class Bar:
  @classmethod
  def hello(cls):
    print('hello!')

  @classmethod
  def goodbye(cls):
    print('goodbye!')

Bar.hello()
Bar.goodbye()

# bar = Bar.new
# bar.hello
# => NoMethodError
# bar.goodbye
# => NoMethodError

# j3. コンストラクタ
class Buzz:
  def __init__(self, message):
    self.message = message
  def hello(self):
    print(f"hello {self.message}")

buzz = Buzz('world!')
buzz.hello()

# j4. 親クラスのメソッドを子クラスから呼ぶ
# もうちょっと実用的な例にした方がいい（これは良くない例）
class Boo(Buzz):
  def __init__(self, message):
    super().__init__(message)
  def new_hello(self):
    print(f"new hello {self.message}")
  def hello(self):
    print(f"boo hello {self.message} 1")
    super().hello()
    print(f"boo hello {self.message} 2")

boo = Boo('world!')
boo.new_hello()
boo.hello()

# k1. 可変長引数
def print_args(*args):
  print(f'args: {args}')

print_args(1, 2, 3)
# => args: (1, 2, 3)
# Tupleなことに注意


# k2. キーワード引数
def print_kwargs(**kwargs):
  print(f'kwargs: {kwargs}')

print_kwargs(a='apple', b='banana')
# => kwargs: {'a': 'apple', 'b': 'banana'}

# k3. 組み合わせ
def print_both_args(*args, **kwargs):
  print(f'args: {args}, kwargs:{kwargs}')

print_both_args(1, 2, 3, a='apple', b='banana')
# => args: (1, 2, 3), kwargs:{'a': 'apple', 'b': 'banana'}

# l. 構造体の定義
# https://docs.python.org/ja/3/library/dataclasses.html
# https://realpython.com/python-data-classes/
from dataclasses import dataclass

@dataclass
class Dog:
  name: str
  age: int

dog = Dog('fred', 5)
print(dog)
dog.age += 1
print(dog)

puts dog.to_a
puts dog.to_h

from collections import namedtuple

Dog = namedtuple('Dog', ['name', 'age'])
dog = Dog('fred', 5)
print(dog)
dog.age += 1
# AttributeError: can't set attribute
# print(dog)

from typing import NamedTuple

class Dog(NamedTuple):
  name: str
  age: int


# m. 真偽値評価
n = None
i = 0
f = 0.0
s = ''
l = []
h = {}

True if None else False
# => False

True if 0 else False
# => False

True if 0.0 else False
# => False

True if '' else False
# => False

True if [] else False
# => False

True if h else False
# => False

# n. booleanオペレータ

