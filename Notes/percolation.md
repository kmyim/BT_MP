---
title: "Coordination Game, Networks and Coalitions"
author: "Ambrose Yim (University of Oxford)"
date: "22 May 2018"
header-includes:
   - \usepackage{amsmath}
   - \usepackage{amsfonts}
   - \usepackage[total={6.5in,8.75in}, top=1.2in, left=0.9in, includefoot]{geometry}
   - \usepackage{physics}
output:
   pdf_document:
      toc: true
number-sections: true
---

# Introduction

We have a directed network of agents who can influence each other. Suppose nodes are sampled from a joint in($j$)-degree and out($k$)-degree distribution $p(k,j)$.

In a coordination game, nodes can choose to coordinate ($a = 1$) or not ($a = 0$); if all neighbours decide to coordinate, then it is beneficial for the node to choose to coordinate ($u(1\ \lvert\ 1,..,1) >0$), otherwise if the node chooses 1 and some neighbour refuses to coordinate, there is a penalty for the node ($u(1 \ \lvert 1, 0, ..., 1)<0$). If the node refuses to coordinate, it always has a neutral payoff ($u(0 \ \lvert \ ...) =0$).

If a coalition $C$ of nodes decide to coordinate their actions in some time step $t$, then they would only choose to coordinate (all of them choosing $a = 1$) if nodes that are not in $C$ but in the neighbourhood of nodes that belong in $C$ already agree to coordinate. Jointly coordinating is the choice that would maximise their coalition payoff.

However if any one of those nodes that are in the neighbourhoods external to $C$ decide not to coordinate, then none of the nodes in the coalition will coordinate. This is because if a node in $C$ connects to a node outside $C$ that does not coordinate, and if it choose $a = 1$, then it has a negative payoff $u <0$, and the coalition payoff will be negative as well since the coalition selects the worst payoff among its agents. Therefore the best case scenario is for all agents to choose 0, which will result in a neutral payoff for the coalition $u=0$.

In short, nodes in a coalition would only choose to coordinate if the nodes that they depend on have already provided the external condition that make it favourable for them to coordinate

This sort of dynamics is similar to epidemic on network models where we have an 'infection' of coordination $a=1$, but victims could recover (not cooperate a=0).

However, each unlike standard infection models, node states do not evolve synchronously; rather in this model they are only compelled to alter its state if its coalition decides to collaborate, and other nodes not in the collaboration are 'in stasis'.

Obviously if we group nodes in a network with a high modularity together as a coalition the chances of the coalition being in a cooperative mood is maximised since this reduces the coalition's dependence on externalities and affords them the greatest freedom to coordinate. Do you have any intuition or info about how modularity (or similar measures? associativity?) vary with the complexity of the underlying network (more random edges? a heavier tail degree distribution? directed network?) as that would tell us something about the optimal size of the coalitions for some network.

To initiate the process of getting nodes to collaborate we must also seed some initial set of nodes with $a=1$. How we seed the network (e.g. degree distribution/centrality of initial seeds) and how many seeds we need to sustain an infection or infect the whole network is also a pertinent question.  

We let $q(j,k)$ and $c(j,k)$ to be the probability that a node with i/o degrees $(j,k)$ be chosen as a seed or coalition member respectively. $r(j,k)$ is the probability that a node with i/o degrees $(j,k)$ is either a seed or coalition member. $q = \sum_{j,k} p(j,k) q(j,k)$ is the total fraction of seed nodes and $c = \sum_{j,k} p(j,k) c(j,k)$ is the total fraction of coalition nodes.

# Seed

Given some initial seed \emph{Q}, what is the probability that a coalition $C$ is only influenced by itself or $Q$ only?

## Coalition is random sample

### Uniform sampling of coalition

