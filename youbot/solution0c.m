function [forwBackVel, leftRightVel, rotVel, finish] = solution0c(pts, contacts, position, orientation)
% The control loop callback function - the example solution for task 0C

    % declare the persistent variable that keeps the state of the Finite
    % State Machine (FSM)
    persistent state;
    if isempty(state),
        % the initial state of the FSM is 'init'
        state = 'init';
    end

    % initialize the robot control variables (returned by this function)
    finish = false;
    forwBackVel = 0;
    leftRightVel = 0;
    rotVel = 0;

    % process the LIDAR sensor data
    % get the laser contact points in sensor's coordinates
    points = [pts(1,contacts)' pts(2,contacts)'];
    % calculate the distances
    distances = (pts(1,contacts)'.^2 + pts(2,contacts)'.^2).^0.5;
    % get the closest point
    [min_value, min_index] = min(distances(:));

    % manage the states of FSM
    if strcmp(state, 'init'),
        state = 'rotate';
        fprintf('changing FSM state to %s\n', state);
    elseif strcmp(state, 'rotate'),
        % set the linear velocity to zero
        forwBackVel = 0;
        leftRightVel = 0;
        
        % calculate the angle to the closest point
        closest_angle = atan2(points(min_index,1),-points(min_index,2));
        % a simple proportional regulator (P) with limited output
        % for robot orientation
        rotVel = 10 * closest_angle;
        if rotVel > 0.5,
            rotVel = 0.5;
        end
        if rotVel < -0.5,
            rotVel = -0.5;
        end
        % if the closest obstacle is in front of the robot, then stop
        if abs(rad2deg(closest_angle)) < 2,
            state = 'stop';
            fprintf('changing FSM state to %s\n', state);
        end
    elseif strcmp(state, 'stop'),
        forwBackVel = 0;
        leftRightVel = 0;
        rotVel = 0;
        state = 'finish';
        fprintf('changing FSM state to %s\n', state);
    elseif strcmp(state, 'finish'),
        finish = true;
        disp('finished');
    else
        error('Unknown state %s.\n', state);
    end
end
