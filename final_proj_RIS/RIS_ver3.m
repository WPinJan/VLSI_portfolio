clear;
close all;
clc;

%% parameter def
sampling_points = 2^12;
NFFT = 2^10;
N = 4;

%%%%%%%%%% test mode %%%%%%%%%%%
%% you can only change this part
Vcm = 0.9; 
data=csvread('RIS.51tt.csv',2,1);

%% A2D
Digital_code = zeros(sampling_points, N);

for i = 1 : sampling_points
    for j = 1 : N
        if data(i,j) > Vcm
            Digital_code(i, j) = 1;
        end
    end
end

%% separate the cases M = 1 ~ 4 
Digital_code1 = Digital_code(1         :  NFFT, :);
Digital_code2 = Digital_code(1 +   NFFT:2*NFFT, :);
Digital_code3 = Digital_code(1 + 2*NFFT:3*NFFT, :);
Digital_code4 = Digital_code(1 + 3*NFFT:4*NFFT, :);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %%%%% behavior model %%%%%%%%
% %% generate the digital signal ch<3:0> of cases M = 1 ~ 4 for test
% buf = [0, 1]; % buffer, storing the previous chosen heroines
% 
% % heroine series for different cases
% case1 = zeros([NFFT, 1]);
% case2 = zeros([NFFT, 1]);
% case3 = zeros([NFFT, 1]);
% case4 = zeros([NFFT, 1]);
% 
% % case1
% for i = 1:NFFT
%     case1(i) = randi(4) - 1;
% end    
% 
% % case2
% for i = 1:NFFT
%     temp = randi(4) - 1;
%     while temp == buf(1)
%         temp = randi(4) - 1;
%     end
%     case2(i) = temp;
%     buf(1) = case2(i);
% end    
% buf = [0, 1];
% 
% % case3
% for i = 1:NFFT
%     temp = randi(4) - 1;
%     while temp == buf(1) || temp == buf(2)
%         temp = randi(4) - 1;
%     end
%     case3(i) = temp;
%     buf(2) = buf(1);
%     buf(1) = case3(i);
% end    
% 
% % case4
% for i = 1:NFFT
%     case4(i) = mod(i,4);
% end    
% 
% Digital_code1 = zeros(NFFT, N);
% Digital_code2 = zeros(NFFT, N);
% Digital_code3 = zeros(NFFT, N);
% Digital_code4 = zeros(NFFT, N);
% for i = 1:NFFT
%     Digital_code1(i, case1(i)+1) = 1;
%     Digital_code2(i, case2(i)+1) = 1;
%     Digital_code3(i, case3(i)+1) = 1;
%     Digital_code4(i, case4(i)+1) = 1;
% end  
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% check the rule Concentration
disp(['Concentration test']);
% M = 1
test_one_hot1 = sum(Digital_code1, 2);
for i = 1:NFFT
    if test_one_hot1(i) ~= 1
        disp(['For case M = 1, at the ', num2str(i), 'th episode, mutiple heroines is chosen, includeing:']);
        if (Digital_code1(i,1)) == 1
            disp(['Anna Yanami']);
        end
        if (Digital_code1(i,2)) == 1
            disp(['Lemon Yakishio']);
        end
        if (Digital_code1(i,3)) == 1
            disp(['Chika Komari']);
        end
        if (Digital_code1(i,4)) == 1
            disp(['Kaju Nukumizu']);
        end
        error('Your design is failed for case M = 1 in the Concentration test.');
    end
end  

% M = 2
test_one_hot2 = sum(Digital_code2, 2);
for i = 1:NFFT
    if test_one_hot2(i) ~= 1
        disp(['For case M = 2, at the ', num2str(i), 'th episode, mutiple heroines is chosen, includeing:']);
        if (Digital_code2(i,1)) == 1
            disp(['Anna Yanami']);
        end
        if (Digital_code2(i,2)) == 1
            disp(['Lemon Yakishio']);
        end
        if (Digital_code2(i,3)) == 1
            disp(['Chika Komari']);
        end
        if (Digital_code2(i,4)) == 1
            disp(['Kaju Nukumizu']);
        end
        error('Your design is failed for case M = 2 in the Concentration test.');
    end
