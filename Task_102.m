
a = 1; %interval, where the possible root lies.
b = 3;

tolerance = 1e-6;

roots = [];

f = @(x) x.^3 - 4.*x - 9;  % the function

while (b - a) > tolerance
    c = (a + b) / 2;
    roots = [roots; c]; % Stores the root in the matrix
    if f(c) == 0
        break;
    elseif f(a) * f(c) < 0
        b = c;
    else
        a = c;
    end
end

% Plot the equation and the roots
x = linspace(-4, 10, 1000);
y = f(x);
plot(x, y, 'b', 'LineWidth', 2);
hold on;
plot(roots, f(roots), '-ro', 'MarkerSize', 8);
xlabel('x');
ylabel('f(x)');
title('Bisection Method');
set(gca,'fontsize',24);
legend('f(x)', 'Roots');
grid on;
hold off;

% Display the final root
disp(['Approximate root: ' num2str(c)]);

