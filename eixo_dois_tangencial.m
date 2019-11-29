%Calculo for�a tangencial e radial (normal)
%Calculo das rea��es no eixo(Radial) juntamente com os Graficos DEC e DMF
%Consideramos todas as somatorias de fy e momentos em A = 0
function eixo_dois_tangencial (Torque,Diametro_Primitivo,Diametro_Primitivo_Pinhao_par2,Distancia_centro_engrenagem,Distancia_total_eixo)

    angulo_pressao = 20; 
    phi = (angulo_pressao * pi/180);
    Ft_primeiropar = (Torque/(Diametro_Primitivo/2))
    Ft_segundopar = ((Torque*6)/(Diametro_Primitivo_Pinhao_par2/2)) %rela��o 1:6 do torque
    fprintf ('\n')
    
     %calculando as rea��es FRA e FRD (for�as nos pontos A e D)
     Frd= ((Ft_primeiropar*Distancia_centro_engrenagem)+ (Ft_segundopar*...
         (Distancia_total_eixo-Distancia_centro_engrenagem))/...
         Distancia_total_eixo)
     Fra = (Ft_primeiropar+Ft_segundopar)-Frd
     fprintf ('\n')
     %rea��o das for�as no eixo, para o primeiro trecho AB, temos a for�a
     %resultante do primeiro par de engrenagens 
     % Trecho AB pela esquerda (0<=x<=0,03)
     Frb_AB=Fra
     Momento_B=(Frb_AB*Distancia_centro_engrenagem)
     fprintf ('\n')
     %Trecho BC pela esquerda (0,03<=x<=0,09)
     Frc_AB = Fra - Ft_primeiropar
     Momento_BC = (Frc_AB *  (Distancia_total_eixo-Distancia_centro_engrenagem))
     fprintf ('\n')
     %Trecho CD pela direita (0<=x<=0,03)
     Frd_AB = -Frd
     Momento_CD= (Frd.*Distancia_centro_engrenagem)

     %Gr�fico de esfor�os do segundo eixo.
     y=[Frb_AB,Frb_AB,Frc_AB,Frc_AB,Frd_AB,Frd_AB,0];
     x=[0,Distancia_centro_engrenagem,Distancia_centro_engrenagem,...
         (Distancia_total_eixo-Distancia_centro_engrenagem),...
         (Distancia_total_eixo-Distancia_centro_engrenagem),...
         Distancia_total_eixo,Distancia_total_eixo];
     subplot(4,3,9), 
     plot(x,y); grid on;
     title('Forcas Tangencial do Segundo Eixo');
     xlabel('Comprimento em m');
     ylabel('Forcas em N');

     %Gr�fico de momento do segundo eixo.
     y1=[0,Momento_B,Momento_CD,0];
     x1=[0,Distancia_centro_engrenagem,(Distancia_total_eixo-Distancia_centro_engrenagem),Distancia_total_eixo];
     subplot(4,3,10),
     plot(x1,y1); grid on;
     title('Momentos Tangencial do Segundo Eixo');
     xlabel('Comprimento em m');
     ylabel('Momento em N.m');



end