#set text(font: "PingFang SC")
= #strong[现代编程语言为何及如何摒弃传统继承：以 Go 和 Rust 为例]
<现代编程语言为何及如何摒弃传统继承以-go-和-rust-为例>
== #strong[I. 引言：在现代编程中重新评估继承]
<i.-引言在现代编程中重新评估继承>
用户观察到一个有趣的现象：Go 语言和 Rust
语言，前者被大规模使用，后者广受好评，却都舍弃了面向对象编程（OOP）中经典的继承（inheritance）机制。用户的理解------“类型是天然的，把类型以及对类型的操作封装在一起也是合理的”------无疑是正确的。类型以及类型操作的封装是构建复杂软件系统的基石，Go
和 Rust 都通过各自的方式支持了这些基本概念
1。然而，它们实现这些概念的途径，特别是类型间的关系和行为共享，却与传统的基于类继承的
OOP 大相径庭。 \
这引出了一个更深层次的问题，也是用户疑问的核心：“有没有必要以目前 OOP
的方式实现（继承）？OOP 是否是一种过度设计？” 本报告旨在深入探讨 Go 和
Rust
为何做出这样的设计抉择，它们提供了哪些替代方案来实现传统上由继承所带来的益处（如代码复用和多态性），并结合这些分析，审视传统
OOP 继承在现代软件工程实践中是否可能构成一种“过度设计”
4。类型的“天然性”与实现类型间关系的机制并非等同。虽然类型及其操作的组织是软件设计的基础，但古典继承这一特定机制，在面对如大规模系统构建和高并发等现代软件工程挑战时，其普适性和最优性受到了质疑。Go
和 Rust
的选择，反映了编程语言设计理念的演进，它们不仅是对继承问题的回应，更是对何为“良好”或“恰当”设计原则的探索。

== #strong[II. 古典继承：一把双刃剑]
<ii.-古典继承一把双刃剑>
古典继承自面向对象编程范式诞生以来，长期被视作其核心支柱之一，旨在提供代码复用和构建清晰的类型层次结构。然而，实践经验表明，它在带来便利的同时，也伴随着一系列固有的问题。

=== #strong[古典继承的公认优势]
<古典继承的公认优势>
继承机制因其若干关键优势而被广泛采用：

+ #strong[代码可重用性 (Code
  Reusability)];：子类可以继承父类的属性和行为，从而减少重复代码的编写和维护工作量。这是继承最常被提及的优点
  4。 \
+ #strong[多态性
  (Polymorphism)];：允许将不同子类的对象视为其共同父类类型的对象进行统一处理，即子类型多态。这增强了代码的灵活性和可扩展性
  6。 \
+ #strong[“是一个”(Is-A)
  关系建模];：从概念上讲，继承能够清晰地表达类之间的层级关系，例如，“轿车”是一个“交通工具”
  4。 \
+ #strong[模块化与易维护性
  (理论上)];：如果继承层次结构设计得当，对父类的修改可以自动传播到所有子类，从而在理论上简化系统更新
  4。

=== #strong[古典继承的常见陷阱（“阴暗面”）]
<古典继承的常见陷阱阴暗面>
尽管有上述优点，但古典继承也因其固有的复杂性和潜在风险而备受诟病：

+ #strong[紧耦合 (Tight
  Coupling)];：子类与其父类的实现细节之间常常形成高度依赖。父类的内部实现发生变化，即使其公共接口保持不变，也可能意外地破坏子类的功能
  4。这种依赖性使得系统变得僵硬，难以修改和演进。 \
+ #strong[脆弱基类问题 (Fragile Base Class
  Problem)];：这是一个更为微妙且危险的问题。对基类进行看似安全的修改（例如，修改一个私有方法的实现，或者添加新的方法），可能会导致派生类发生故障，即使基类的对外“契约”并未改变
  8。例如，一个在Java中编写的基类，其内部方法调用顺序的改变，可能导致子类在重写某个方法后陷入无限递归
  10。这严重破坏了软件演化的可靠性和可预测性，因为开发者无法仅通过检查基类本身来判断修改是否安全。
  \
+ #strong[多重继承的复杂性与钻石问题 (Multiple Inheritance Issues &
  Diamond
  Problem)];：当一个类从两个或多个父类继承，而这些父类又恰好有一个共同的祖先类或定义了同名方法时，就会产生歧义。钻石问题特指在菱形继承结构中，子类不知道应该继承哪个父类版本的同名方法
  4。虽然某些语言（如C++中的虚继承）提供了解决钻石问题的机制，但这本身也增加了语言的复杂性。值得注意的是，Go语言在编译时就能防止此类问题，而Java 8引入的接口默认方法甚至可能重新引入类似困境 11。 \
