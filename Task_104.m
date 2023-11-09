f = @(x) x.^3- 4.*x - 9; % the function

df = @(x)3*x.^2-4; % differentiated function

roots = [];
slopes = [];
a = 0;

for i = 1:10
    c = a - f(a)/df(a);

    slopes = [slopes; a];
    roots = [roots; c];

    if abs(c - a) < tolerance
        break;
    end
    a=c;
end

% Display the final root
disp(['Approximate root:', num2str(c)]);


x = linspace(-2, 10, 1000);
y = f(x);

plot(x, y, 'LineWidth', 2);
hold on;
scatter(slopes, f(slopes), 'ro', 'filled', 'DisplayName', 'Root Estimates');
xlabel('x');
ylabel('f(x)');
title('Newton-Raphson Method');
set(gca,'fontsize',24);
legend('f(x)', 'Roots');

%tangent lines
for i = 1:size(slopes, 1)
    a = slopes(i);
    slope = df(a);
    y0 = f(a);
    tangent_line = slope * (x - a) + y0;
    plot(x, tangent_line, '-g', 'HandleVisibility', 'off');
end


