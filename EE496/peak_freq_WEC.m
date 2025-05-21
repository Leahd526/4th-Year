%finding peak frequency
ii = 1; 
jj = 1;
w = waves.waveSpectrum.waveClimate{ii,jj}.w;
Sw = waves.waveSpectrum.waveClimate{ii,jj}.Sw;
w_pk = waves.waveSpectrum.waveClimate{ii,jj}.w_pk;

figure;
plot(w, Sw, 'b-', 'LineWidth', 2);
xlabel('\omega [rad/s]', 'Interpreter', 'tex'); 
ylabel('S_{\omega} [m^2/rad/s]', 'Interpreter', 'tex');
title('Pierson-Moskowitz Spectrum with Peak Frequency');
grid on;