+ #strong[“香蕉、猴子、丛林”困境 (Banana, Monkey, Jungle
  Problem)];：这个形象的比喻由Erlang语言的创造者Joe
  Armstrong提出，意指“你想要一根香蕉，但结果却得到了一只拿着香蕉的大猩猩，以及整片丛林”。在继承体系中，为了复用某个类的部分功能，可能不得不引入其整个继承链上的父类及其所有依赖，即使大部分功能并非所需
  12。这会导致系统膨胀，难以实现真正的模块化。 \
+ #strong[过度工程化与滥用风险 (Over-Engineering and
  Misuse)];：继承的强大能力有时会诱使开发者创建不必要、过度复杂的类层次结构来解决简单问题，导致代码难以理解和维护。更常见的是，开发者为了代码复用而使用继承，但实际上类之间并不存在真正的“是一个”关系，混淆了子类型化和实现共享的概念
  5。

古典继承的核心张力在于其试图同时提供抽象（“是一个”关系）和实现复用，但往往难以完美平衡。父类的“契约”理想上应仅限于其公共接口，但在实践中，子类常常隐式地依赖于父类方法的具体实现方式，这种实现细节的泄露是导致紧耦合和脆弱基类问题的根源。深厚的继承体系还容易催生“上帝类”（God
Class）反模式，即顶层基类承担过多职责，成为系统变更的瓶颈和脆弱点。“香蕉、猴子、丛林”问题便是这种现象的一种体现，其中“丛林”可能就是由顶层基类所携带的庞大隐式环境。
\
回顾历史，当面向对象编程开始流行时，通过继承实现代码复用被视为降低开发成本的关键途径，子类型化与代码复用的结合甚至被看作一个特性而非缺陷
5。然而，数十年的软件工程实践暴露了这种做法的诸多弊端，催生了诸如“优先使用组合而非继承”等设计原则
4。Go和Rust等现代语言的设计选择，正是对这些经验教训的深刻反思和回应，它们不仅提供了“不同”的方案，更代表了对何为更优设计范式的积极探索。
\
下表总结了古典继承的常见问题及其在Go和Rust中的规避或缓解方式： \
#strong[表1：古典继承的常见陷阱及其在Go和Rust中的缓解方式]

#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (left,left,left,left,),
    table.header([陷阱], [在古典OOP中的描述], [Go语言如何缓解/规避], [Rust语言如何缓解/规避],),
    table.hline(),
    [紧耦合 (Tight
    Coupling)], [子类高度依赖基类实现。], [无继承；接口促进松耦合；嵌入是组合关系。], [无继承；特质（Trait）定义契约；组合避免深度依赖。],
    [脆弱基类问题], [对基类的“安全”更改破坏子类。], [无继承层次结构，因此不存在“脆弱”的基类。], [无继承层次结构；特质提供稳定、明确的契约。],
    [钻石问题], [多重实现继承带来的歧义。], [无多重实现继承；嵌入规则清晰。], [无多重实现继承；特质方法冲突需明确解决。],
    [“香蕉、猴子、丛林”], [继承不需要的传递性依赖。], [通过嵌入实现的显式组合减少隐式包袱。], [显式组合；特质定义清晰的行为边界。],
    [过度工程化], [为简单问题设计不必要的复杂层次结构。], [设计哲学强调简洁；接口仅用于必要的行为。], [特质鼓励专注的行为；组合避免深度层次结构。],
    [混淆“是一个”关系与代码复用], [在没有真正“是一个”关系时，为代码复用而使用继承。], [将代码复用（嵌入）与多态（接口）分离。], [将代码复用（组合、泛型）与多态（特质）分离。],
  )]
  , kind: table
  )

== #strong[III. Go语言的实用主义方法：简洁与组合]
<iii.-go语言的实用主义方法简洁与组合>
Go语言由Google设计，其核心设计哲学围绕着简洁性、可读性、高效率以及对并发编程的卓越支持
14。Go从C语言汲取灵感，但更侧重于现代特性，如垃圾回收和内置并发机制，旨在提供一种能够编写出整洁、简单且轻量级代码的工具
15。其语法极简，规则集小，使开发者能更专注于解决实际问题而非应付复杂的语言结构
16。

=== #strong[为简洁而刻意放弃古典继承]
<为简洁而刻意放弃古典继承>
Go语言在传统意义上并非面向对象的语言，它没有“类” (class)
的概念，自然也没有类的继承
1。这一设计决策是刻意为之，旨在避免传统继承体系所带来的复杂性
1。一个有力的论点是：“Go语言剔除的那些（OOP）部分，恰恰是你在OOP中本就应该避免使用的部分”
1。这种对简洁性的极致追求，是Go语言为应对大规模软件工程挑战所做的权衡。在大型代码库和众多开发者协作的环境中，复杂的继承层次往往会成为维护的噩梦。Go语言通过简化语言特性，包括去除继承，致力于提升代码的可读性、可理解性和可维护性，从而提高大型团队的生产力
1。

