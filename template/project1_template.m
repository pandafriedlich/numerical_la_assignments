
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
    
    gMF = ?
    for iSim = 1:nIter
        s = ?
        w = ?
        
        y = ?
        
        shat = ?
        
        errorsSingle(iP) = errorsSingle(iP) + 1 / nIter * abs(s-shat)^2;
    end
end

% TODO: Add plot

%% Multi-User Scenario

% Number of Interfering users
Ui = 2;
% Interfering channel
Hi = sqrt(.5) * (randn(m, Ui) + 1i * randn(m, Ui));

errorsTwo = zeros(length(Ps), 1);

% TODO: Add simulation

% TODO: Add plot

%% Zero-forcing Filter

errorsZF = zeros(length(Ps), 1);

% TODO: Add simulation

% TODO: Add plot