We want to calculate the average number of edges pointing to $C$ nodes if they are randomly sampled. Suppose we take away the fraction $1-c$ of nodes not in $C$. Then the degree distribution in the remaining set of nodes $C$ is
\begin{equation}
p_c'(j,k) = \sum_{J, K} p(J,K) {J \choose j} c^j(1-c)^{J-j} {K \choose k} c^k(1-c)^{K-k}.
\end{equation}
The expected total in-degree of $C$ before percolation is $Nc \times \sum_{j,k} j P(j,k) = Nc\langle j \rangle$. After percolation, the expected in-degree is
\begin{align}
\sum_{j,k} j\ p_c'(j,k) &= \sum_j \sum_{J, K} p(J,K) {J \choose j} j c^j(1-c)^{J-j} {K \choose k} c^k(1-c)^{K-k} \\
&= \sum_{J} P(J) Jc \\
&= c\langle j\rangle.
\end{align}
Hence after percolation the total number of edges remaining is $Nc^2\expval{j}$. Therefore the number of in-edges from the nodes outside the coalition is $\eta = Nc\langle j \rangle - Nc^2\langle j \rangle = Nc(1-c) \langle j \rangle$. The maximum is $\eta (1/2) = N\expval{j}/4$: the in-edges from nodes outside the coalition constitute a quarter of all edges; another quarter goes in the other direction, out of the coalition, and the remaining half are edges within the two groups.

### Non-uniform sampling of coalition

