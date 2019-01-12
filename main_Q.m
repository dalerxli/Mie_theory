la= 0.532;  % lambda in mkm
m=2.4;      % complex refraction index
ra=0.001;        % radius in mkm
Ra=10.^(-3:0.01:1)';

Q=zeros(length(Ra), 1);
Qt=zeros(length(Ra), 1);
fprintf('%5.2f', 0);
fprintf('%%');
for i=1:length(Ra)
    ra=Ra(i);
    k=2*pi/la;
    x=k*ra;
    y=m*k*ra;
    
    [a, b, c, d]=coeffs_(x, y);
    Q(i)=Q_diss(x, a, b);
    Qt(i)=Q_specialcase(x, m);
    fprintf('\b\b\b\b\b\b');
    fprintf('%5.2f', i/length(Ra)*100);
    fprintf('%%');
end
fprintf('\n');

figure;
pl2=loglog(Ra, Qt);
pl2.LineStyle='--';
pl2.LineWidth=3;
hold on;
pl1=loglog(Ra, Q);
legend({'Special cases', 'Definite Q'});
ylabel({'Efficiency factor Q'});
xlabel({'Sphere radius, microns'});
grid on;