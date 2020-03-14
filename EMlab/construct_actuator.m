%--Arthur: created by Bowen Zhang
%--date: 11/2/2020
%--version: 1.0
%------parameter settings-----------------------
meshsize_segment =1.5;%mesh size around 1 is appropriate
automesh_segment = 1;
hide_segment = 0;
meshsize_block = 1.5;%mesh size around 1 is appropriate
automesh_block = 1;
magdir_block = 0;
addpath(genpath('C:\femm42'));  %add the necessary path to Matlab
openfemm();     %confirm the successful link
opendocument('femm_template.FEM');  %open your .FEM file
mi_saveas('temp.fem');
%------add nodes defined in the corep.mat------
load('corep.mat');  
mi_addnode(corep(:,1),corep(:,2));
for i=1:length(corep)
    mi_selectnode(corep(i,1),corep(i,2));
    mi_setnodeprop('<corep>',corep(i,3));
    mi_clearselected();
end
%-----add nodes defined in the coil1p.mat------
load('coil1p.mat');
mi_addnode(coil1p(:,1),coil1p(:,2));
for i=1:length(coil1p)
    mi_selectnode(coil1p(i,1),coil1p(i,2));
    mi_setnodeprop('<coil1p>',coil1p(i,3));
    mi_clearselected();
end
%------add nodes defined in the coil2p.mat------
load('coil2p.mat');
mi_addnode(coil2p(:,1),coil2p(:,2));
for i=1:length(coil2p)
    mi_selectnode(coil2p(i,1),coil2p(i,2));
    mi_setnodeprop('<coil2p>',coil2p(i,3));
    mi_clearselected();
end
%-----add nodes defined in the coil3p.mat------
load('coil3p.mat');
mi_addnode(coil3p(:,1),coil3p(:,2));
for i=1:length(coil3p)
    mi_selectnode(coil3p(i,1),coil3p(i,2));
    mi_setnodeprop('<coil3p>',coil3p(i,3));
    mi_clearselected();
end
%------add nodes defined in the coil4p.mat-----
load('coil4p.mat');
mi_addnode(coil4p(:,1),coil4p(:,2));
for i=1:length(coil4p)
    mi_selectnode(coil4p(i,1),coil4p(i,2));
    mi_setnodeprop('<coil4p>',coil4p(i,3));
    mi_clearselected();
end
%-------add nodes defined in the moverp.mat--------
load('moverp.mat');
mi_addnode(moverp(:,1),moverp(:,2));
for i=1:length(moverp)
    mi_selectnode(moverp(i,1),moverp(i,2));
    mi_setnodeprop('<moverp>',moverp(i,3));
    mi_clearselected();
end
%------add segments defined by nodes of corep.mat--------
for i=1:11
    mi_addsegment(corep(i,1),corep(i,2),corep(i+1,1),corep(i+1,2));
    mi_selectsegment((corep(i+1,1)+corep(i,1))/2,(corep(i,2)+corep(i+1,2))/2);
    mi_setsegmentprop('<corep>',meshsize_segment,automesh_segment,hide_segment,corep(i,3));
    mi_clearselected();
end
%connect the first node and the last node
mi_addsegment(corep(1,1),corep(1,2),corep(12,1),corep(12,2));
mi_selectsegment((corep(1,1)+corep(12,1))/2,(corep(1,2)+corep(12,2))/2);
mi_setsegmentprop('<corep>',meshsize_segment,automesh_segment,hide_segment,corep(1,3));
mi_clearselected();
%-------add segments defined by nodes of coil1p.mat------
for i=1:3
    mi_addsegment(coil1p(i,1),coil1p(i,2),coil1p(i+1,1),coil1p(i+1,2));
    mi_selectsegment((coil1p(i+1,1)+coil1p(i,1))/2,(coil1p(i,2)+coil1p(i+1,2))/2);
    mi_setsegmentprop('<winding1>',meshsize_segment,automesh_segment,hide_segment,coil1p(i,3));
    mi_clearselected();
end
%connect the first node and the last node
mi_addsegment(coil1p(1,1),coil1p(1,2),coil1p(4,1),coil1p(4,2));
mi_selectsegment((coil1p(1,1)+coil1p(4,1))/2,(coil1p(1,2)+coil1p(4,2))/2);
mi_setsegmentprop('<winding1>',meshsize_segment,automesh_segment,hide_segment,coil1p(1,3));
mi_clearselected();
%------add segments defined by nodes of coil2p.mat------
for i=1:3
    mi_addsegment(coil2p(i,1),coil2p(i,2),coil2p(i+1,1),coil2p(i+1,2));
    mi_selectsegment((coil2p(i+1,1)+coil2p(i,1))/2,(coil2p(i,2)+coil2p(i+1,2))/2);
    mi_setsegmentprop('<winding2>',meshsize_segment,automesh_segment,hide_segment,coil2p(i,3));
    mi_clearselected();