=== #strong[通过结构体嵌入实现代码复用（组合）]
<通过结构体嵌入实现代码复用组合>
Go语言通过#strong[结构体嵌入（Struct Embedding）]
来实现代码复用。其机制是将一个结构体类型直接声明在另一个结构体类型中，被嵌入结构体的字段和方法会被“提升”（promoted）到外层结构体，仿佛它们是外层结构体直接定义的一样
14。例如，如果Manager结构体嵌入了Employee结构体，那么Manager类型的实例可以直接访问Employee的字段和方法。
\
这种方式与继承有本质区别：嵌入表达的是“有一个”（has-a）的组合关系，而非“是一个”（is-a）的继承关系。仅通过嵌入本身并不能实现传统意义上的多态性。关于嵌入是否等同于继承的讨论表明，它更接近于#strong[委托（delegation）或转发（forwarding）];，因为被嵌入结构体的方法在被调用时，其接收者（receiver）仍然是该被嵌入结构体的实例，且方法通常是非虚拟的，外层结构体也无法从内层结构体访问其自身
20。尽管如此，嵌入提供了一种强大的组合工具，鼓励开发者从更小、更专注的组件构建复杂类型，这与“组合优于继承”的设计原则高度一致
17。

=== #strong[通过接口实现多态：隐式满足与灵活性]
<通过接口实现多态隐式满足与灵活性>
Go语言通过#strong[接口（Interfaces）]
来实现多态。接口在Go中定义了一组方法签名（契约）。任何类型，只要它实现了接口中声明的所有方法，就被认为隐式地满足了该接口，无需使用显式的implements关键字声明
1。例如，可以定义一个Shape接口，包含一个Area()方法；任何实现了Area()方法的结构体（如Circle、Rectangle）都可以被赋值给Shape类型的变量，并通过该变量调用Area()方法，实现多态行为
7。 \
Go接口的最佳实践包括保持接口小而专注（遵循接口隔离原则），并在使用方（消费方）定义接口
22。这种“消费端接口”模式极大地促进了解耦，因为服务提供方无需预知所有可能的接口。Go的隐式接口，常被形容为“如果它走起来像鸭子，叫起来像鸭子，那么它就是一只鸭子”（Duck
Typing），在静态类型系统中提供了通常与动态类型语言相关的灵活性
7。这种设计使得Go在集成不同组件时具有高度适应性，并简化了代码重构，因为类型无需修改自身声明即可满足新的接口。

=== #strong[Go如何规避常见的继承问题]
<go如何规避常见的继承问题>
由于没有古典继承，Go自然地规避了许多相关问题：

- #strong[无脆弱基类问题];：不存在继承层次，也就没有基类可变“脆弱”。对嵌入结构体的修改可能会影响宿主结构体，但这是一种组合关系，其影响通常更直接和可控。
  \
- #strong[无钻石问题];：Go不支持实现的多重继承。如果一个结构体嵌入了多个结构体，而这些被嵌入的结构体恰好有同名的方法，直接通过外层结构体调用该方法会导致编译时“选择器不明确”（ambiguous
  selector）的错误，此时需要显式地指明调用路径（例如 d.B.F()）来消除歧义
  11。 \
- #strong[减少紧耦合];：接口鼓励面向契约编程，而非面向具体实现，从而降低耦合度。结构体嵌入建立的是“has-a”关系，通常比“is-a”的继承关系更为松散。

总而言之，Go语言通过结构体嵌入和接口的组合，提供了一种务实且高效的方式来实现代码复用和多态，同时避免了传统继承带来的诸多复杂性和风险。其设计哲学强调，通过更简单、更直接的机制，可以构建出同样强大甚至更健壮的软件系统。

== #strong[IV. Rust的原则性立场：安全、性能与特质]
<iv.-rust的原则性立场安全性能与特质>
Rust语言的设计目标极为明确：在不牺牲性能的前提下保证内存安全，并提供强大的并发能力。其核心特性包括：

- #strong[无垃圾收集器的内存安全];：通过所有权（ownership）、借用（borrowing）和生命周期（lifetimes）系统在编译期保证内存安全
  23。 \
- #strong[无数据竞争的并发];：所有权和借用规则延伸到并发领域，从根本上防止数据竞争
  23。 \
- #strong[媲美C/C++的高性能] 23。 \
- #strong[零成本抽象（Zero-Cost
  Abstractions）];：高级语言特性不应引入运行时开销 23。

