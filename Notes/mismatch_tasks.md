---
title: "Task Mismatch"
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

# Set up

Suppose the dependency layer consists of $M$ disconnected cliques of size $n$, each clique corresponding to a task that the needs to be fulfilled.

Suppose we have $N = nM$ agents divided into $M$ coalitions of size $n$. In the ideal situation, each coalition is assigned to one task. Agents within the coalition can coordinate their actions between themselves to optimise the clique the coalition occupies.  

If we build a bipartite graph consisting of coalition nodes and task (clique) nodes there is a one-to-one correspondence between coalitions and tasks. The edges are weighted according to the number of agents assigned from a coalition to a task: in the perfect matching case every edge has weight $n$.

However suppose there is a mismatch between coalitions and cliques: How bad would it be? We start with the perfectly matched state and consider two coalitions $A$ and $B$ sitting on two distinct task cliques $\alpha$ and $\beta$, where $\alpha$ is only occupied by $A$ agents and $\beta$ is occupied by only $B$ agents. We perturb the system by swapping $m$ agents from $A$ and $B$ across $\alpha$ and $\beta$ cliques, to the effect that the $\alpha$ clique would be occupied by $n-m$ $A$ agents and $m$ $B$ agents, and vice versa for the $\beta$ clique.

In our bipartite graph of coalitions and tasks, there is an extra edge of weight $w_{A\beta} = m$ between $A$ and $\beta$ and another between $B$ and $\alpha$. The weights of edges between $A$ and $\alpha$ and $B$ and $\beta$ respectively are weakened to $w_{A\alpha} = w_{B\beta} = n-m$ due to the sharing.

Now the $A$ coalition is no longer independent and the outcomes of their actions are dependent on the actions of $B$ nodes and vice versa; we can say that they have become entangled. The $A$ agents that remain on $\alpha$ must accept the influence of the $m$ $B$ agents that are participating in the $\alpha$ task, and their collective decision making is also influenced by the $m$ $A$ agents participating in task $\beta$, influenced by $n-m$ $B$ agents that had remained on $\beta$. Thus $A$ is subjected to the influence of $n$ agents from coalition $B$ (and vice versa), so long as $m >0$.

This entanglement between communities means they that cannot take independent action to solve the tasks in the dependency layer. Without $B$ agents providing the external conditions for $A$ agents to see the benefits of coordinating, neither task $\alpha$ or $\beta$ can be completed. To break the deadlock, we need some agents to receive some random 'inspiration' to coordinate and excite a contagion of coordination through all coalitions. The size of this 'seed' of inspiration is dependent on the entanglement between coalitions. If there is no entanglement, no seeds are required; if coalition $A$ is entangled with (say) five other coalitions, some fraction of nodes in the five other coalitions must be seeded in order to spur agents in $A$ to coordinate. We quantify the degree of entanglement $\omega_{AB}$ between coalitions $A$ and $B$ to be the number of $B$ agents that influence the utility of $A$'s actions. We alert the reader that while $w_{A\beta} = w_{B\alpha}$ is 'symmetric', the symmetry breaks in $\omega_{AB} \neq \omega_{BA}$, as we will see soon enough. Furthermore we draw attention to the fact that $\omega_{AB}$ is not the number of edges between $A$ and $B$ nodes, since one agent from $A$ can influence multiple $B$ agents but there is only one external $A$ agent influencing the entire $B$ coalition.

Since a coalition functions as a collective unit and makes decisions simultaneously, we examine the contagion of coordination between coalition nodes by collapsing the bipartite graph and remove the clique nodes. We place an edge between two coalition nodes $A$ and $B$ if they have edges pointing to the same task node in the bipartite graph (i.e. agents from both coalitions participate in the same task).

There are two ways that two coalitions can share in a task and induce an edge between them in the collapsed coalition graph. The first one we call a 'direct swap', where $\alpha$ and $\beta$ tasks swap $A$ and $B$ agents, where $A$ and $B$ are $\alpha$ and $\beta$'s 'perfect matching' coalitions; the second we call an 'intermediary swap',  where $A$ and $B$ independently perform direct swaps of agents with another coalition $C$ and participate in task $\gamma$. Since $A$ and $B$ participate in the same task $\gamma$, we place an edge between $A$ and $B$ when we collapse the bipartite graph.