end  

% M = 3
test_one_hot3 = sum(Digital_code3, 2);
for i = 1:NFFT
    if test_one_hot3(i) ~= 1
        disp(['For case M = 3, at the ', num2str(i), 'th episode, mutiple heroines is chosen, includeing:']);
        if (Digital_code3(i,1)) == 1
            disp(['Anna Yanami']);
        end
        if (Digital_code3(i,2)) == 1
            disp(['Lemon Yakishio']);
        end
        if (Digital_code3(i,3)) == 1
            disp(['Chika Komari']);
        end
        if (Digital_code3(i,4)) == 1
            disp(['Kaju Nukumizu']);
        end
        error('Your design is failed for case M = 3 in the Concentration test.');
    end
end  

% M = 4
test_one_hot4 = sum(Digital_code4, 2);
for i = 1:NFFT
    if test_one_hot4(i) ~= 1
        disp(['For case M = 4, at the ', num2str(i), 'th episode, mutiple heroines is chosen, includeing:']);
        if (Digital_code4(i,1)) == 1
            disp(['Anna Yanami']);
        end
        if (Digital_code4(i,2)) == 1
            disp(['Lemon Yakishio']);
        end
        if (Digital_code4(i,3)) == 1
            disp(['Chika Komari']);
        end
        if (Digital_code4(i,4)) == 1
            disp(['Kaju Nukumizu']);
        end
        error('Your design is failed for case M = 4 in the Concentration test.');
    end
end  

disp(['Congratulation!!!!! Your design passed the test of Concentration rule.']);

%% check the rule Non-repetitive
disp([' ']);
disp(['Non-repetitive test']);
% M = 2
test_repetition2 = conv2(Digital_code2, [1; 1], 'valid');
for i = 1 : NFFT-1
    for j = 1 : N
        if test_repetition2(i,j) > 1
            disp(['For case M = 2, from the ', num2str(i), 'th to the ', num2str(i+1), 'th episode, the heroine']);
            if (j) == 1
                disp(['Anna Yanami']);
            end
            if (j) == 2
                disp(['Lemon Yakishio']);
            end
            if (j) == 3
                disp(['Chika Komari']);
            end
            if (j) == 4
                disp(['Kaju Nukumizu']);
            end       
            disp(['is chosen repetitively.']);
            error('Your design is failed for case M = 2 in the Non-repetitive test.');
        end
    end
end

% M = 3
test_repetition3 = conv2(Digital_code3, [1; 1; 1], 'valid');
for i = 1 : NFFT-2
    for j = 1 : N
        if test_repetition3(i,j) > 1
            disp(['For case M = 3, from the ', num2str(i), 'th to the ', num2str(i+2), 'th episode, the heroine']);
            if (j) == 1
                disp(['Anna Yanami']);
            end
            if (j) == 2
                disp(['Lemon Yakishio']);
            end
            if (j) == 3
                disp(['Chika Komari']);
            end
            if (j) == 4
                disp(['Kaju Nukumizu']);
            end       
            disp(['is chosen repetitively.']);
            error('Your design is failed for case M = 3 in the Non-repetitive test.');
        end
    end
end

% M = 4
test_repetition4 = conv2(Digital_code4, [1; 1; 1; 1], 'valid');
for i = 1 : NFFT-3
    for j = 1 : N
        if test_repetition4(i,j) > 1
            disp(['For case M = 4, from the ', num2str(i), 'th to the ', num2str(i+3), 'th episode, the heroine']);
            if (j) == 1
                disp(['Anna Yanami']);
            end
            if (j) == 2
                disp(['Lemon Yakishio']);
            end
            if (j) == 3
                disp(['Chika Komari']);
            end
            if (j) == 4
                disp(['Kaju Nukumizu']);
            end       
            disp(['is chosen repetitively.']);
            error('Your design is failed for case M = 4 in the Non-repetitive test.');
        end
    end
end

disp(['Congratulation!!!!! Your design passed the test of Non-repetitive rule.']);