=== #strong[Rust为何摒弃继承：与核心原则的统一]
<rust为何摒弃继承与核心原则的统一>
古典继承的引入会使Rust难以达成其核心设计目标。例如，继承可能使其精密的内存安全保障和所有权模型变得异常复杂，甚至难以实现
3（“同时获得这些益处和OOP（指传统继承）将极其困难，甚至不可能”）。此外，继承所固有的紧耦合、脆弱基类等问题，与Rust致力于构建健壮、可维护系统的目标相悖
2。有观点认为，“人们发现继承基本上是个‘坏主意'，使用‘组合'通常优于‘继承'。我预计这就是Rust没有它的原因”
25。事实上，Rust早期版本曾有过类似类的概念，但后来被移除，因为特质（Traits）等其他概念被认为更适合Rust的设计哲学
26。 \
Rust对零成本抽象的执着也是其摒弃古典继承的重要原因
23。古典继承，特别是涉及虚方法（virtual
methods）时，必然会带来运行时开销（如虚函数表查找）。Rust倾向于通过泛型和特质实现静态分发，并将动态分发作为一种可选机制（通过特质对象），从而让开发者能够对性能影响进行细致权衡。

=== #strong[组合：代码复用的基石]
<组合代码复用的基石>
Rust坚定地倡导“组合优于继承”的原则
25。结构体（structs）可以通过包含其他结构体或类型来构建复杂的数据结构。当需要在组合的结构体之间共享或传递状态时，通常通过传递引用等方式来管理它们之间的关系
28。这种方式使得代码更加灵活、模块化，且易于推理，完全符合Rust对可靠性的高度重视。

=== #strong[特质（Traits）：抽象与多态的强大工具]
<特质traits抽象与多态的强大工具>
Rust使用#strong[特质（Traits）]
来定义共享行为。特质类似于其他语言中的接口（interfaces），但功能更为强大，它是一组可以为类型实现的方法签名集合
2。特质不仅可以定义方法，还可以包含默认方法实现、关联类型（associated
types）和关联常量（associated constants），这使其比许多传统接口更为灵活
30。 \
Rust通过特质实现多态主要有两种方式：

+ #strong[静态分发（Static
  Dispatch）];：当特质作为泛型类型参数的约束（trait bound）时（例如 fn
  process\<T: Summarizable\>(item:
  T)），编译器会为每个满足约束的具体类型生成特化的代码副本（这个过程称为单态化，monomorphization）。这种分发方式在编译期完成，没有任何运行时开销，是Rust实现零成本抽象的关键机制之一
  29。 \
+ #strong[动态分发（Dynamic Dispatch）];：通过#strong[特质对象（trait
  objects）];（例如 Box\<dyn
  Summarizable\>），Rust可以在运行时处理不同具体类型的对象，只要它们都实现了同一个特质。这允许创建异构集合。动态分发会产生轻微的运行时成本，因为它涉及到虚函数表（vtable）的查找
  29。

特质为Rust提供了一种既强大又灵活的方式来实现抽象和多态，同时避免了传统继承的弊端，并与Rust的性能和安全目标完美契合。特质不仅仅是基于继承的多态的替代品，它们是整个语言及其生态系统的核心构建块，促成了标准库中如Iterator、Read、Write等基础特质的广泛应用和组合，极大地提升了代码的复用性和系统的内聚性。Rust广受好评，部分原因正源于其特质系统的强大与优雅。

=== #strong[泛型（Generics）：编译期多态与复用]
<泛型generics编译期多态与复用>
泛型允许编写能够操作多种不同具体类型同时保持类型安全的代码
31。如前所述，Rust通过单态化（monomorphization）来编译泛型代码，即为每个实际使用的具体类型生成专门的代码版本，从而保证了执行效率
31。这使得泛型成为在编译期实现强大代码复用和抽象，且不产生运行时开销的重要手段，再次体现了零成本抽象的原则。

=== #strong[Rust模型如何解决继承陷阱并确保安全]
<rust模型如何解决继承陷阱并确保安全>
Rust的设计有效地规避了传统继承的诸多问题：

- #strong[无脆弱基类问题/紧耦合];：特质定义的是行为契约。类型的实现与其消费者是分离的。只要类型遵守特质契约，其内部细节的改变不会破坏依赖该特质实现的不相关代码。
  \
- #strong[无钻石问题（针对实现）];：Rust没有具体实现的多重继承。一个结构体可以实现多个特质。如果多个特质提供了同名的方法，在调用时必须明确指定使用哪个特质的方法，从而避免歧义。
  \
- #strong[内存安全];：所有权和借用系统与特质、组合协同工作，即使在复杂的抽象下也能确保内存安全。

Rust中有意识地将#strong[数据（通过struct和enum定义）与行为（通过impl块和trait定义）分离]
26。这与传统OOP中类将数据和行为紧密捆绑的方式不同。这种分离带来了极大的灵活性：行为（特质）可以被添加到已有的数据类型上，甚至可以为基本类型或来自外部包的类型实现特质（需遵守孤儿规则
orphan rule）。这使得Rust的系统比基于继承的系统更具适应性。

