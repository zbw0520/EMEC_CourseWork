%--Arthur: created by Bowen Zhang
%--date: 11/2/2020
%--version: 1.0
%---------------closed--------------------------------------------------
cp1_vector_closed=zeros(3,10);
for j = 1:11
construct_actuator
mi_setcurrent('winding_1',j-1);   %set current to 10A
mi_setcurrent('winding_2',j-1);   %set current to 10A question: what is the dimension of the length in femm

mi_selectsegment(19,0);
mi_setsegmentprop('<None>', 0.5, 0, 0, 1);
mi_clearselected();
mi_selectsegment(25,0);
mi_setsegmentprop('<None>', 0.5, 0, 0, 2);
mi_clearselected();

mi_selectgroup(2);
mi_movetranslate(-4.9,0);  %in open mode:(0,0) in closed mode:(-4.9,0)
mi_clearselected();

mi_createmesh();    %create mesh
mi_analyse();       %analyse the problem
mi_loadsolution();  %load the result



cp1=mo_getcircuitproperties('winding_1');
cp1_vector_closed(:,j)=cp1;
end
plot(cp1_vector_closed(1,:),cp1_vector_closed(3,:))
hold on;
%-------------------------------------------------------------------------
cp1_vector_open=zeros(3,10);

for j = 1:11
construct_actuator
mi_setcurrent('winding_1',j-1);   %set current to 10A
mi_setcurrent('winding_2',j-1);   %set current to 10A question: what is the dimension of the length in femm

mi_selectsegment(19,0);
mi_setsegmentprop('<None>', 0.5, 0, 0, 1);
mi_clearselected();
mi_selectsegment(25,0);
mi_setsegmentprop('<None>', 0.5, 0, 0, 2);
mi_clearselected();

mi_selectgroup(2);
mi_movetranslate(0,0);  %in open mode:(0,0) in closed mode:(-4.9,0)
mi_clearselected();

mi_createmesh();    %create mesh
mi_analyse();       %analyse the problem
mi_loadsolution();  %load the result



cp1=mo_getcircuitproperties('winding_1');
cp1_vector_open(:,j)=cp1;
end
plot(cp1_vector_open(1,:),cp1_vector_open(3,:))

Eelec_closed=trapz(cp1_vector_closed(3,:),cp1_vector_closed(1,:))*2;
Eelec_open=trapz(cp1_vector_open(3,:),cp1_vector_open(1,:))*2;
Eelec_difference=Eelec_closed-Eelec_open;