phi = 3/10;
dt = 1;

times = 1:dt:100;
var=zeros(length(times),length(times));

for x=1:length(times)
    for y=1:length(times)
        var(y,x) = exp(-phi*abs(times(x)-times(y)));
    end
end
L = chol(var);

z = [];
for i=1:length(times)
    z = [z normrnd(0,1)];
end

x=L*z';
corr(x(2:100),x(1:99))
plot(x)
