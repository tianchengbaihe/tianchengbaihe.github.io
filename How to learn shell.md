**怎么学Shell**

工作中会时不时需要脚本来完成一些自动化工作，对于服务器端程序员来说，shell脚本是很重要的，但我发现，他不好学。有一段时间，我们对于shell脚本的需求是断断续续的，手边有参考书的时候，写起来会相对顺一些，手边没有参考书的时候，心里还是很怕写shell的。

但shell应该是一个很简单的脚本语言，上手简单，书写简单，可是我却总是学不好。即便是我读了shell的教程两遍，努力的去记住他的语法，可到用的时候，总还是会有些波折，语法记不住啦，if的判断忘记啦，结果不对啦。

直到我看到网友在比较shell和其他语言的时候说了一句：“shell是面向字符串的语言”，我就觉得，这个话解释了为什么我学shell总是学不好的原因，因为方向错了。

**shell是面向字符串的脚本语言，学习的重点应该是关注问题怎么转换成可以用字符串表达的问题，然后怎么操作这个字符串解决问题，而不是去记住他的语法，或者试图用他的语法结构表达一个过程，就好像在一般语言里我们做的那样。**

在shell的世界里，你得到一个字符串，然后对字符串进行变换，得到另一个字符串。如果这个字符串就是答案，停机；否则继续进行新的变换。

为了更好的支持字符串变换，shell引入了if，while，for..in..等逻辑结构，支持变量，赋值，允许字符串替换，字符串内执行命令，对了，还有管道。

如果我们从字符串转换出发来解决问题，在这个过程中会自然而然的用到上述语法和结构，那么理解和记忆会变的容易些，而更重要的是理解了shell解决问题的逻辑。

如果从面向字符串出发，我们先要解决的是，用shell如何完成一般语言里支持的字符串操作，比如java语言的string类里的方法。

在实现过程中，我们也会发现，shell里可能会有好几种不同的命令实现，我们也会发现，这些不同的实现是因为为了更简单的针对性的完成一个任务，shell多提供了些选择，比如sed和tr，awk和cut，他们是有重叠的，但是也有很大的不同。

也正因为这个面向字符串的特性，shell处理字符串和字符串数组时是简单的，但是很难去处理其他的数据结构，当我们需要其他的数据结构比如set，hash的时候，用shell就没有那么直接方便了，因此shell在解决问题的过程中需要去避开这一点，或者选择其他的语言来补充。

**如果在解决问题的过程中，始终是面向字符串的，shell就会写的很简单自然。** 但是对于复杂问题，面向字符串是有不足的，数据结构的缺乏是一个很大原因。当然从工程角度，缺乏模块化也是个问题，但我觉得数据结构缺乏会让纯shell的脚本在这种情况下变的难理解，然后才是模块化问题。

稍后我会整理一下将java的string方法用shell实现的代码，未必严谨，毕竟我写的也不算多。

