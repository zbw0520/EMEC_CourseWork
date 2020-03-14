plot(cp1_vector_open(1,:),cp1_vector_open(3,:));
hold on;
plot(cp1_vector_closed(1,:),cp1_vector_closed(3,:));

Eelec_closed=trapz(cp1_vector_closed(3,:),cp1_vector_closed(1,:))*2;
Eelec_open=trapz(cp1_vector_open(3,:),cp1_vector_open(1,:))*2;
dif_Eelec=(cp1_vector_closed(3,11)-cp1_vector_open(3,11))*10*2;
dif_Emech=dif_Eelec+Eelec_open-Eelec_closed;
force=dif_Emech/4.9;