%% Perform the QAM and calculate the PSD
% QAM
QAM1 = zeros(NFFT, 1);
for i = 1:NFFT
    if (Digital_code1(i,1)) == 1
        QAM1(i) = (1 + 1j)/sqrt(2);
    end
    if (Digital_code1(i,2)) == 1
        QAM1(i) = (-1 + 1j)/sqrt(2);
    end
    if (Digital_code1(i,3)) == 1
        QAM1(i) = (-1 - 1j)/sqrt(2);
    end
    if (Digital_code1(i,4)) == 1
        QAM1(i) = (1 - 1j)/sqrt(2);
    end
end  
QAM2 = zeros(NFFT, 1);
for i = 1:NFFT
    if (Digital_code2(i,1)) == 1
        QAM2(i) = (1 + 1j)/sqrt(2);
    end
    if (Digital_code2(i,2)) == 1
        QAM2(i) = (-1 + 1j)/sqrt(2);
    end
    if (Digital_code2(i,3)) == 1
        QAM2(i) = (-1 - 1j)/sqrt(2);
    end
    if (Digital_code2(i,4)) == 1
        QAM2(i) = (1 - 1j)/sqrt(2);
    end
end  
QAM3 = zeros(NFFT, 1);
for i = 1:NFFT
    if (Digital_code3(i,1)) == 1
        QAM3(i) = (1 + 1j)/sqrt(2);
    end
    if (Digital_code3(i,2)) == 1
        QAM3(i) = (-1 + 1j)/sqrt(2);
    end
    if (Digital_code3(i,3)) == 1
        QAM3(i) = (-1 - 1j)/sqrt(2);
    end
    if (Digital_code3(i,4)) == 1
        QAM3(i) = (1 - 1j)/sqrt(2);
    end
end  
QAM4 = zeros(NFFT, 1);
for i = 1:NFFT
    if (Digital_code4(i,1)) == 1
        QAM4(i) = (1 + 1j)/sqrt(2);
    end
    if (Digital_code4(i,2)) == 1
        QAM4(i) = (-1 + 1j)/sqrt(2);
    end
    if (Digital_code4(i,3)) == 1
        QAM4(i) = (-1 - 1j)/sqrt(2);
    end
    if (Digital_code4(i,4)) == 1
        QAM4(i) = (1 - 1j)/sqrt(2);
    end
end  

% PSD
X1 = fft(QAM1, NFFT);
PSD1 = abs(X1).^2 / NFFT;
PSD1 = PSD1(1:NFFT/2+1) + [0; PSD1(end:-1:NFFT/2+2); 0];
PSD1_dB = 10*log10(PSD1);

X2 = fft(QAM2, NFFT);
PSD2 = abs(X2).^2 / NFFT;
PSD2 = PSD2(1:NFFT/2+1) + [0; PSD2(end:-1:NFFT/2+2); 0];
PSD2_dB = 10*log10(PSD2);

X3 = fft(QAM3, NFFT);
PSD3 = abs(X3).^2 / NFFT;
PSD3 = PSD3(1:NFFT/2+1) + [0; PSD3(end:-1:NFFT/2+2); 0];
PSD3_dB = 10*log10(PSD3);

X4 = fft(QAM4, NFFT);
PSD4 = abs(X4).^2 / NFFT;
PSD4 = PSD4(1:NFFT/2+1) + [0; PSD4(end:-1:NFFT/2+2); 0];
PSD4_dB = 10*log10(PSD4);

%% check the rule Balance
disp([' ']);
disp(['Balance test']);
disp(['Check whether the DC power of the PSD is small enough for cases M = 1 ~ 3']);
disp(['If the DC power is larger than 10dB, your design might be failed in the Balance test.']);
disp(['DC Power in dB for case M = 1: ', num2str(PSD1_dB(1)), 'dB']);
disp(['DC Power in dB for case M = 2: ', num2str(PSD2_dB(1)), 'dB']);
disp(['DC Power in dB for case M = 3: ', num2str(PSD3_dB(1)), 'dB']);

if PSD1_dB(1) > 10
    error('Your design is failed for case M = 1 in the Balance test.');
end
if PSD2_dB(1) > 10
    error('Your design is failed for case M = 2 in the Balance test.');
end
if PSD3_dB(1) > 10
    error('Your design is failed for case M = 3 in the Balance test.');
end


