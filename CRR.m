
K = 105
r = 0.1
sigma = 0.25
T = 0.25
S0 = 100


% CRR CALL OPTION

[Price, Option] = binprice(S0,K,r,T,1/12,sigma,1,0,0,0)


% CRR PUT OPTION

[Price, Option] = binprice(S0,K,r,T,1/12,sigma,0,0,0,0)