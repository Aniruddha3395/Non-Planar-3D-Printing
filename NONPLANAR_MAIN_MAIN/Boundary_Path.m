function [bdry] = Boundary_Path(fillpts,hatch_angle,x_avg,y_avg)

% function to generate path along boundary from projected points
% INPUT: projected points on the surface (equally spaced along x and y axes)
% OUTPUT: points arranged along the boundary with their Rx and Ry value

x = fillpts(:,1);
y = fillpts(:,2);
z = fillpts(:,3);
rx =-atan(fillpts(:,5)./fillpts(:,6))*180/pi;   % Rx value for tcp
ry = atan(fillpts(:,4)./fillpts(:,6))*180/pi;   % Ry value for tcp

% figure('Name','Boundary Travel');
% scatter3(fillpts(:,1),fillpts(:,2),fillpts(:,3),'.')
hold on;
a = boundary(x,y,0.85);
% plotting boundary
% plot3(x(a),y(a),z(a),'r','LineWidth',1.5);
% figure('Name','Boundary');
% plot3(x(a),y(a),z(a),'r','LineWidth',1.5);
% storing data to write in file
bdry = [x(a),y(a),z(a),rx(a),ry(a)];
bdry = bdry(1:4:size(bdry,1),:);


%% apply hatching angle
bdry_new = rotate_pts(bdry(:,1:2),hatch_angle,x_avg,y_avg);
bdry(:,1:2) = bdry_new;
% figure;
% scatter3(bdry(:,1),bdry(:,2),bdry(:,3),'r','.')
% xlabel('x');
% ylabel('y');
% zlabel('z');
% hold on;
% plot3(bdry(:,1),bdry(:,2),bdry(:,3))
% xlabel('x');
% ylabel('y');
% zlabel('z');
% daspect([1 1 1]);


end