Fs=44100;
t=0:1/Fs:5-0.01;
alpha = 1.64;%atténuation de l'air
v=340;%célérité de l'onde dans l'air
f=440;%frequence de l'onde choisie
w=2*pi*f;%pulsation
F = 10; %facteur de diminution des dimensions
P=exp(-1i*w*t);

Mat=zeros(400);
Ko=w/v;
zero=round(size(Mat)/2);
[x,y]=meshgrid(1-zero(1):400-zero(1),1-zero(2):400-zero(2));

r = sqrt(x.*x+y.*y)/F;
g=[50,50]+zero;
d=[60,60]+zero;
P_g=zeros(length(t),1);
P_d=zeros(length(t),1);

rg=sqrt(sum(g.*g));

rd=rg-20:1/length(t):rg+20;

A = 1./(r.^2);
% for k=1:length(t)%t pour la dimension temporelle
%     Mat=A.*P(k).*exp(1i*Ko*r);
%     imshow( (imag(Mat)+1)/2 );
%     plot(g(1),g(2),'+r');
% %     hold off
% end
Ag=1./(rg);
Ad=1./(rd);
% imshow(zeros(size(Mat)));hold on
% plot(length(Mat)/2,rg,'+r');
% plot(length(Mat)/2,rd(1),'+y');
for k=1:length(t)%t pour la dimension temporelle
%     Mat=P(k).*exp(1i*Ko*r);

    P_g(k)=Ag.*P(k).*exp( 1i*Ko/rg );
    P_d(k)=Ad(k).*P(k).*exp( 1i*Ko/rd(k) );
%     imshow( (imag(Mat)+1)/2 );hold on
%     plot(xy(1),xy(2),'+r');
%     hold off
end
yg=imag(P_g);
yd=imag(P_d);
sound([yg,yd].*35,Fs);
audiowrite('5050.wav',[yg,yd],Fs);
'end'