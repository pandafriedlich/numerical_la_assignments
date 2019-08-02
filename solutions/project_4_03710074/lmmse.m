
m = 10;
T = 1000; %Number of time instants

h = single(sqrt(0.5)*(randn(m,1) + 1i*randn(m,1))); % channel

% Due to numerical errors the diagonal entries of h*h' include a small 
% imaginary part. The two following lines remove this imaginary part.
A = h*h';
A = A -diag(diag(A)) + real(diag(diag(A)));

alpha = single(0.99);
Ps = 10.^(0.1*(40:2:56)); % power range

% results of the simulations
conds = zeros(length(Ps),1);
MSE1 = zeros(length(Ps),1);
MSE2 = zeros(length(Ps),1);

for iP = 1:length(Ps)
    
    P = single(Ps(iP));
    
    % initialize with correct values for steady state analysis
    C = single(eye(m) + P*double(A));
    L = single(chol(eye(m) + P*double(A),'lower')); 
    
    for t=1:T
        % generate received signal
        s = single(sqrt(0.5)*(randn(1) + 1i*randn(1)));
        w = single(sqrt(0.5)*(randn(m,1) + 1i*randn(m,1)));
        y = single(sqrt(P)*h*s + w);
        
        % update the covariance matrix estimate
        C = alpha*C + (1-alpha)*(y*y');
        
        
        % TODO: calculate LMMSE filter using the estimate C, mychol, backsub 
        %       and fwdsub (4.4)
        L1 = mychol(C);
        g1 = sqrt(P)*backsub(L1', fwdsub(L1, h));
        % TODO: calculate shat (4.4)
        shat1 = g1' * y;
        
        % update average error
        MSE1(iP) = MSE1(iP) + 1/T*abs(s-shat1)^2;
        
        
        % TODO: directly update the lower triangular matrix L
        L = cholRankOne(sqrt(alpha)*L, sqrt(1-alpha)*y);
        % TODO: Use L to calculate the LMMSE filter
        g2 = sqrt(P)*backsub(L', fwdsub(L, h));        
        % TODO: Calculate shat and update MSE for second method
        shat2 = g2' * y;
        MSE2(iP) = MSE2(iP) + 1/T*abs(s-shat2)^2;
        
    end
    
    % TODO:
    % compute condition number of C[T]
    conds(iP) = cond(C); 
    
end

%TODO: plot condition numbers of final estimates C w.r.t. P
figure
semilogy(10*log10(Ps), conds);
xlabel 'P (dB)'
ylabel 'Condition number of C[T]'
grid on

%TODO: plot MSE1 as a function of P
figure
semilogy(10*log10(Ps), MSE1);
xlabel 'P (dB)'
ylabel 'MSE'
grid on
%TODO: plot MSE1 and MSE2 as a function of P
figure
plot(10*log10(Ps), MSE1);
hold on
plot(10*log10(Ps), MSE2);
xlabel 'P (dB)'
legend('MSE1','MSE2')
ylabel 'MSE'
grid on