We weight the edges on the collapsed graph with $\omega_{AB}$, the number of $B$ nodes influencing coalition $A$. Since $\omega_{AB} \neq \omega_{BA}$, we associate two weights to the edge. Denoting $\mathcal{B}$ as the \emph{unweighted} adjacency matrix of the bipartite graph $\mathcal{B}_{A\beta} = \Theta(\omega_{A\beta})$ ($\Theta(x)$ being the Heaviside step function), we compute $\omega_{AB}$ using the equation
\begin{equation}\label{eq:omegaab}
\omega_{AB} = \sum_{\gamma} \mathcal{B}_{A\gamma}w_{B\gamma} = \qty(\mathcal{B}w^T)_{AB}.
\end{equation}
We observe that
\begin{equation}
\omega_{BA} = \sum_{\gamma} \mathcal{B}_{B\gamma}w_{A\gamma} = \qty(w\mathcal{B}^T)_{AB}.
\end{equation}

We develop a stochastic model for the agent swapping procedure. We assume the number of swaps between cliques is distributed as a Poisson distribution $w_{A\beta} \sim \text{Po}(\lambda)$, where $0 \leq \lambda \ll n/(M-1)$, the upper limit on $\lambda$ being the restriction that the clique cannot swap more agents than there are agents in a coalition. Using the Poisson distribution is a simplification: in reality we should really use a multinomial distribution for the full set of $\qty{w_{A\gamma}}_{\gamma = 1}^{M}$, but this is too complicated for any tractable analysis. To derive a probability distribution for $\omega_{AB}$, we need to rewrite decouple the terms in \eqref{eq:omegaab} into independent random variables. Assuming $\lambda$ is sufficiently small that the probability of $\omega_{A\alpha} = 0$ is negligible, we set $\mathcal{B}_{A\alpha} = 1$
\begin{align}
\omega_{AB} &= \mathcal{B}_{A\alpha}w_{B\alpha} + \mathcal{B}_{A\beta} w_{B\beta} + \sum_{\gamma \neq \alpha, \beta} \mathcal{B}_{A\gamma} w_{B\gamma} \\
&= w_{B\alpha} + \Theta(w_{A\beta})\qty(n- w_{B\alpha}-\sum_{\gamma \neq \alpha, \beta} w_{B\gamma} ) + \sum_{\gamma \neq \alpha, \beta} \mathcal{B}_{A\gamma} w_{B\gamma} \\
&= w_{B\alpha} - \Theta(w_{B\alpha}) w_{B\alpha}+ \Theta(w_{B\alpha})\qty(n-\sum_{\gamma \neq \alpha, \beta} w_{B\gamma} ) + \sum_{\gamma \neq \alpha, \beta} \mathcal{B}_{A\gamma} w_{B\gamma} \\
&= \mathcal{B}_{A\beta}(n-\sum_{\gamma \neq \alpha, \beta} w_{B\gamma} ) + \sum_{\gamma \neq \alpha, \beta} \mathcal{B}_{A\gamma} w_{B\gamma} \\
&= n\mathcal{B}_{A\beta} + \sum_{\gamma \neq \alpha, \beta} \qty(\mathcal{B}_{A\gamma} - \mathcal{B}_{A\beta}) w_{B\gamma}.  \quad ( + w_{B\alpha}(\mathcal{B}_{A\alpha}-1))
\end{align}

Now all the variables are independent. The expectation value is simply $\expval{\omega} = n(1-e^{-\lambda})$. For the full probability,
\begin{equation}
p(\omega_{AB}) = \sum_{\mathcal{B}_{A\gamma}} \sum_{w_{B\gamma}}\prod_{\gamma \neq \alpha} p(\mathcal{B}_{A\gamma})p(w_{B\gamma})\ \delta\qty(\omega_{AB} - \qty(n\mathcal{B}_{A\beta} + \sum_{\gamma \neq \alpha, \beta} \qty(\mathcal{B}_{A\gamma} - \mathcal{B}_{A\beta}) w_{B\gamma})).
\end{equation}
This mess clears up when we compute the probability generating function of the distribution.
\begin{align}
G(z) &= \sum_{\omega} p(\omega)z^{\omega}\\
     &= \sum_{\mathcal{B}_{A\beta}} p(\mathcal{B}_{A\beta})\sum_{\mathcal{B}_{A\gamma}} \sum_{w_{B\gamma}} \prod_{\gamma \neq \alpha, \beta}p(\mathcal{B}_{A\gamma})p(w_{B\gamma})\ z^{n\mathcal{B}_{A\beta} + \qty(\mathcal{B}_{A\gamma} - \mathcal{B}_{A\beta}) w_{B\gamma}} \\
     &= e^{-\lambda} \underbrace{\sum_{\mathcal{B}_{A\gamma}} \sum_{w_{B\gamma}} \prod_{\gamma \neq \alpha, \beta}p(\mathcal{B}_{A\gamma})p(w_{B\gamma})\ z^{\mathcal{B}_{A\gamma} w_{B\gamma}}}_{[0],\ B_{A\beta} =0} \nonumber \\
     &+ \qty(1-e^{-\lambda})z^n \underbrace{\sum_{\mathcal{B}_{A\gamma}} \sum_{w_{B\gamma}} \prod_{\gamma \neq \alpha, \beta}p(\mathcal{B}_{A\gamma})p(w_{B\gamma})\ z^{ -\qty(1-\mathcal{B}_{A\gamma}) w_{B\gamma}}}_{[1],\ \mathcal{B}_{A\beta} = 1}
