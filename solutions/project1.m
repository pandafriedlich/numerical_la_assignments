%% Linear Filters

m = 4; % Number of Antennas at the base station

PdB = (-2:1:6) * 10; % Different values for the transmit power in dB
Ps = 10.^(0.1 .* PdB);

nIter = 100; % Number of iterations used for the simulations per transmit power value

% Complex circular Gaussian distributed channel coefficients
h = sqrt(0.5) * (randn(m, 1) + 1i * randn(m, 1));

%% Single-user Scenario

errorsSingle = zeros(length(Ps), 1);

for iP = 1:length(Ps)
    P = Ps(iP);
    
    gMF = 1/(h'*h)/sqrt(P) * h;
    
    for iSim = 1:nIter
        s = sqrt(0.5) * (randn+1i*randn);
        w =sqrt(0.5) * (randn(m, 1) + 1i * randn(m, 1));        
        y = sqrt(P)*h*s+w;        
        shat = gMF'*y;        
        errorsSingle(iP) = errorsSingle(iP) + 1 / nIter * abs(s-shat)^2;
    end
end

% TODO: Add plot
figure;
semilogy(PdB, errorsSingle);hold on;grid on;
title('Transmission Power - Estimation error(Matched Filter)');
xlabel('P (dB)');
ylabel('Estimation Error');


%% Multi-User Scenario

% Number of Interfering users
Ui = 2;
% Interfering channel
Hi = sqrt(.5) * (randn(m, Ui) + 1i * randn(m, Ui));

errorsTwo = zeros(length(Ps), 1);

% TODO: Add simulation
for iP = 1:length(Ps)
    P = Ps(iP);
    
    gMF = 1/(h'*h)/sqrt(P) * h;
    
    for iSim = 1:nIter
        s = sqrt(0.5) * (randn + 1i*randn);
        si = sqrt(0.5) * (randn(Ui, 1) + 1i*randn(Ui, 1));
        w = sqrt(0.5) * (randn(m, 1) + 1i * randn(m, 1));        
        y = sqrt(P)*h*s +sqrt(P)*Hi*si + w;        
        shat = gMF'*y;        
        errorsTwo(iP) = errorsTwo(iP) + 1 / nIter * abs(s-shat)^2;
    end
end


% TODO: Add plot
semilogy(PdB, errorsTwo);
legend('single user', 'multi user');
% hold off;

%% Zero-forcing Filter

errorsZF = zeros(length(Ps), 1);

V2 = null(Hi');
Proj = V2*V2';
% TODO: Add simulation
for iP = 1:length(Ps)
    P = Ps(iP);
    gZF = Proj*h;
    gZF_norm = gZF'*h*sqrt(P);
    gZF = gZF/gZF_norm;
    
    
    for iSim = 1:nIter
        s = sqrt(0.5) * (randn + 1i*randn);
        si = sqrt(0.5) * (randn(Ui, 1) + 1i*randn(Ui, 1));
        w = sqrt(0.5) * (randn(m, 1) + 1i * randn(m, 1));        
        y = sqrt(P)*h*s +sqrt(P)*Hi*si + w;        
        shat = gZF'*y;        
        errorsZF(iP) = errorsZF(iP) + 1 / nIter * abs(s-shat)^2;
    end
end

% TODO: Add plot
figure;
semilogy(PdB, errorsZF);grid on;
legend('Zero Forcing');
title('Transmission Power - Estimation error(Zero Force Filter)');
xlabel('P (dB)');
ylabel('Estimation Error');
