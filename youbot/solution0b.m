function [forwBackVel, leftRightVel, rotVel, finish] = solution0b(pts, contacts, position, orientation)
% The control loop callback function - the example solution for task 0B

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

    % get the laser contact points in sensor's coordinates
    points = [pts(1,contacts)' pts(2,contacts)'];
    % calculate the distances
    distances = (pts(1,contacts)'.^2 + pts(2,contacts)'.^2).^0.5;
    % get the closest point
    [min_value, min_index] = min(distances(:));

    % manage the states of FSM
    if strcmp(state, 'init'),
        state = 'move_forward';
        fprintf('changing FSM state to %s\n', state);
        % save the initial position
    elseif strcmp(state, 'move_forward'),
        forwBackVel = -1;
        leftRightVel = 0;
        rotVel = 0;
        if min_value < 0.5,
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