\end{align}

Computing the terms individually, the first term
\begin{align}
[0]&=\sum_{\mathcal{B}_{A\gamma}} \sum_{w_{B\gamma}} \prod_{\gamma \neq \alpha, \beta}p(\mathcal{B}_{A\gamma})p(w_{B\gamma})\ z^{\mathcal{B}_{A\gamma} w_{B\gamma}} \\
&= \sum_{r=0}^{M-2}{M-2 \choose r}\qty(1-e^{-\lambda})^r e^{-\lambda(M-2-r)} \sum_{w_k=0}^\infty \prod_{k=0}^r\qty(\frac{\lambda^{w_k} e^{-\lambda}}{{w_k}!}z^{w_k})\\
&= \sum_{r=0}^{M-2}{M-2 \choose r}\qty(1-e^{-\lambda})^r e^{-\lambda(M-2-r)} e^{\lambda r(z-1)}\\
&= e^{-\lambda(M-2)}\qty(\qty(1-e^{-\lambda})e^{\lambda z} + 1)^{M-2}
\end{align}
And the other term
\begin{align}
[1]&=\sum_{\mathcal{B}_{A\gamma}} \sum_{w_{B\gamma}} \prod_{\gamma \neq \alpha, \beta}p(\mathcal{B}_{A\gamma})p(w_{B\gamma})\ z^{ -\qty(1-\mathcal{B}_{A\gamma}) w_{B\gamma}} \\
&=\sum_{r=0}^{M-2}{M-2 \choose r}\qty(1-e^{-\lambda})^{M-2-r} e^{-\lambda r} e^{\lambda r(1/z-1)} \\
&= \qty(1-e^{-\lambda}(1-e^{\lambda/z -\lambda}))^{M-2}
\end{align}
Putting everything together:
\begin{equation}
G(z) = e^{-\lambda(M-1)}\qty(\qty(1-e^{-\lambda})e^{\lambda z} + 1)^{M-2} + \qty(1-e^{-\lambda})z^n \qty(1-e^{-\lambda}(1-e^{\lambda/z -\lambda}))^{M-2}
\end{equation}
However this is a very unsavoury generating function due to the singularity at $z=0$. To obtain a more cosmetically appealing (and numerically friendly) solution, we make an additional simplifying assumption, that $\omega_{A\alpha} \sim \text{Po}(n-(M-1)\lambda)$. After plugging this into mathematica we get
\begin{equation}
G(z) = e^{\lambda -\lambda  M-n} \left(\left(e^{\lambda }-1\right) e^{\lambda  (z-1)}+1\right)^{M-2} \left(e^{\lambda  (M-1)}-e^{\lambda  (M+z-2)}+e^{n+\lambda  (z-1)}\right) \left(\left(e^{\lambda }-1\right)
   e^{(z-1) (\lambda -\lambda  M+n)}+1\right).
\end{equation}

The probability that two coalitions are not connected is
\begin{equation}
\Pr(\omega_{AB} = 0) = G(0) = \frac{\left(2-e^{-\lambda }\right)^M e^{-\lambda  (M-2)-2 n} \left(-e^{\lambda  (M-1)}+e^{\lambda  M}+e^n\right)^2}{\left(1-2 e^{\lambda }\right)^2}.
\end{equation}

And the mean influence strength of $B$ on $A$ is
\begin{equation}
\expval{\omega_{AB}} = G'(1)= e^{-(n+\lambda)} \left(-\lambda  e^{\lambda  M}+n e^{\lambda +n}+e^n (\lambda -n)\right)
\end{equation}
