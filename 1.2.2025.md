```
function output = mandelbrot_int16()
    % Set dimensions - keep small for integer math
    width = 32;
    height = 32;
    max_iter = 32;
    
    % Scale factors for fixed-point math (12.4 fixed point)
    SCALE = int16(16);  % 2^4 for 4 fractional bits
    
    % Pre-allocate output array
    output = zeros(height, width);
    
    % Create scaled integer grid (-2 to 1 * SCALE for x, -1.5 to 1.5 * SCALE for y)
    x_start = int16(-2 * SCALE);
    x_end = int16(1 * SCALE);
    y_start = int16(-3 * SCALE/2);
    y_end = int16(3 * SCALE/2);
    
    x_step = fix((x_end - x_start) / width);
    y_step = fix((y_end - y_start) / height);
    
    % Main loop using integer math
    for y = 1:height
        for x = 1:width
            % Calculate scaled c values
            cx = int16(x_start + (x-1) * x_step);
            cy = int16(y_start + (y-1) * y_step);
            
            % Initialize z values
            zx = int16(0);
            zy = int16(0);
            iter = 0;
            
            % Iteration loop
            while (iter < max_iter)
                % Calculate z² using 16-bit integers
                % z = z² + c
                zx_temp = fix(zx * zx / SCALE) - fix(zy * zy / SCALE) + cx;
                zy = fix(2 * zx * zy / SCALE) + cy;
                zx = zx_temp;
                
                % Check if escaped (|z| > 2)
                % Use squared magnitude to avoid square root
                if (zx * zx + zy * zy) > 4 * SCALE * SCALE
                    break;
                end
                
                iter = iter + 1;
            end
            
            % Store result
            output(y, x) = iter;
        end
    end
    
    % Display result
    figure;
    imagesc(output);
    colormap(flipud(gray));  % Use inverted grayscale
    axis("square");
    axis("off");
    title("Mandelbrot Set (16-bit Integer)");
    colorbar;
    
    % Print some values for verification
    printf("Sample values from output array:\n");
    disp(output(1:5, 1:5));
    
end
```


 
```
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
```



