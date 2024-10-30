z=250000;
for i = 1:7
    y = zeros(1,nnn(i));
    tic
    for k = 1:z
       y = fft(xxx,nnn(i));
    end
    tn2(i)=toc;
end

tn3 = tn2./z;
tte2 = 0.25*nnn.*log2(nnn)*10^(-9);

figure(6);
semilogy(log2(nnn),tn3,'r-*');
hold on;
semilogy(log2(nnn),tte2,'b--');
xlabel('log_2(nnn)');
ylabel('t,s');
legend('Эксперимент','Теория');
grid on;