== #strong[V. “组合优于继承”的范式转变]
<v.-组合优于继承的范式转变>
“优先使用组合而非继承”（Favor Composition Over
Inheritance，常缩写为COI）是一项重要的面向对象设计原则。它主张类应当通过包含实现了所需功能的其他类的实例（即组合）来获得多态行为和代码复用，而不是通过从基类或父类继承
4。一个典型的例子是，一个游戏对象可以通过组合不同的行为组件（如一个负责渲染的VisibilityDelegate、一个负责移动的UpdateDelegate和一个负责碰撞的CollisionDelegate）来构建，而不是试图从一个庞大且僵硬的继承树中找到其位置
27。

=== #strong[日益增长的认同与理论基础]
<日益增长的认同与理论基础>
由于传统继承所暴露出的紧耦合、脆弱性等问题日益凸显，COI原则获得了越来越广泛的认同
8。即便是在深度支持继承的语言（如Java）中，权威著作《Effective
Java》也明确建议优先采用组合（例如，其第16条，如35所述）。

=== #strong[组合的优势]
<组合的优势>
采用组合而非继承通常能带来以下显著好处：

+ #strong[灵活性
  (Flexibility)];：系统更容易适应变化和演进。行为可以通过在运行时或编译时替换或修改组件来添加或改变，而无需触动固化的类层次结构
  17。 \
+ #strong[可维护性
  (Maintainability)];：代码通常更易于理解和推理，因为对象间的关系（“有一个”）更加明确，减少了深度继承中常见的“溜溜球问题”（yo-yo
  problem，即需要在继承链上下反复跳转才能理解代码逻辑）17。 \
+ #strong[可测试性 (Testability)];：各个独立的组件更容易被隔离测试。 \
+ #strong[降低耦合度 (Reduced
  Coupling)];：类之间对彼此内部实现的依赖性降低 8。

=== #strong[COI如何直接回应“过度设计”的担忧]
<coi如何直接回应过度设计的担忧>
当继承的复杂性（如僵化的层次结构、脆弱基类问题、钻石问题等）超过其为特定问题带来的益处时，它就可能被视为一种“过度设计”。组合提供了一种更简单、更直接的方式来达到代码复用和构建复杂对象的目的，它允许从更小、更易于管理的部分组装整体，避免了继承可能带来的“隐式环境”或不必要的“包袱”
12。 \
COI范式的核心在于它推动了向#strong[更明确关系];的转变。继承往往涉及隐式的关系和行为（例如，继承的方法、运行时解析的多态调用）。相比之下，组合使得关系变得明确：一个类“拥有”一个组件，并“委托”职责给它。这种明确性使得代码更容易追踪和调试。Go语言的显式错误处理、Rust语言的所有权机制等，都体现了对程序行为透明度和明确性的追求，这与COI原则的精神高度契合。
\
此外，COI能更好地遵循#strong[单一职责原则（Single Responsibility
Principle,
SRP）];。在继承体系中，基类可能累积过多的职责，这些职责随后被所有子类继承，可能导致子类违反SRP。而组合允许对象由多个具有单一职责的组件构成，每个组件专注于行为的一个方面
27
中的VisibilityDelegate、UpdateDelegate和CollisionDelegate的例子就很好地说明了这一点。这自然地导向了更模块化、更健壮的设计，因为对某一职责的修改被局限在其对应的组件内，而不会轻易波及整个继承体系。
\
下表比较了古典继承、Go语言和Rust语言在代码复用和多态性实现机制上的差异：
\
#strong[表2：代码复用与多态机制比较]

#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (left,left,left,left,),
    table.header([特性], [古典继承 (例如 Java/C++)], [Go 语言], [Rust
      语言],),
    table.hline(),
    [主要代码复用机制], [类继承], [结构体嵌入 (组合)], [结构体组合,
    泛型, 宏],
    [主要多态机制], [虚方法 (子类型多态)], [接口 (隐式满足)], [特质
    (静态分发 & 动态分发)],
    [“是一个” (Is-A) 关系建模], [通过 extends/inherits
    直接表达], [通过接口表达行为契约], [通过特质表达行为契约],
    [“有一个” (Has-A) 关系建模], [标准的字段组合], [结构体嵌入,
    标准的字段组合], [标准的字段组合],
    [影响选择的关键设计目标], [层级化组织, 代码共享], [简洁性, 可读性,
    解耦], [安全性, 性能, 零成本抽象],
    [规避的潜在弊端], [(由语言选择规避)], [脆弱基类问题, 钻石问题
    (针对实现的多重继承)], [脆弱基类问题, 钻石问题
    (针对实现的多重继承)],
  )]
  , kind: table
  )