%% check the rule Randomness
osr = 4;
disp([' ']);
disp(['Randomness test']);
disp(['Check whether the SNDR boost is close enough to the ideal one for cases M = 1 ~ 3']);
disp(['If the gap is larger than 2dB, your design might be failed in the Randomness test.']);
disp(['Measured SNDR boost for case M = 1: ', num2str(-10*log10(abs(sum(PSD1(2:round((NFFT/2+1)/osr)))/sum(PSD1(2:NFFT/2+1))))), 'dB']);
disp(['Ideal SNDR boost for case M = 1:    ', '6.0000', 'dB']);
disp([' ']);
disp(['Measured SNDR boost for case M = 2: ', num2str(-10*log10(abs(sum(PSD2(2:round((NFFT/2+1)/osr)))/sum(PSD2(2:NFFT/2+1))))), 'dB']);
disp(['Ideal SNDR boost for case M = 2:    ', '8.8628', 'dB']);
disp([' ']);
disp(['Measured SNDR boost for case M = 3: ', num2str(-10*log10(abs(sum(PSD3(2:round((NFFT/2+1)/osr)))/sum(PSD3(2:NFFT/2+1))))), 'dB']);
disp(['Ideal SNDR boost for case M = 3:    ', '13.1330', 'dB']);

if abs(-10*log10(abs(sum(PSD1(2:round((NFFT/2+1)/osr)))/sum(PSD1(2:NFFT/2+1))))-6.0000) > 2
    error('Your design is failed for case M = 1 in the Randomness test.');
end
if abs(-10*log10(abs(sum(PSD2(2:round((NFFT/2+1)/osr)))/sum(PSD2(2:NFFT/2+1))))-8.8628) > 2
    error('Your design is failed for case M = 2 in the Randomness test.');
end
if abs(-10*log10(abs(sum(PSD3(2:round((NFFT/2+1)/osr)))/sum(PSD3(2:NFFT/2+1))))-13.1330) > 2
    error('Your design is failed for case M = 3 in the Randomness test.');
end


%% plot the PSD for checking the rules Balance and Randomness again
disp([' ']);
disp(['Balance and Randomness test']);
disp(['Compare the PSD with Fig.5 in the PDF for cases M = 1 ~ 4']);
disp(['If the PSD looks different, your design might be failed in the Balance or Randomness test.']);

% Generate frequency vector for plotting
f = (0:NFFT/2) * (1 / NFFT);

% limit the PSD for display
for i = 1:length(PSD1_dB)
    if PSD1_dB(i) < -30
        PSD1_dB(i) = -30;
    end
end    
for i = 1:length(PSD1_dB)
    if PSD1_dB(i) > 30
        PSD1_dB(i) = 30;
    end
end    
for i = 1:length(PSD2_dB)
    if PSD2_dB(i) < -30
        PSD2_dB(i) = -30;
    end
end    
for i = 1:length(PSD2_dB)
    if PSD2_dB(i) > 30
        PSD2_dB(i) = 30;
    end
end 
for i = 1:length(PSD3_dB)
    if PSD3_dB(i) < -30
        PSD3_dB(i) = -30;
    end
end    
for i = 1:length(PSD3_dB)
    if PSD3_dB(i) > 30
        PSD3_dB(i) = 30;
    end
end 
for i = 1:length(PSD4_dB)
    if PSD4_dB(i) < -30
        PSD4_dB(i) = -30;
    end
end    
for i = 1:length(PSD4_dB)
    if PSD4_dB(i) > 30
        PSD4_dB(i) = 30;
    end
end 

% Plot the one-sided PSD in dB
figure;
plot(f, PSD1_dB);
title('One-Sided Power Spectral Density (PSD) for M = 1 in dB');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
ylim([-30 30]);
grid on;

figure;
plot(f, PSD2_dB);
title('One-Sided Power Spectral Density (PSD) for M = 2 in dB');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
ylim([-30 30]);
grid on;

figure;
plot(f, PSD3_dB);
title('One-Sided Power Spectral Density (PSD) for M = 3 in dB');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
ylim([-30 30]);
grid on;

figure;
plot(f, PSD4_dB);
title('One-Sided Power Spectral Density (PSD) for M = 4 in dB');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
ylim([-30 30]);
grid on;


