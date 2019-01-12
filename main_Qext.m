% Compare this to Bohren, Huffman
% "Absorption And Scattering of Light by Small Particles",
% Page 134

particle_r=[1 0.2 0.05];        % radius in mkm
linestyles={'-', '--', '-.'};
lainv= 0.0001:0.01:12;  % lambda in mkm^-1, better use 0.001 step as it reveals more details
[water_la, water_m]=importSegelsteinWaterRefractiveIndex('Segelstein.txt');
figure;
hold on;
fprintf('%5.2f', 0);
fprintf('%%');
Q=zeros(length(lainv), 1);

for j=1:numel(particle_r)
    for i=1:length(lainv)
        la=1/lainv(i);
        [~, water_ind]=min(abs(water_la-la));
        m=water_m(water_ind);
        %m=1.33;
        k=2*pi/la;
        x=k*particle_r(j);
        y=m*x;

        [a, b]=coeffs_(x, y);
        Q(i)=Q_ext(x, a, b);
        if(mod(i, 100)==0)
            fprintf('\b\b\b\b\b\b');
            fprintf('%5.2f', ((j-1)*numel(lainv)+i)/length(lainv)*100/numel(particle_r));
            fprintf('%%');
        end
    end
    pl=plot(lainv, Q);
    pl.Color='k';
    pl.LineStyle=linestyles{j};
end
fprintf('\n');


ylabel({'Efficiency factor Q'});
xlabel({'Wavelength, microns^{-1}'});
grid on;