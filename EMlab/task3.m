construct_actuator;
mi_setcurrent('winding_1',10);%set current in winding_1 to 10A
mi_setcurrent('winding_2',10);%set current in winding_2 to 10A
mi_analyse();
mi_loadsolution();
%-------get two windings' current, applied voltage and flux linkage---------------
cp1=mo_getcircuitproperties('winding_1');
cp2=mo_getcircuitproperties('winding_2');
%--------measure the cross-section Aw--------------
mo_groupselectblock(coil1p(1,3));
A=mo_blockintegral(5);
mo_clearblock();
%--------measure the voltage of the area-----------
mo_groupselectblock(coil1p(1,3));
V=mo_blockintegral(10);
mo_clearblock();
%-------calculate the active length l by l=V/A-----
l=V/A;
%-------calculate the winding resistance by R=cp1(1,2)(voltage)/cp1(1,1)(current)------
R=cp1(1,2)/cp1(1,1);