== #strong[VI. 传统OOP继承是“过度设计”吗？]
<vi.-传统oop继承是过度设计吗>
在深入探讨了古典继承的固有问题以及Go和Rust所提供的替代方案之后，现在可以回到用户最初的疑问：传统OOP继承是否构成了一种“过度设计”？

=== #strong[综合论证]
<综合论证>
回顾之前讨论的古典继承的陷阱：紧耦合、脆弱基类问题、钻石问题、“香蕉-猴子-丛林”困境，以及在存在更简单替代方案时可能导致的过度工程化
4。继承变得尤为 problematic 的情况包括：

- 主要为了代码复用而使用继承，但实际上并不存在真正的“是一个”关系 5。 \
- 在大型、持续演化的系统中，灵活性和可维护性至关重要时。 \
- 当过深或过宽的继承层次导致不必要的复杂性时。

=== #strong[Go和Rust设计者的视角]
<go和rust设计者的视角>
Go和Rust的设计选择本身就强烈暗示了其创造者们认为古典继承对于他们所针对的软件类型而言，是存在问题或不必要的
1。Go语言的设计者认为“它（Go）剔除的那些（OOP）部分，恰恰是你在OOP中本就应该避免使用的部分”
1。而Rust社区的观点也类似，有人将移除不良特性（如goto，可类比于此处的继承）视为一种积极的设计选择：“移除不良特性，从而让你别无选择，只能更好地设计你的代码，在我看来是一件非常好的事情”
3。

=== #strong[承认继承的有效（但有限的）用例]
<承认继承的有效但有限的用例>
尽管Go和Rust彻底放弃了古典继承，但需要承认，在某些特定的生态系统或定义良好且稳定的层次结构中，继承#emph[仍然可以];被有效地使用。然而，当前的趋势是更加谨慎地使用它。正如27所指出的：“理想情况下，所有的代码复用都可以通过组装现有组件来实现，但在实践中，通常仍需要继承来创建新的组件。因此，继承和对象组合通常是相辅相成的。”
这提供了一个平衡的视角，尽管Go和Rust几乎完全倾向于使用组合来替代传统继承所提供的功能。

=== #strong[关于“过度设计”的结论]
<关于过度设计的结论>
基于以上分析，对于许多现代软件开发场景，特别是那些由Go（追求简洁、并发、规模）和Rust（追求安全、性能、并发）所优先考虑的场景，古典继承#strong[可以被认为是一种“过度设计”];。
\
这是因为，当存在如组合、接口/特质等多态等更灵活、更健壮的替代方案时，继承所固有的复杂性及其可能导致的系统僵化和脆弱性，往往使其成本超过了收益。用户关于“OOP（继承）是否是一种过度设计?”的直觉，在很大程度上得到了这些成功语言的设计选择以及更广泛的向COI原则转变的印证。
\
何为“过度设计”本身具有一定的#strong[语境依赖性];，它取决于问题领域、团队规模、项目生命周期以及语言自身的能力。然而，新兴编程语言一致地减少对实现继承的依赖，甚至在一些老牌语言的最佳实践中也出现这种趋势，这表明了一个总体倾向：对于许多常见场景，继承的成本效益分析正日益向不利于它的方向倾斜。对于Go和Rust所追求的目标而言，继承显然提供了一个不太理想的权衡。
\
此外，还存在一个#strong[心理因素];：许多开发者最初是通过继承的视角来学习OOP的。这种熟悉感可能导致他们在并非最佳选择的情况下仍然应用继承（所谓“如果你手里只有一把锤子，所有东西看起来都像钉子”）1。Go和Rust通过移除继承这一选项，在某种程度上“迫使”开发者学习和应用通常更为健壮的组合模式。因此，对继承“过度设计”的感知，部分可能源于历史上因教育惯性导致的过度依赖，而非在每种具体情况下对替代方案的审慎评估。

== #strong[VII. 结论：演进中的软件设计原则]
<vii.-结论演进中的软件设计原则>
Go和Rust之所以选择摒弃古典继承，根植于它们各自核心的设计哲学和目标。Go语言优先考虑的是简洁性、可读性以及构建可伸缩的并发系统，它发现古典继承是复杂性的一个主要来源
1。Rust语言则聚焦于内存安全、极致性能和无畏并发，在这些方面，古典继承可能会损害其核心保障或引入不必要的复杂性
3。两种语言都通过组合、接口（Go中）和特质（Rust中）等机制找到了强大且更合适的替代方案。
\
这些设计选择反映了软件设计原则的持续演进，揭示了未来面向对象编程和语言设计的几个趋势：

+ #strong[代码复用更倾向于组合];：组合提供了更高的灵活性和更低的耦合度。
  \
