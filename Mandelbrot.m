% Mandelbrot Set Visualization
function mandelbrot()
    % Set dimensions
    width = 1000;
    height = 1000;
    max_iter = 100;
    
    % Create complex plane
    [x, y] = meshgrid(linspace(-2, 1, width), linspace(-1.5, 1.5, height));
    c = x + 1i * y;
    z = zeros(size(c));
    output = zeros(size(c));
    
    % Main loop
    for n = 1:max_iter
        % Update z = z^2 + c
        z = z.^2 + c;
        
        % Find points that haven't escaped yet
        escaped = abs(z) > 2;
        new_points = escaped & (output == 0);
        output(new_points) = n;
        
        % Skip points that have already escaped
        z(escaped) = 2;
    end
    
    % Normalize and display
    output(output == 0) = max_iter;
    output = log(output);
    
    % Create figure with black background
    figure('Color', 'black');
    
    % Plot with custom colormap
    imagesc(linspace(-2, 1, width), linspace(-1.5, 1.5, height), output);
    colormap(getColormap());
    axis equal;
    axis off;
    title('Mandelbrot Set', 'Color', 'white');
    
    % Add color bar
    colorbar;
end

function cmap = getColormap()
    % Create a custom colormap
    steps = 256;
    cmap = zeros(steps, 3);
    
    % Generate colors
    for i = 1:steps
        phase = i/steps;
        cmap(i,:) = [
            0.5 * (1 + sin(2*pi*3*phase)),
            0.5 * (1 + sin(2*pi*3*phase + 2*pi/3)),
            0.5 * (1 + sin(2*pi*3*phase + 4*pi/3))
        ];
    end
    
    % Make the center of the set black
    cmap(end,:) = [0 0 0];
end