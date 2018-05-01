#Model for multi-agent optimisation

Let there be $N$ agents indexed by $i \in \mathcal{I}$ working together on a project proposal. Each agent has a (finite) set of actions $A_i$ which they could employ to modify particular contents of the project proposal. The state of the entire project proposal sits in the product space of all actions $A = A_1 \times \ldots \times A_N$.  We associate to each agent a utility function, $u : \mathcal{I} \times A \to \mathbb{R}$, which we can interpret as the agent's happiness at a given state.

While the objective of an individual agent is to selfishly maximise their own utility, the project only goes forward when all of the agents are 'sufficiently happy': If any one agent is too unhappy, the project cannot proceed. 

> **Question**: Can selfish actions help to collectively optimise the project? 

Firstly, we define the **collective optimisation problem** (the Co-Op) where where all agents sit together, _pool_ their information - i.e. their utility functions - and _altruistically_ maximise their collective benefit function $U(a) = \min_{i \in \mathcal{I}} u_i(a)$, so that no agent is 'left behind' in the name of 'progress':
$$ \max_{a \in A} \min_{i \in \mathcal{I}} u_i(a)  = U^\ast$$
The optimum (optima) of this problem is $U^\ast = u_{i^\ast}(a^\ast)$. 

>_Aside_: if $u$ is a binary function, where an agent gives assent to a project proposal if $u=1$ and vetoes the proposal if $u=0$ , the Co-Op optimum is simply the condition that $u_i(a^\ast) = 1 \quad  \forall i \in \mathcal{I}$. 

Suppose each agent acts selfishly and wants to push the project towards a state that maximises their own utility $\max_{a \in A} u_i(a)$. Then if all agents optimising selfishly can all do better then $U^\ast$, then they would not end up in the state $a^\ast$ that optimises Co-Op. In other words, the condition that selfish agents fail to 'Co-Op' is 
$$ \max_{a \in A} \min_{i \in \mathcal{I}} u_i(a)   < \min_{i \in \mathcal{I}} \max_{a \in A} u_i(a)$$
However there is this famous inequality, well known in game theory and optimisation circles:
$$ \max_{a \in A} \min_{i \in \mathcal{I}} u_i(a)   \leq \min_{i \in \mathcal{I}} \max_{a \in A} u_i(a)$$ with stringent conditions on $\mathcal{I}$, $A$ and $u$ for equality to hold. (there is a theorem in convex optimisation - if $\mathcal{I}$, $\mathcal{A}$ are convex subsets of some field (e.g. rationals, reals) and $u$ is a convex function then equality is ensured). So generically, selfish actions cannot lead to the  'Co-op' communist utopia. 

### Coalition Problem Solving
However there is more finesse to this argument. The assumption that a selfish agent can maximise over all states $A$ is unrealistic - that is what each agent wants; whether it can actually do so is another matter entirely, restricted by its restricted influence on the project proposal. In complex problems (like chess) it is also unlikely that it would be computationally efficient to pre-compute $u$ for all states of the system - usually we can only evaluate $u$ _during_ the game. 

This points towards the temporal nature of real life organisational optimisation problems. We suppose in an optimisation problem we start in some state $a_0 \in A$ and evolves in discrete time steps $a_0 \to a_1 \to \cdots \to a_T$.  Let $K = \{C \subseteq \mathcal{I} \}$ be the collection of all subsets of agents and denote $A(C)$ to be the actions available to agents in $C$. At any moment $t$ a subset of agents $C_t$ come together as a **coalition** to solve the the problem 
$$ \max_{a \in A(C_t)} \min_{i \in C_t} u_i(a \in A(C_t) \lvert a_{t-1} \notin A(C_t))$$ 

N.B. in this coalition 
 - They coordinate their actions (in max operation)
 - They share information about their utility function (in min operation)
 - The state space they could explore is restricted by its immediate $a_{t-1}$
 - The coalition updates the system to a new state where the worse off member of the coalition has a greater utility
 - There is scope for the coalition to be more altruistic/more knowledgeable, by minimising $u_i$ over a superset of $C_t$ 

Questions:
- Does breaking up the global problem into a sequence of smaller coalition problems reduce the problem complexity?
- Are there coalition sequences that avoid the Co-Op global optimum/optima?
- How can agents adaptively learn which coalitions to form? Does it retain _memory_ from previous coalitions?
> Written with [StackEdit](https://stackedit.io/).

