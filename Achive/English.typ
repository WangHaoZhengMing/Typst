#set text(font: "PingFang SC")
== The Fascinating World of Deep Learning

Lately, I’ve been diving into the world of deep learning, and it’s absolutely captivating. At its core, the basic *premise* is straightforward: use tons of data and computation to make machines *mimic* human behavior. But when you *peek under the hood*, the complexity is mind-blowing.

Take a typical deep learning model, for instance. It’s built with multiple layers of *perceptrons*, which *progressively* transform raw input data into something meaningful. Picture it like an assembly line: data goes in one end, gets reshaped and refined, and comes out the other end as something like *synthetic* speech generated from text. *But in broad strokes*, I’ll admit I’m *glossing over* some details—like those normalization steps in between—because, honestly, they can feel downright *intractable* to wrap your head around sometimes.

Let’s talk about word embeddings as an example. *For the sake of* keeping things simple, I’ll use an *analogous* analogy: imagine word embeddings as points in a high-dimensional space, and we’re slicing it down to three dimensions to peek at them. You’d think “king” and “queen” would be super close in this space, right? Well, not quite—*presumably* because “queen” in the training data isn’t just a feminine “king.” This got me curious, so I started to *hypothesize*: if I subtract “cat” from “cats,” could that vector point toward a *plurality* direction?

To test this, I decided to compute the dot product of that vector with embeddings of *singular* nouns (like “dog”) and their *plural* counterparts (like “dogs”). If two vectors are *perpendicular*, the dot product is zero; if they’re opposite, it’s negative. I added the results to a running *tally*, and it turns out this process can *soak* up some context, tweaking the vector into a more *nuanced* direction—like encoding “a king who lived in Scotland.”

The magic lies in how these models *incorporate* context efficiently. Each word’s embedding is *plucked* from a matrix, then tugged and pulled *progressively* by network blocks until it points somewhere specific. Take ChatGPT, for example: when it predicts the next word, it samples from a probability distribution. That involves some math where a constant T—called “temperature”—sits in the *denominator* of exponents, *vaguely resembling* equations from *thermodynamics*. Higher temperatures spice things up, but to avoid gibberish, there’s an arbitrary *constraint* baked in.

Now, I’ll need a little *leeway* here—let’s pretend tokens are just full words for simplicity’s sake. In reality, during training, each vector *simultaneously* predicts the next value, boosting efficiency. *In due time*, we’ll dive into attention mechanisms, the *cornerstone* of modern AI’s boom. If you’ve got a solid grasp of embeddings, dot products as similarity measures, and the *premise* that most computations involve matrix multiplication with tunable parameters, understanding attention should feel smooth.

There’s some fun *jargon* too. Model parameters get tweaked like adjusting a line’s *slope* and *intercept*. But pile on too many parameters, and you risk overfitting or making training *intractable*. Here’s where the design *insinuates* something clever: there’s always room to fine-tune it for specific tasks with extra training.

In the end, deep learning is more than code and data—it’s an evolving art form. Whether it’s generating text or understanding language, it’s *progressively* reshaping our world in ways that continue to amaze me.


#line(length: 100%,stroke: 1pt + blue)

This essay weaves in all the bolded words naturally while maintaining a coherent narrative. I hope it helps reinforce your memory of these new terms! Let me know if you’d like any tweaks or additions.