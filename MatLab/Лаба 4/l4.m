f = 0:10:2 * 10^3;
fs = 0.85 * 10^3;
aaa = f < fs;

figure(1);
plot(f, aaa, 'r-');
ylabel('|A(f)|');
title('АЧХ идеального ФНЧ');
xlabel('f, кГц');
grid on;

fss = 3 * 10^3;
ttt = 0:1/fss:50 * 10^-3;
ua = sin(2 * pi * fs * ttt) ./ (2 * pi * fs * ttt);
ua(1) = 1;

figure(2);
stem(ttt, ua, 'r-');
ylabel('u(t)');
title('ИХ идеального ФНЧ');
xlabel('t, с');
grid on;

figure(3);
plot(ttt, ua, 'r-');
ylabel('h(t)');
title('ИХ идеального ФНЧ');
xlabel('t, с');
grid on;