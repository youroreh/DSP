U1 = 5;
U2 = -2;
U3 = 4;
U4 = -1;

T1 = 4;
T2 = 8;
Fd = 10;

S = 1 / Fd;

t = 0:S:T2;
t1 = 0:S:T1;
t2 = T1+S:S:T2;

uf = U1 + (U2 - U1) / T1 * t1;
us = U3 + (U4 - U3) / (T2 - T1) * (t2 - T1);
ua = [uf us];

figure(1);
hold on;
plot(t, ua, 'r-');
stem(t, ua, 'b--');
title('Дискретный сигнал');
xlabel('Время, мс');
ylabel('u(t), В');

N = length(ua);
k = (0:N-1).';
W = pi/500;
w = -pi:W:pi;
M = length(w);
kw = k * w;
kw = kw * (-1i);
e = exp(kw);
Sp = ua * e;
f = Fd * w / (2 * pi);

figure(2);
subplot(2, 1 ,1);
ASp = abs(Sp);
plot(f, ASp, 'b');
title('Амплитудный спектр');
xlabel('f, кГц');
ylabel('|A(f)|');

subplot(2, 1 ,2);
FSp = angle(Sp);
plot(f, FSp, 'r');
title('Фазовый спектр');
xlabel('f, кГц');
ylabel('arg(A(f))');

td = (-5 * S):(S / 10):(T2 + 5 * S);
mai = (0:N-1) * S;
mat = td.' - mai;
matsinc = sinc(mat / S);

Sv = matsinc * ua.';

figure(3);
hold on;
stem(t, ua, 'b-');
plot(td, Sv, 'r-');
title('Исходный и восстановленный сигналы');
xlabel('t, мс');
ylabel('u(t), В');
legend('Исходный', 'Восстановленный');