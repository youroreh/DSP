U1 = 5;
U2 = -2;
U3 = 4;
U4 = -1;

T1 = 4;
T2 = 8;
Fd = 10;

S = 1 / Fd;

b = [0.0149 0.0475 0.0668 0.0105 0.0149];
a = [4 -2.3123 2.8989 -1.6752 0.3286];

t = 0:S:T2;
t1 = 0:S:T1;
t2 = T1 + S:S:T2;

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

yst = filter(b, a, ua);

figure(2);
stem(t, yst);
title('Сигнал после прямого фильтра');
xlabel('t, мс');
ylabel('u(t), В');
grid on;

ycan = filter(1, a, ua);

maxy = max(abs(yst));
maxx = max(abs(ua));

figure(3);
stem(t, ycan);
title('Сигнал после канонического фильтра');
xlabel('t, мс');
ylabel('u(t), В');
grid on;

ycanpr = max(abs(ycan));

states = [];
s = [];
for i = 1:length(ua)
   [ytr(i), s] = filter(b, a, ua(i), s);
   states = [states, s];
end

figure(4);
plot(states');
title('Внутренние сигналы фильтра');
xlabel('t, с^-^4');
ylabel('u, В');
grid on;

ymaxtr = max(abs(states'));

[r, p, k] = residuez(b, a);
rab = abs(r);
ran = angle(r);
pab = abs(p);
pan = angle(p);