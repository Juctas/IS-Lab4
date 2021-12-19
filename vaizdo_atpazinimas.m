close all
clear all
clc
neuronu_sk = [5 7 13];

for j = 1:length(neuronu_sk)
    % raidžių pavyzdžių nuskaitymas ir požymių skaičiavimas
    pavadinimas = 'Raides.png';
    pozymiai_tinklo_mokymui = pozymiai_raidems_atpazinti(pavadinimas, 6);
    
    P = cell2mat(pozymiai_tinklo_mokymui);
    T = [eye(10), eye(10), eye(10), eye(10), eye(10), eye(10)];
    tinklas = newrb(P,T,0,1,neuronu_sk(j));
    P2 = P(:,11:20);
    Y2 = sim(tinklas, P2);
    [a2, b2] = max(Y2);
    raidziu_sk = size(P2,2);
    disp(raidziu_sk);
    atsakymas = [];
    
    for k = 1:raidziu_sk
        switch b2(k)
            case 1
                atsakymas = [atsakymas, 'A'];
            case 2
                atsakymas = [atsakymas, 'B'];
            case 3
                atsakymas = [atsakymas, 'L'];
            case 4
                atsakymas = [atsakymas, 'D'];
            case 5
                atsakymas = [atsakymas, 'E'];
            case 6
                atsakymas = [atsakymas, 'F'];
            case 7
                atsakymas = [atsakymas, 'O'];
            case 8
                atsakymas = [atsakymas, 'R'];
            case 9
                atsakymas = [atsakymas, 'I'];
            case 10
                atsakymas = [atsakymas, 'S'];
        end
    end
    
    fprintf("Išmoktos raidės, kai neuronų skaičius %d: %s\n", neuronu_sk(j), atsakymas);
    
    % žodžio "BROLIS" požymių išskyrimas
    pavadinimas = 'Zodis.png';
    pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);
    P2 = cell2mat(pozymiai_patikrai);
    Y2 = sim(tinklas, P2);
    [a2, b2] = max(Y2);
    raidziu_sk = size(P2,2);
    atsakymas = [];
    
    for k = 1:raidziu_sk
        switch b2(k)
            case 1
                atsakymas = [atsakymas, 'A'];
            case 2
                atsakymas = [atsakymas, 'B'];
            case 3
                atsakymas = [atsakymas, 'L'];
            case 4
                atsakymas = [atsakymas, 'D'];
            case 5
                atsakymas = [atsakymas, 'E'];
            case 6
                atsakymas = [atsakymas, 'F'];
            case 7
                atsakymas = [atsakymas, 'O'];
            case 8
                atsakymas = [atsakymas, 'R'];
            case 9
                atsakymas = [atsakymas, 'I'];
            case 10
                atsakymas = [atsakymas, 'S'];
        end
    end
    
    fprintf("Rastas žodis, kai neuronų skaičius %d: %s\n", neuronu_sk(j), atsakymas);
    figure(8), text(0.1,0.5,atsakymas,'FontSize',38), axis off
end