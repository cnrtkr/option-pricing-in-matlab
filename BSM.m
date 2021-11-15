
% - A. Black-Scholes Alım ve Satım Opsiyon Fiyatlama %

K = 105
r = 0.1
sigma = 0.25
T = 0.25
S0 = 100
 
% call option%
 
d1 = (log(S0/K) + (r + sigma^2/2) * T)/(sigma * sqrt(T))
d2 = d1 - sigma * sqrt(T)
phid1 = normcdf(d1)
BSM_call_price = S0 * phid1 - K * exp(-r * T) * normcdf(d2)
 
% put option%

d1 = (log(S0/K) + (r + sigma^2/2) * T)/(sigma * sqrt(T))
d2 = d1 - sigma * sqrt(T)
phimd1 =  normcdf(-d1)
BSM_put_price = -S0 * phimd1 + K * exp(-r * T) * normcdf(-d2)
 
BSM_put_price;
BSM_call_price

