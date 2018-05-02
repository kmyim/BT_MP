%% Initialise
clear
clc
% simulate 3 agents, each with 2 actions
N = 3;
n_a = 2; %number of actions available to each agent
S = n_a^N; % total number of actions/states in the system
C = 1000; % range of payoff; small C, more likely for agents to have the same payoff values
rng(1);
U = (ceil(rand(S, N)*C)); %check correlation! 
% first index: i \in I set of agents
% subsequent indices: (a_1, a_2, a_3);