+ #strong[通过显式接口或特质实现多态];：强调API与实现的分离，促进模块化。
  \
+ #strong[追求更模块化、松耦合、易于推理的系统];：这有助于提高软件质量和可维护性。
  \
+ #strong[语言设计倾向于引导开发者采用更健壮的模式];：有时通过审慎地省略那些如果被误用则容易引发问题的特性来实现，正如Go和Rust对继承的态度
  3。

对于开发者而言，这意味着需要：

- 积极拥抱“组合优于继承”的原则。 \
- 在使用Go或Rust时，充分利用它们各自的惯用方法（Go的嵌入与接口，Rust的组合、特质与泛型）。
  \
- 即使在使用支持古典继承的语言时，也应审慎使用，主要将其用于真正符合“是一个”关系且满足里氏替换原则的场景，并警惕构建过深或过宽的继承层次
  4。 \
- 在设计时，批判性地思考继承是否确实是最佳方案，或者组合式方法是否能产生更灵活、更可维护的设计。

Go和Rust的决策体现了一种更广泛的“少即是多”（Less is
More）的设计哲学，尤其是在处理那些可能引入意外复杂性的语言特性时。通过移除或限制某些特性（如古典继承，Go中的手动内存管理，或Rust安全代码中不受限的内存访问），这些语言旨在引导开发者编写出更安全、更易于维护的代码。未来的语言设计可能会延续这一趋势，专注于提供一小组强大且正交的核心特性，这些特性能够良好地组合在一起，而不是提供大量专门化、可能重叠或存在问题的特性。
\
用户提出的“OOP（继承）是否是一种过度设计？”的问题本身，正是该领域健康批判性思维的体现。软件开发社区对工具和范式的不断重新评估，是推动软件工程实践进步的必要条件。Go和Rust的成功，为这场关于设计原则的批判性对话提供了具体的案例研究和有力的论据，鼓励着整个行业持续探索和采纳更优的软件构建之道。

==== #strong[引用的著作]
<引用的著作>
+ What are the pros and cons of not having a traditional OOP in Golang -
  Reddit, 访问时间为 五月 8, 2025，
  #link("https://www.reddit.com/r/golang/comments/197a0m7/what_are_the_pros_and_cons_of_not_having_a/")
  \
+ Rust Is Beyond Object-Oriented, Part 1: Intro and Encapsulation - The
  Coded Message, 访问时间为 五月 8, 2025，
  #link("https://www.thecodedmessage.com/posts/oop-1-encapsulation/") \
+ Why Rust doesn't have classes? : r/rust - Reddit, 访问时间为 五月 8,
  2025，
  #link("https://www.reddit.com/r/rust/comments/1d3hvhw/why_rust_doesnt_have_classes/")
  \
+ The Double-Edged Sword of Inheritance: Weighing the Advantages and
  Disadvantages, 访问时间为 五月 8, 2025，
  #link("https://30dayscoding.com/blog/advantages-and-disadvantages-of-inheritance")
  \
+ oop - Is Inheritance really needed? - Stack Overflow, 访问时间为 五月
  8, 2025，
  #link("https://stackoverflow.com/questions/278476/is-inheritance-really-needed")
  \
+ Inheritance in C++: Unveiling the Advantages and Disadvantages - 30
  Days Coding, 访问时间为 五月 8, 2025，
  #link("https://30dayscoding.com/blog/advantages-and-disadvantages-of-inheritance-in-cpp")
  \
+ Polymorphism Using Interfaces in Golang - Tutorialspoint, 访问时间为
  五月 8, 2025，
  #link("https://www.tutorialspoint.com/polymorphism-using-interfaces-in-golang")
  \
+ Understanding the Limitations of Inheritance in Object-Oriented
  Programming, 访问时间为 五月 8, 2025，
  #link("https://30dayscoding.com/blog/limitations-of-inheritance-in-oop")
  \
+ en.wikipedia.org, 访问时间为 五月 8, 2025，
  #link("https://en.wikipedia.org/wiki/Fragile_base_class#:~:text=The%20fragile%20base%20class%20problem,the%20derived%20classes%20to%20malfunction.")
  \
+ Fragile base class - Wikipedia, 访问时间为 五月 8, 2025，
  #link("https://en.wikipedia.org/wiki/Fragile_base_class") \
+ Multiple inheritance - Wikipedia, 访问时间为 五月 8, 2025，
  #link("https://en.wikipedia.org/wiki/Multiple_inheritance") \
+ The Secret Life of Objects: Inheritance - DEV Community, 访问时间为
  五月 8, 2025，
  #link("https://dev.to/riccardo_cardin/the-secret-life-of-objects-inheritance-453m")
  \
+ Banana Monkey Jungle Problem : r/ProgrammerHumor - Reddit, 访问时间为
  五月 8, 2025，
  #link("https://www.reddit.com/r/ProgrammerHumor/comments/120iqqw/banana_monkey_jungle_problem/")
  \
