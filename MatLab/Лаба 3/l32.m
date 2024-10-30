l=1075;
fff = 7:13;
nnn = 2.^fff;
for i = 1:7
    xxx = [ua zeros(1, nnn(i) - length(ua))];
    d = dftmtx(nnn(i));
    y = zeros(1,nnn(i));
    tic
    for k = 1:l
        y = xxx*d;
    end
    tn0(i) = toc;
end

tn1 = tn0./l;
tte = 0.9*nnn.^2*10^(-9);

figure(5);
semilogy(log2(nnn),(tn1),'r-*');
hold on;
semilogy(log2(nnn),tte,'b--');
xlabel('log_2(nnn)');
ylabel('t, s');
legend('Эксперимент','Теория');
grid on;