%Funcao para calculo de pares "coroa - pinhao".
%retorna o torque e o diametro primitivo do pinhao.
%Para retornar mais valores calculados, adicionar variaveis no array 'ret'.

function ret = CalculaParEngr(modulo, potencia_motor, numero_dentes_pinhao, velocidade_motor_RPM, relacao_um_para_x)

    Pcp = (modulo*pi);                                                   %c�lculo de passo circular do par.
    pdp = (1/modulo);                                                    %c�lculo do passo diametral do par.
    Dp_Pinhao = modulo*numero_dentes_pinhao;                             %c�lculo de di�metro primitivo do pinh�o.
    De_pinhao = (Dp_Pinhao+(2*modulo));                                  %c�lculo do di�metro externo do pinh�o.
    H_pinhao_pinhao = (modulo+(1/6)*modulo);                             %c�lculo da altura do p� do dente do pinh�o;
    Di_pinhao = (Dp_Pinhao-2*H_pinhao_pinhao);                           %c�lculo do di�metro interno do pinh�o.
    H_pinhao = (2*modulo+(1/6)*modulo);                                  %c�lculo da altura do dente do pinh�o.
    Adendo_Pinhao = 1*modulo;                                            %c�lculo de adendo do pinh�o.
    Dedendo_Pinhao = 1.25*modulo;                                        %c�lculo de dedendo do pinh�o.
    lmip = 6*modulo;                                                     %c�lculo de lar_coroaura m�nima da en_coroarena_coroaem
    lmap = 10*modulo;                                                    %c�lculo da lar_coroaura m�xima da en_coroarena_coroaem
    N_coroa = relacao_um_para_x*numero_dentes_pinhao;                    %c�lculo do n�mero de dentes da coroa.
    dp_coroa = modulo*N_coroa;                                           %c�lculo de di�metro primitivo da coroa.
    de_coroa = (dp_coroa+(2*modulo));                                    %c�lculo do di�metro externo da coroa.
    H_pinhao_coroa = (modulo+(1/6)*modulo);                              %c�lculo da altura do p� do dente da coroa.
    di_coroa = (dp_coroa-2*H_pinhao_coroa);                              %c�lculo do di�metro interno da coroa.
    h_coroa = (2*modulo+(1/6)*modulo);                                   %c�lculo da altura do dente da coroa.
    ad_coroa = 1*modulo;                                                 %c�lculo de adendo da coroa.
    dd_coroa = 1.25*modulo;                                              %c�lculo de dedendo da coroa.
    lmi_coroa = 6*modulo;                                                %c�lculo de lar_coroaura m�nima da en_coroarena_coroaem
    lma_coroa = 10*modulo;                                               %c�lculo da lar_coroaura m�xima da en_coroarena_coroaem
    velocidade_motor_hertz = velocidade_motor_RPM/60;                    %velocidade do motor em Hz.
    V = (pi*(Dp_Pinhao/1000)*velocidade_motor_RPM)/60;                   %velocidade linear do pinh�o.
    Wt = (60000*potencia_motor)/(pi*Dp_Pinhao*velocidade_motor_RPM);     %car_coroaa transmitida do pinh�o.
    Kv = (6.1+V)/6.1;                                                    %fator din�mico do pinh�o.
    Tp = (Wt*1000)*((Dp_Pinhao/1000)/2);                                 %c�lculo de torque do pinh�o.
    T_coroa = Tp*relacao_um_para_x;                                      %c�lculo de torque da coroa, com o _coroaanho de 2 do torque do pinh�o.
    w1 = (V*2)/Dp_Pinhao;                                                %c�lculo de velocidade an_coroaular do pinh�o.
    w2 = (V*2)/dp_coroa;                                                 %c�lculo de velocidade an_coroaular da coroa.
    nf = velocidade_motor_RPM/relacao_um_para_x;                         %c�lculo de rpm final do primeiro par, � a metade por dobrar o di�metro das en_coroarena_coroaens

    ret = [Tp, Dp_Pinhao]; 
    
    format short;
    
    fprintf ('\nPasso circular do par = %f \n',Pcp)
    fprintf ('Passo diametral do par = %f dentes/mm\n \n',pdp)
    
    fprintf ('\n----------------------------<< PINH�O >>----------------------------\n\n')
    
    fprintf ('Di�metro primitivo = %f mm\n',Dp_Pinhao)
    fprintf ('Di�metro externo = %f mm\n',De_pinhao)
    fprintf ('Di�metro interno = %f mm\n',Di_pinhao)
    fprintf ('Altura do p� do dente = %f mm\n',H_pinhao_pinhao)
    fprintf ('Altura do dente = %f mm\n',H_pinhao)
    fprintf ('Adendo = %f mm\n',Adendo_Pinhao)
    fprintf ('Dedendo = %f mm\n',Dedendo_Pinhao)
    fprintf ('Largura m�nima = %f mm\n',lmip)
    fprintf ('Largura m�xima = %f mm\n',lmap)
    fprintf ('Velocidade = %f m/s\n',V)
    fprintf ('Carga transmitida = %f kN\n',Wt)
    fprintf ('Fator din�mico = %f \n',Kv)
    fprintf ('Torque = %f N.m\n',Tp)
    fprintf ('Velocidade angular = %f rad/s\n',w1)
    
    fprintf ('\n----------------------------<< COROA >>----------------------------\n\n')
    
    fprintf ('N�mero de dentes = %d dentes\n',N_coroa)
    fprintf ('Di�metro primitivo = %f mm\n',dp_coroa)
    fprintf ('Di�metro externo = %f mm\n',de_coroa)
    fprintf ('Di�metro interno = %f mm\n',di_coroa)
    fprintf ('Altura do p� do dente = %f mm\n',H_pinhao_coroa)
    fprintf ('Altura do dente = %f mm\n',H_pinhao)
    fprintf ('Adendo = %f mm\n',ad_coroa)
    fprintf ('Dedendo = %f mm\n',dd_coroa)
    fprintf ('Largura m�nima = %f mm\n',lmi_coroa)
    fprintf ('Largura m�xima = %f mm\n',lma_coroa)
    fprintf ('Torque = %f N.m\n',T_coroa)
    fprintf ('Velocidade angular = %f rad/s\n',w2)
    fprintf ('Rota��o = %f rpm\n\n',nf)
    
endfunction









