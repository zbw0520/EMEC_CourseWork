%cp1_vector_nonlinear=zeros(50,3,10);
for k = 1 : 50
    for j = 1:11
    construct_actuator
    mi_setcurrent('winding_1',j-1);   %set current to 10A
    mi_setcurrent('winding_2',j-1);   %set current to 10A question: what is the dimension of the length in femm

    mi_selectgroup(2);
    mi_movetranslate((k/10)-5,0);  %in open mode:(0,0) in closed mode:(-4.9,0)
    mi_clearselected();

    mi_createmesh();    %create mesh
    mi_analyse();       %analyse the problem
    mi_loadsolution();  %load the result

    cp1=mo_getcircuitproperties('winding_1');
    cp1_vector_nonlinear(k,:,j)=cp1;
    end
%generate coernergy data
%     construct_actuator;
%     mi_setcurrent('winding_1',10);
%     mi_setcurrent('winding_2',10);
%     mi_selectgroup(2);
%     mi_movetranslate((k/10)-5,0);
%     mi_clearselected();
%     mi_createmesh();    %create mesh
%     mi_analyse();       %analyse the problem
%     mi_loadsolution();  %load the result
%     mo_groupselectblock();
%     Ec(k)=mo_blockintegral(17)/2;
%     mo_clearblock();
end

cp1_vector_linear=zeros(50,3,10);
for k = 1 : 50
    for j = 1:11
    construct_actuator_linear
    mi_setcurrent('winding_1',j-1);   %set current to 10A
    mi_setcurrent('winding_2',j-1);   %set current to 10A question: what is the dimension of the length in femm

    mi_selectgroup(2);
    mi_movetranslate((k/10)-5,0);  %in open mode:(0,0) in closed mode:(-4.9,0)
    mi_clearselected();

    mi_createmesh();    %create mesh
    mi_analyse();       %analyse the problem
    mi_loadsolution();  %load the result

    cp1=mo_getcircuitproperties('winding_1');
    cp1_vector_linear(k,:,j)=cp1;
    end
end