function X = Cal9features(signal)
%CAL9FEATURES Summary of this function goes here
%   Detailed explanation goes here
    epsilon = 1e-5; % -100dB
    Xmv = MV(signal); 
    Xrmsv = RMSV(signal); 
    Xmav = MAV(signal); 
    Xsmrv = SMRV(signal);
    Xkc = KC(signal, Xrmsv, Xmv);
    Xcf = CF(Xmav, Xrmsv);
    Xrmsf = RMSF(signal);
    Xrms = RMS(signal', epsilon); 
    Xspecrest = SpeCrest(signal');
    Xzcr = ZCR(signal');
    
    % New set of features
    X = [Xrmsv, Xmav, Xsmrv, Xkc, Xcf, Xrmsf, Xrms, Xspecrest, Xzcr];
    
%     % case 1
%     X = [Xrmsv, Xmav, Xsmrv, Xkc, Xcf, Xrmsf, Xrms, Xspecrest];

%     % case 2
%     X = [Xrmsv, Xmav, Xsmrv, Xkc, Xcf, Xrmsf, Xrms, Xzcr];

%     % case 3
%     X = [Xrmsv, Xmav, Xsmrv, Xkc, Xcf, Xrmsf, Xspecrest, Xzcr];

%     % case 4 
%     X = [Xrmsv, Xmav, Xsmrv, Xkc, Xcf, Xrms, Xspecrest, Xzcr];

%     % case 5
%     X = [Xrmsv, Xmav, Xsmrv, Xkc, Xrmsf, Xrms, Xspecrest, Xzcr];

%     % case 6
%     X = [Xrmsv, Xmav, Xsmrv, Xcf, Xrmsf, Xrms, Xspecrest, Xzcr];

%     % case 7
%     X = [Xrmsv, Xmav, Xkc, Xcf, Xrmsf, Xrms, Xspecrest, Xzcr];

%     % case 8
%     X = [Xrmsv, Xsmrv, Xkc, Xcf, Xrmsf, Xrms, Xspecrest, Xzcr];

%     % case 9
%     X = [Xmav, Xsmrv, Xkc, Xcf, Xrmsf, Xrms, Xspecrest, Xzcr];

    X = real(X);
end

