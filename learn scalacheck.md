**学习 scalacheck**

scalacheck 是一个随机生成数据的同时可以检测这些数据的工具。

核心概念是**Generator**和**Property**。

Generator 用于生成指定类型的一个数据。生成的数据不仅仅是简单的数据结构，比如int， string；也可以是复杂的结构，比如Array[String], List[Int], 还可以是更加复杂的用户自定义的结构。

`scala
val teenGen = Gen.choose(10, 19)
`

`scala
val stringGen = Gen.alphaStr
`

`scala
val intList = Gen.listOf(Gen.choose(1, 100))
`

Generator 是通过组合简单的内置的generator来实现复杂数据的generator。

`scala
val materialGen = for {
    name <- Gen.oneOf("Bed", "Heater")
    count <- Gen.choose(1, 100)
  } yield new Material(name, count)
`

Property 是用一个generator生成数据，并用一个返回boolean的函数去检测生成的那个数据.

`scala
  property("teen") = forAll(teenGen) { num =>
    num >= 10 && num <= 19
  }
`

Property 也允许直接传入任意的类型T，但是要提供对这个类型T的 T => Generator[T] 的隐式转换。

`scala
implicit lazy val arbMaterial = Arbitrary(materialGen)

property("produce") = forAll { material: Material =>
// check material here
}
`

scalacheck 也支持stateful的测试，但是需要一个外部对象同步模拟状态的转换。适用于状态改变清楚简单的情况。

---

随机生成数据的功能可以单独拿出来用，也就是通过调用Generator.sample的这个方法获取随机数据. 比如:

`scala
1.to(1000).foreach { i =>
    println(teenGen.sample.get)
  }
`

而如果把Generator看成一个stream或者底层是一个stream的话，Property可以变成一个对stream数据的检测应用。

---

scalacheck 是用于检测满足条件的数据是否具有指定的特性，他的特点是一次性生成大量的随机数据，然后检测这些数据是否都能通过测试。对于区间内的数据，它会对边界数据进行测试。


