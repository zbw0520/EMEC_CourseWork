construct_actuator;

%---------uncomment the following code to get meshed result----------------
% mi_selectsegment(19,0);
% mi_setsegmentprop('<None>', 0.5, 0, 0, corep(1,3));
% mi_clearselected();
% mi_selectsegment(25,0);
% mi_setsegmentprop('<None>', 0.5, 0, 0, moverp(1,3));
% mi_clearselected();
%--------------------------------------------------------------------------
mi_createmesh();    %create mesh