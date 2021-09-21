input = [0 -10 -20 -30 -70 -120];
output = [-2 -8 -15 -25 -90 -120];
plot(input, output, 'r*');
hold on
plot(-120:0, -120:0);


x = -120:0;
y = zeros(1, length(x));
k1 = (output(1) - output(2))/(input(1) - input(2));
k2 = (output(2) - output(3))/(input(2) - input(3));
k3 = (output(3) - output(4))/(input(3) - input(4));
k4 = (output(4) - output(5))/(input(4) - input(5));
k5 = (output(5) - output(6))/(input(5) - input(6));

knee = 5;

for ii = 1:length(x)
    if x(ii) > input(2)+knee*0.5 && x(ii) <= input(1)
        y(ii) = k1 * (x(ii) - input(2)) + output(2);
    elseif x(ii) >= input(2) - knee*0.5 && x(ii) <= input(2) + knee*0.5
        y(ii) = k2*(x(ii) - input(2)) + output(2) + (k1-k2)*(x(ii)-input(2)+knee*0.5)^2/(2*knee);
    elseif x(ii) > input(3)+knee*0.5 && x(ii) < input(2)-knee*0.05
        y(ii) = k2 * (x(ii) - input(3)) + output(3);
    elseif x(ii) >= input(3) - knee*0.5 && x(ii) <= input(3) + knee*0.5
        y(ii) = k3*(x(ii) - input(3)) + output(3) + (k2-k3)*(x(ii)-input(3)+knee*0.5)^2/(2*knee);
    elseif x(ii) > input(4)+knee*0.5 && x(ii) < input(3)-knee*0.5
        y(ii) = k3 * (x(ii) - input(4)) + output(4);
    elseif x(ii) >= input(4) - knee*0.5 && x(ii) <= input(4) + knee*0.5
        y(ii) = k4*(x(ii) - input(4)) + output(4) + (k3-k4)*(x(ii)-input(4)+knee*0.5)^2/(2*knee);
    elseif x(ii) > input(5)+knee*0.5 && x(ii) < input(4)-knee*0.5
        y(ii) = k4 * (x(ii) - input(5)) + output(5);
    elseif x(ii) >= input(5) - knee*0.5 && x(ii) <= input(5) + knee*0.5
        y(ii) = k5*(x(ii) - input(5)) + output(5) + (k4-k5)*(x(ii)-input(5)+knee*0.5)^2/(2*knee);
    elseif x(ii) > input(6)+knee*0.5 && x(ii) < input(5)-knee*0.5
        y(ii) = k5 * (x(ii) - input(6)) + output(6);
    else
        y(ii) = x(ii);
    end
    
end
plot(x, y, 'k');
hold off