# Reviews from OSDI16 and FAST17

## OSDI 16
>Moreover performance in a cluster is likely to depend
critically on locality, yet Hotpot appears to provide no way for the
programmer to even talk about it ("Applications do not know where their
data physically is or whether a memory access is local or remote."
[Sec. 3.2]). A

- This is related to section *3.2.2 Consistent Global Address Space*. I think it is
okay that we have this by default, many systems do this. It is just the system
should provide a way or APIs for applications to move around their data.
Unfortunately, we do not have this kind of API in hotpot.

>The use of reliable connection send-receive IB transport seems
unlikely to maintain good performance on large numbers of nodes, given
the limited queue pair caching capacity of current IB NICs.

- This is related to *3.6 Network Layer*. Do you need to address this?

>MRMR Livelock issue

- This is related to *3.4 Data Consistency and Reliability*, the transaction part.
We have this issue in OSDI, but we solved this in FAST. We solved this issue by
always sending requests based on Node-IDs, similar to Dining philosophers problem.
However, we still *did not* mention this in both FAST and ATC version.

>So you tell us you use a hash table to manage the namespace, but you don't
tell us anything about the implementation. That is, I assume it has to be
persistent -- how does it get replicated?  What did you have to do in
implementing the hash table to ensure that it's always consistent in PM?
(That is, any memory store can become consistent at arbitrary points in time;
I would imagine you need SFENCE at a minimum to ensure that what's in the PM
is always consistent.)

- Related to sec *3.2.1 Flat Naming* and *3.3.4 Metadata Management*. We've
addressed this issue.

## FAST 17
>One major concern is that the consistency model provided by HotPot is unclear.
Since the data in sync only at the transaction commit point, it appears to be
something related to release consistency. I would suggest the authors make this
clear.

- We did not say this clearly.

>Promote really hot blocks from PM to DRAM.

- Seems an interesting open-research question.

>More evaluation. The MongoDB was a trivial one. The reviewer suggests to
compare with Spark workload benchmarks.

- Spark?

>I suggest a quick discussion of what applications wouldn't be a good fit for
the DSPM model.

- Seems reasonable.

>Also, what happens when there are conflicting transactions? Will one of the
transactions abort? In that case, will the commit-xact call return failure
requiring the application to re-execute? Why doesn't the application code in Figure 5
reflect this retry loop?

- We did not talk about xact conflicting or abort in the paper. I think it
would be good to have them. And I agree, if we explain the retry thing, we need
to reflect in figure 5's code snippet.


>When crashes occur, how do you boot zombie nodes out of the system? For
instance, if the CD or an ON node appears failed to half the system, how do you ensure
that multiple competing nodes in the same role are not wreaking havoc? (There
are good answers to these questions, involving fencing / sealing protocols, but
the paper is incomplete without talking about these scenarios).

- If we are going to address this, I think first claim that we are not dealing
with Byzantine problem. Second, we can say we have heartbeat detection and
timeout mechanism for halting machines. And we need to implement it.

>What is the representation of a persistent pointer, and how is it resolved?
How does Hotpot negotiate and coordinate memory allocation across nodes?

- We already have this.

>I was also hoping for a deeper discussion of how the pointers get managed so
that address spaces are consistently managed across nodes. The paper seems to
trivialize this problem. For instance what is the size of the memory map operation
s that are supported? How many addresses need to be agreed upon across the nodes
and stored persistently. How does this requirement play with security features
such as address-space layout randomization? Previous papers that have traversed
this problem path have highlighted the difficulty of the underlying problem even
for the non-persistent use case.

- TODO

>The main feedback is that the semantics of the distributed transactions were
not clear. It was not clear how the distributed shared memory was maintained to
be consistent across the cluster. For instance how were conflicts resolved and
when do transactions abort, if they do.

- TODO

>The second concern was around how and when data stuck in volatile CPU caches
get managed for persistence.

- TODO
