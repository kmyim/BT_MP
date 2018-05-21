---
title: "Updates"
author: "Ambrose Yim (University of Oxford)"
date: "15 May 2018"
header-includes:
   - \usepackage{amsmath}
   - \usepackage{amsfonts}
   - \usepackage[total={6.5in,8.75in}, top=1.2in, left=0.9in, includefoot]{geometry}
   - \usepackage{tikz-cd}
output:
   pdf_document:
      toc: true
number-sections: true
---

Rather than using aggregating agents in a coalition with
\begin{equation}
u_C(a) = \min_{i \in C} u_i(a),
\end{equation}
we could relax the 'min' condition by taking the harmonic mean. Let $v_c(a; \epsilon) = 1/(u_c(a) + \epsilon)$ and $v_i(a; \epsilon) = 1/(u_i(a) + \epsilon)$;
\begin{equation}
v_c(a;\epsilon)= \sum_{i \in C} v_i(a; \epsilon).
\end{equation}
Then the objective of each coalition is to minimise the inverse utility. Feature of the scaling parameter $\epsilon$:
- $\epsilon =0$: standard harmonic mean. Compared to simple arithmetic mean, the harmonic mean is dominated by small terms; consistency guaranteed if we rescale $u \in [0,1]$.
- $\epsilon \to \infty$: harmonic mean converges to arithmetic mean, shifting behaviour away from 'socialist' tendencies

Using a harmonic mean maybe more amenable to tractable analytic calculations. Moreover we can recourse to standard multi-agent optimisation action selection algorithms in literature (_Q_-learning and variable elimination).


More generally we can weaken this further: Let $C_{ij} = 1$ if $(i,j)$ are in the same coalition (then they are one-neighbours on a _communication network_ $C$). Instead of assigning a common utility to each coalition, we let each agent retain an individual (anti-)utility that is the harmonic mean of its neighbours' utilities on the communication network:
\begin{equation}
w_i(a) = \sum_i C_{ij} v_j(a).
\end{equation}
Then the equilibrium condition is
\begin{equation}
w_i(a_i, a_{-i}) - w_i(a_i', a_{-i}) = \sum_i C_{ij} (v_j(a_i, a_{-i}) - v_j(a_i', a_{-i})) \leq 0 \quad \forall i \in \mathcal{I}.
\end{equation}
It is transparent that if $i$ is in a coalition with agents $j$ s.t. $v_j(a_i, a_{-i}) - v_j(a_i', a_{-i}) = 0$ (i.e. $j$ has no dependency on actions of $i$) then the equilibrium condition is the Nash equilibrium of the whole system, which may or may not exist. In other words, separating agents whose actions affect each other into different coalitions






Then suppose I have some seeds $Q$ which constitute a fraction $q$ of the total set of nodes. We want to find out how many how many nodes are only parented by
h