end
%connect the first node and the last node
mi_addsegment(coil2p(1,1),coil2p(1,2),coil2p(4,1),coil2p(4,2));
mi_selectsegment((coil2p(1,1)+coil2p(4,1))/2,(coil2p(1,2)+coil2p(4,2))/2);
mi_setsegmentprop('<winding2>',meshsize_segment,automesh_segment,hide_segment,coil2p(1,3));
mi_clearselected();
%------add segments defined by nodes of coil3p.mat-------
for i=1:3
    mi_addsegment(coil3p(i,1),coil3p(i,2),coil3p(i+1,1),coil3p(i+1,2));
    mi_selectsegment((coil3p(i+1,1)+coil3p(i,1))/2,(coil3p(i,2)+coil3p(i+1,2))/2);
    mi_setsegmentprop('<winding3>',meshsize_segment,automesh_segment,hide_segment,coil3p(i,3));
    mi_clearselected();
end
%connect the first node and the last node
mi_addsegment(coil3p(1,1),coil3p(1,2),coil3p(4,1),coil3p(4,2));
mi_selectsegment((coil3p(1,1)+coil3p(4,1))/2,(coil3p(1,2)+coil3p(4,2))/2);
mi_setsegmentprop('<winding3>',meshsize_segment,automesh_segment,hide_segment,coil3p(1,3));
mi_clearselected();
%------add segments defined by nodes of coil4p.mat------
for i=1:3
    mi_addsegment(coil4p(i,1),coil4p(i,2),coil4p(i+1,1),coil4p(i+1,2));
    mi_selectsegment((coil4p(i+1,1)+coil4p(i,1))/2,(coil4p(i,2)+coil4p(i+1,2))/2);
    mi_setsegmentprop('<winding4>',meshsize_segment,automesh_segment,hide_segment,coil4p(i,3));
    mi_clearselected();
end
%connect the first node and the last node
mi_addsegment(coil4p(1,1),coil4p(1,2),coil4p(4,1),coil4p(4,2));
mi_selectsegment((coil4p(1,1)+coil4p(4,1))/2,(coil4p(1,2)+coil4p(4,2))/2);
mi_setsegmentprop('<winding4>',meshsize_segment,automesh_segment,hide_segment,coil4p(1,3));
mi_clearselected();
%------add segments defined by nodes of moverp.mat-------
for i=1:3
    mi_addsegment(moverp(i,1),moverp(i,2),moverp(i+1,1),moverp(i+1,2));
    mi_selectsegment((moverp(i+1,1)+moverp(i,1))/2,(moverp(i,2)+moverp(i+1,2))/2);
    mi_setsegmentprop('<moverp>',meshsize_segment,automesh_segment,hide_segment,moverp(i,3));
    mi_clearselected();
end
%connect the first node and the last node
mi_addsegment(moverp(1,1),moverp(1,2),moverp(4,1),moverp(4,2));
mi_selectsegment((moverp(1,1)+moverp(4,1))/2,(moverp(1,2)+moverp(4,2))/2);
mi_setsegmentprop('<moverp>',meshsize_segment,automesh_segment,hide_segment,moverp(1,3));
mi_clearselected();
%--------------------------------------------
mi_makeABC();
%----------add block label to the air---------
mi_addblocklabel(-10,0);
mi_selectlabel(-10,0);
mi_setblockprop('air',automesh_block,meshsize_block,'<None>',magdir_block,7,0); %set winding to zero
mi_clearselected();
%---------add block label to the core---------
mi_addblocklabel(10,0);
mi_selectlabel(10,0);
mi_setblockprop('core_nonlinear',automesh_block,meshsize_block,'<None>',magdir_block,corep(1,3),0);%set winding to zero
mi_clearselected();
%--------add block label to the actuator--------
mi_addblocklabel(70,0);
mi_selectlabel(70,0);
mi_setblockprop('core_nonlinear',automesh_block,meshsize_block,'<None>',magdir_block,moverp(1,3),0);%set winding to zero
mi_clearselected();
%-------add block label to the coil4p---------
mi_addblocklabel(45,64);
mi_selectlabel(45,64);
mi_setblockprop('copper',automesh_block,meshsize_block,'winding_2',magdir_block,coil4p(1,3),-100);%set winding to -100
mi_clearselected();
%-------add block label to the coil3p---------
mi_addblocklabel(45,30);
mi_selectlabel(45,30);
mi_setblockprop('copper',automesh_block,meshsize_block,'winding_2',magdir_block,coil3p(1,3),100);%set winding to 100
mi_clearselected();
%-------add block label to the coil2p---------
mi_addblocklabel(45,-30);
mi_selectlabel(45,-30);
mi_setblockprop('copper',automesh_block,meshsize_block,'winding_1',magdir_block,coil2p(1,3),-100);%set winding to -100
mi_clearselected();
%-------add block label to the coil1p---------
mi_addblocklabel(45,-64);
mi_selectlabel(45,-64);
mi_setblockprop('copper',automesh_block,meshsize_block,'winding_1',magdir_block,coil1p(1,3),100);%set winding to 100
mi_clearselected();
%-----create mesh, analyze the question and load solution in FEMM-----
% mi_createmesh();    %create mesh
% mi_analyse();       %analyse the problem
% mi_loadsolution();  %load the result
%-comment the above three if you are using construct_actuator in psi-I plot--