+ Introduction to Go Language - Digital Turbine, 访问时间为 五月 8,
  2025，
  #link("https://www.digitalturbine.com/blog/introduction-to-go-language")
  \
+ What Is Go Programming Language and What Is It Used For? - Coursera,
  访问时间为 五月 8, 2025，
  #link("https://www.coursera.org/articles/go-programming-language") \
+ Go Programming Language: Simplicity, Concurrency, and Efficiency - ITC
  Group, 访问时间为 五月 8, 2025，
  #link("https://itcgroup.io/our-blogs/go-programming-language-simplicity-concurrency-and-efficiency/")
  \
+ Composition Over Inheritance in Golang - DEV Community, 访问时间为
  五月 8, 2025，
  #link("https://dev.to/thesaltree/composition-over-inheritance-in-go-1261")
  \
+ Composition - Go - Codecademy, 访问时间为 五月 8, 2025，
  #link("https://www.codecademy.com/resources/docs/go/composition") \
+ How to access methods in embedded structs - LabEx, 访问时间为 五月 8,
  2025，
  #link("https://labex.io/tutorials/go-how-to-access-methods-in-embedded-structs-464753")
  \
+ \*struct embedding\* is \*multiple inheritance\*? - understanding
  golang - Google Groups, 访问时间为 五月 8, 2025，
  #link("https://groups.google.com/g/golang-nuts/c/x8GEbutPhuc") \
+ Polymorphism in GoLang - GeeksforGeeks, 访问时间为 五月 8, 2025，
  #link("https://www.geeksforgeeks.org/polymorphism-in-golang/") \
+ Go Interfaces: Five Best-Practices for Enhanced Code Maintainability -
  Victor Pierre, 访问时间为 五月 8, 2025，
  #link("https://victorpierre.dev/blog/five-go-interfaces-best-practices/")
  \
+ Understanding the Power and Potential of the Rust Programming
  Language, 访问时间为 五月 8, 2025，
  #link("https://dev.to/adityabhuyan/understanding-the-power-and-potential-of-the-rust-programming-language-1phi")
  \
+ Rust Programming Basics: Master Memory Safety & Concurrency - Redfox
  Security, 访问时间为 五月 8, 2025，
  #link("https://redfoxsec.com/blog/exploring-the-fundamentals-of-rust-programming/")
  \
+ Add support for classical OOP in Rust - The Rust Programming Language
  Forum, 访问时间为 五月 8, 2025，
  #link("https://users.rust-lang.org/t/add-support-for-classical-oop-in-rust/108245")
  \
+ Why not just add classes? - The Rust Programming Language Forum,
  访问时间为 五月 8, 2025，
  #link("https://users.rust-lang.org/t/why-not-just-add-classes/4618") \
+ Composition over inheritance - Wikipedia, 访问时间为 五月 8, 2025，
  #link("https://en.wikipedia.org/wiki/Composition_over_inheritance") \
+ Composition instead of inheritance - The Rust Programming Language
  Forum, 访问时间为 五月 8, 2025，
  #link("https://users.rust-lang.org/t/composition-instead-of-inheritance/70172")
  \
+ Three Kinds of Polymorphism in Rust January 5, 2022 - Brandon Smith,
  访问时间为 五月 8, 2025，
  #link("https://www.brandons.me/blog/polymorphism-in-rust") \
+ Rust Traits vs Interfaces | Cratecode, 访问时间为 五月 8, 2025，
  #link("https://cratecode.com/info/rust-traits-vs-interfaces") \
+ The Many Kinds of Code Reuse in Rust - Computational Geometry Lab,
  访问时间为 五月 8, 2025，
  #link("https://cglab.ca/~abeinges/blah/rust-reuse-and-recycle/") \
+ Code Reuse in Rust - GitHub Gist, 访问时间为 五月 8, 2025，
  #link("https://gist.github.com/qinwf/55f651daece54a6fdfa2") \
+ Rust Is Beyond Object-Oriented, Part 2: Polymorphism - The Coded
  Message, 访问时间为 五月 8, 2025，
  #link("https://www.thecodedmessage.com/posts/oop-2-polymorphism/") \
+ Rust design advice (for polymorphism, code reuse, and state sharing) :
  r/learnrust - Reddit, 访问时间为 五月 8, 2025，
  #link("https://www.reddit.com/r/learnrust/comments/1aej2lk/rust_design_advice_for_polymorphism_code_reuse/")
  \
+ Why Modern Languages (Go, Rust) Prefer Composition Over Inheritance |
  Leapcell, 访问时间为 五月 8, 2025，
  #link("https://leapcell.io/blog/why-modern-languages-prefer-composition-over-inheritance")