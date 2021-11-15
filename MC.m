% MC PUT OPTION 
M=100
K = 105
r = 0.1
sigma = 0.25
T = 0.25
S0 = 100

M=5000 % Number of Monte-Carlo trials
final_vals=S0*exp((r-0.5*sigma^2)*T + sigma*sqrt(T)*randn(M,1));
option_values=max(K-final_vals,0); % Evaluate the Put option options
present_vals=exp(-r*T)*option_values; % Discount under r-n assumptio
int=1.96*std(present_vals)/sqrt(M) % Compute confidence intervals
MC_put_value=mean(present_vals); % Take the average
display(MC_put_value)

% MC CALL OPTION %

% randn(’state’,0)
n=1;                       % Set number of steps to compute at in [0,T]
dt=T;                       % Compute the time step

dW=sqrt(dt)*randn(M,n);
W=cumsum(dW,2);
t=0:dt:T;
W=[zeros(M,1),W];
tt=repmat(t,M,1);
asset_path=S0*exp((r-0.5*sigma^2)*tt+sigma*W);

% Compute the maximum value the asset reaches over the life of the option:
max_vals=max(asset_path,[],2);

% Evaluate the fixed strike lookback call option in each case:
option_values=max(max_vals-K,0);

% Discount under risk-neutral assumption
present_vals=exp(-r*T)*option_values;
MC_call_value=mean(present_vals);
display(MC_call_value)