Suppose now $c = c(j,k)$. For a non-trivial sampling, the degree distribution of the coalition embedded in the pre-percolation network is
\begin{equation}
p_c(j,k) = \frac{c(j,k)p(j,k)}{c}.
\end{equation}
Thus prior to percolation, the average in-degree in the coalition is
\begin{equation}
\frac{\sum_{j,k} j p(j,k) c(j,k)}{\sum_{j,k} p(j,k) c(j,k)} = \frac{\expval{jc}}{c}.
\end{equation}
So the total number of in-edges in the coalition prior to percolation is
\begin{equation}
Nc \frac{\expval{jc}}{c} = N\expval{jc}.
\end{equation}
Now we percolate the network such that only nodes in the coalition remain, where each node with i/o-degree $(j,k)$ has a survival probability of $c(j,k)$. Consider in-an edge pointing to a surviving node. The edge could only survive if the parent of the edge is also a coalition node. The probability that the parent node is a node with out-degree $k'$ is $k'p(j',k')/\expval{k}$, and the probability that such a node is also in the coalition is $k'p(j',k')/\expval{k} c(j',k')$. Thus the probability that the in or out edge survives percolation is
\begin{align}
\Pr(\text{in-edge survives}) &= \sum_{j',k'} \frac{k'p(j',k')}{\expval{k}} c(j',k') = \frac{\expval{ck}}{\expval{k}} \\
\Pr(\text{out-edge survives}) &= \sum_{j',k'} \frac{j'p(j',k')}{\expval{j}} c(j',k') = \frac{\expval{cj}}{\expval{j}}
\end{align}
(N.B. $\expval{cj} \neq \expval{ck}$!) Thus in calculating the average in-degree of the coalition after percolation we replace $c$ in the case of uniform percolation with $\expval{ck}/\expval{k}$ or $\expval{cj}/\expval{j}$ in appropriate places, and also update the i/o-degree distribution of the coalition embedded in the original netwokr $p(j,k)$ to $p_c(j,k)$, we now get
\begin{equation}
\sum_{j,k} j p_c'(j,k) = \frac{\expval{jc}\expval{kc}}{c\expval{k}}.
\end{equation}
Thus the total number of in-edges in the coalition surviving percolation is
\begin{equation}
Nc \frac{\expval{jc}\expval{kc}}{c\expval{k}} = N\frac{\expval{jc}\expval{kc}}{\expval{k}}.
\end{equation}
So the total number of in-edges pointing to the coalition from outside the coaltion is
\begin{equation}
 N\expval{jc} - N\frac{\expval{jc}\expval{kc}}{\expval{k}} = N\expval{jc}\qty(1-\frac{\expval{kc}}{\expval{k}}).
\end{equation}

 > What is the degree distribution of those on the other end of the edges?

## Coalition constructed around seed

If we follow an in-edge to its parent node, the i/o degree distribution of its parent is $\frac{k p(j,k)}{\expval{k}}$[^1]. Thus for a chosen node, the probability that its first in-edge is parented by a node with i/o-degree $(j_1, k_1)$ is $k_1p(j_1, k_1)/\expval{k}$; since each in-edge independently chooses its parent, the probability that the node has parent nodes of i/o-degrees $\qty((j_1, k_1), \ldots, (j_{j-1}, k_{j-1}))$ (labelled by some arbitrary indexing of edges) is
\begin{equation}
\Pr(\qty(j_e, k_e)_{e=1}^{j} \ \lvert \ j,k) = \prod_{e=1}^j\frac{k_e}{\expval{k}} p(j_e, k_e).
\end{equation}
Thus the probability that such nodes have either seed or coalition parents is
\begin{equation}
\Pr(\qty(j_e, k_e)_{e=1}^{j},\ Q\cup C \to \iota \ \lvert \ j,k) = \prod_{e=1}^j\frac{k_e}{\expval{k}} p(j_e, k_e)r(j_e, k_e).
\end{equation}
Summing over all degree configurations, and observing that sum of products = product of sums
\begin{align}
\Pr(Q\cup C \to \iota \ \lvert \ j,k) &= \prod_{e=1}^j\qty(\sum_{k_e,j_e})\prod_{e=1}^j\frac{k_e}{\expval{k}} p(j_e, k_e)r(j_e, k_e) \\
&= \qty(\sum_{k',j'}\frac{k'}{\expval{k}} p(j', k')r(j', k'))^j = \qty(\frac{\expval{rk}}{\expval{k}})^j
\end{align}

If we define the \emph{ideal} coalition such that
\begin{equation}
\iota \in C \qq{iff} Q \cup C \to \iota,
\end{equation}
then
\begin{align}
c(j,k) &= \Pr(\iota \in C \ \lvert \ d(\iota) = (j,k), Q)\\
 &=  \Pr(Q \cup C \to \iota \ \lvert \ d(\iota) = (j,k), Q) \\
 &= \qty(\sum_{k',j'}\frac{k'}{\expval{k}} p(j', k')r(j', k'))^j = \qty(\frac{\expval{kr}}{\expval{k}})^j.
\end{align}
We observe that $\frac{\expval{kr}}{\expval{k}}$ is nothing more than a constant (given some choice of $q$ and $c$), and thus $c(j,k) = c(j)$ is independent of $k$, i.e. probability of a node with i/o-degrees $(j,k)$ is in the coalition is independent of the node's out degree. If we let $c(j=1) = \gamma$, where $1 \geq \gamma > 0$,
\begin{equation}
c(j) = \gamma^j \quad \forall j = 1,2, \ldots.
\end{equation}
N.B. $c(0) = 0$. Furthermore if we assume that $Q$ was a random sample of the graph, where a node with i/o degrees $(j,k)$ is sampled with probability $q(j,k)$, then
\begin{equation}
r(j,k) = c(j) + q(j,k) - c(j)q(j,k).
\end{equation}
Then we can solve for $c(j)$ from a self-consistency solution:
\begin{align}
\gamma &= \sum_{k,j}\frac{k}{\expval{k}} p(j, k)\qty(q(j,k) + c(j)\qty(1-q(j,k)))\\
&= \frac{\expval{qk}}{\expval{k}} + \sum_{j=0}c(j)\sum_{k=1}\frac{k}{\expval{k}} p(j, k)\qty(1-q(j,k)) \\
&= \frac{\expval{qk}}{\expval{k}} + \sum_{j=1}\gamma^j\sum_{k=1}\frac{k}{\expval{k}} p(j, k)\qty(1-q(j,k))
\end{align}
If we have $q(j,k) = q$ and let $s(j) = \sum_{k=1}\frac{k}{\expval{k}} p(j, k)$,
\begin{align}
\gamma &= q + \qty(1-q) \sum_{j=1}\gamma^{j}s(j)\ ; \qand \\
q &= \gamma \qty(\frac{1-\sum_{j=1} \gamma^{j-1}s(j)}{1-\sum_{j=1} \gamma^js(j)})
\end{align}
We notice that there is are obvious trivial solutions $(\gamma, q) = 0$ and $\gamma(q=1) = 1$, while $q$ is undefined for $\gamma = 1$ and $s(0) = 0$ (where $p(j=0, k \neq 0)=0$). This is sign of \textbf{critical behaviour}. If $s(0) = 0$, performing an asymptotic expansion $\gamma = 1-\epsilon$, we find that $q$ becomes undefined if
\begin{equation}
q > 1 - \frac{\expval{k}}{\expval{jk}} = q_c.
\end{equation}
In other words, if we have more than $Nq_c$ seeds node $Q$, the size of the set of nodes $C$ that is downstream of $Q$ or $C$ is the whole network. This is automatically satisfied if $\expval{kj} = \expval{k}$, loosely meaning that nodes on average have one in-edge and one out-edge i.e. the network is very close to a chain. In addition, this critical value coincides with with the threshold percolation value for the existence of a \textbf{giant connected component} after removing a fraction $q$ of nodes from the network.

# Stochastic Block Model

In a stochastic block model we impose additional information on the nodes. The set of nodes are evenly partitioned into $B$ 'blocks' labelled by $\beta$; for two nodes $a$ and $b$ in blocks $\beta$ and $\beta '$ respectively, the probability of $a \to b$ is
\begin{equation}
\Pr(a \to b \ \lvert \ a \in \beta,\ b \in \beta ') = \frac{k_a j_b}{m}\omega(\beta, \beta ').
\end{equation}
where $\omega(\beta, \beta')$ is a weight that controls the probability of a node in $\beta$ begin the parent of a node in $\beta'$.

We can make further simplifying assumptions of the 'Planted Partition Model': we let $\omega(\beta, \beta) = \omega_i$ $\forall \beta \in B$ and $\omega(\beta, \beta') = \omega_o$ $\forall \beta \neq \beta' \in B$.

We can calculate the probability of a node in $\beta_0$ with i/o-degrees $(j,k)$ in $C$ given random seeds $Q$ and the fact that some node in $\beta_1$ is in $C$. We denote this probability $c(j,k, \beta_0 \ \lvert\ \beta_1)$. Like the calculations above in a configuration model, we get
\begin{equation}
c(j,k, \beta_0 \ \lvert \ \beta_1) = \qty(\frac{\expval{kq}}{\expval{k}} - \expval{k(1-q)\qty(\omega_o c(j,k, \beta_1 \ \lvert \beta_1) + (\omega_i + (B-2)\omega_o ) c(j,k,\beta_0 \ \lvert \ \beta_1))}/ \expval{k})^j
\end{equation}
Similarly, we can calculate the probability of a node in a block being in the coalition given that another node in the block is also in the coalition:
\begin{equation}
c(j,k, \beta_1 \ \lvert \ \beta_1) = \qty(\frac{\expval{kq}}{\expval{k}} - \expval{k(1-q)\qty(\omega_i c(j,k, \beta_1 \ \lvert \beta_1) + (B-1)\omega_o c(j,k,\beta_0 \ \lvert \ \beta_1))}/ \expval{k})^j
\end{equation}
We make the similar observation that the probabilities are independent of out-degree $k$; letting $c(j, \beta_0 \ \lvert \ \beta_1) = \gamma_{01}^j$ and $c(j, \beta_1 \ \lvert \ \beta_1) = \gamma_{11}^j$, we have
\begin{align}
\gamma_{01} &= \frac{\expval{qk}}{\expval{k}} + \sum_{j}\qty(\omega_o\gamma_{11}^j + \qty(\omega_i + (B-2)\omega_o)\gamma_{01}^j )\qty(\sum_k \frac{k}{\expval{k}}p(j,k)(1-q(j,k))) \\
\gamma_{11} &= \frac{\expval{qk}}{\expval{k}} + \sum_{j}\qty(\omega_i\gamma_{11}^j +  (B-1)\omega_o\gamma_{01}^j )\qty(\sum_k \frac{k}{\expval{k}}p(j,k)(1-q(j,k)))
\end{align}
We can make a few preliminary observations: if nodes within blocks are highly associative, in the sense that $B\omega_0 \ll 1$, then the two equations decouple and we reduces to the form for $\gamma$ in the standard configuration model.




# Wrong stuff

#### Coalition is a random sample

Since the probability of node $\iota$ being included in the coalition is independent of the parents of $\iota$, and only on the degrees of the node, the probability that a node $\iota$ is in the coalition and has seed or coalition parents, given that it has i/o-degree $(j,k)$, is
\begin{equation}
\Pr(\iota \in C, \ Q\cup C \rightarrow \iota \ \lvert \ d(\iota) =  \qty(j,k)) = \qty(\frac{\expval{rk}}{\expval{k}})^jc(j,k).
\end{equation}
Moreover, since
\begin{equation}
\Pr(Q\cup C \to \iota \ \lvert \ d(\iota) = (j,k) ,\iota \in C) = \Pr(Q\cup C \to \iota \ \lvert \ d(\iota) = (j,k)),
\end{equation}
to maximise $\Pr(Q\cup C \to \iota \ \lvert \ d(\iota) = (j,k) ,\iota \in C)$ the only relevant parameter is $\expval{rk}/\expval{k}$.

If we denote the generating functions for the p.d. of in-degrees of the full network and that for the coalition
\begin{align}
G_{in}(x) &= \sum_{j=0}^{\infty} x^jp(j); \\
G_{in}^c(x) &= \sum_{j=0}^{\infty} x^jp(j)\frac{c(j)}{c}
\end{align}
respectively, the probability that a randomly chosen node is in the coalition and has seed or coalition parents is
\begin{align}
\Pr(\iota \in C,\ Q\cup C \rightarrow \iota ) &= \sum_{j,k}\qty(\frac{\expval{rk}}{\expval{k}})^jc(j,k)p(j,k)\\
 &= \sum_{j=1}^{\infty}\qty(\frac{\expval{rk}}{\expval{k}})^jc(j)p(j)\\
 &= c G_{in}^c\qty(\frac{\expval{rk}}{\expval{k}}) - c(0)p(0); \\
\Pr(Q\cup C \rightarrow \iota \ \lvert \ \iota \in C) &= \frac{\Pr(\iota \in C,\ Q\cup C \rightarrow \iota )}{\Pr(\iota \in C)} \\
&= G_{in}^c\qty(\frac{\expval{rk}}{\expval{k}}) - \frac{c(0)}{c}p(0)
\end{align}
If coalitions and seeds are randomly, independently and uniformly sampled, i.e $c(j,k) = c$, $q(j,k) = q$, $r(j,k) = r = q + c -qc$,
\begin{align}
\Pr(\iota \in C,\ Q\cup C \rightarrow \iota ) &= c \qty(G_{in}^c\qty(q+c-qc) - p(0)); \\
\Pr(Q\cup C \rightarrow \iota \ \lvert \ \iota \in C) &= G_{in}^c\qty(q+c-qc) - p(0)
\end{align}

## Coalition constructed around seed

Moreover since $1 \geq \gamma > 0$ and $\sum_{j=0} s(j) = 1$, $q < \gamma$, i.e. the fraction of seed nodes is less than that of the $c(j=1) = \gamma$, the fraction of in-degree $j=1$ nodes in the population that belong to the coalition. We see that $\gamma$ grows super-linear with $q$, the rate being a property of the underlying network. If we plot the graph of $\gamma (q)$ vs $q$, it starts at $(0,0)$ with slope $\lim_{q \to 0^+}\gamma ' (q) = 1^+$, continues to grow above the line $\gamma = q$, then flattens off at exactly $q=1$. How quickly it grows and how soon it plateaus would depend on the degree distribution, but the qualitative behaviour is the same. This is bad (though not unexpected) news: to take advantage of a small number of seeds - representing existing wisdom - we need a large coalition (large degree of freedom to modify node states), and the probability of correctly picking out the correct coalition nodes given $Q$ is very small.

### 'Crystal' growth of coalition

Given some initial seed $Q$, if we pick a random node $\iota$ in the coalition and progressively grow a coalition by including nodes that are upstream of the initial node $\iota$, but stopping the inclusion along an edge when the upstream node is in $Q$, what is the size of the cluster?

This is essentially a percolation question: calculations in PHYSICAL REVIEW E \textbf{66}, 015104(R) (2002) by Schwartz et al. shows that the probability of a node being downstream of a giant in-component displays critical behaviour for some $q_c$ \textbf{MORE READING}.



[^1]: N.B. we have assumed that there are sufficiently many nodes such that the probability of self-edges $\sim \order{N^{-1}}$ is vanishingly small.
