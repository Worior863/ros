# ros
Robot Operating System

Plik turtlesim.m zawiera przykladowy program, za pomoca ktorego pokazano mozliwosci narzedzia turtlesim. 
Proces komunikacji miedzy Matlabem, a Linuxem zawarta jest w sekcji init. 

Docelowo program uruchamiany byl na maszynie wirtualnej, wiec nalezy skonfigurowac adresy IP.

>>Uruchomienie z maszyna wirtualna
Aby uruchomic "zolwia" nalezy wlaczyc dwa terminale w linuxie (maszyna wirtualna) oraz matlaba na windowsie.
Nastepnie w pierwszym terminalu ubuntu wpisac komende roscore. 
Po tym w matlabie mozna uruchomic dwie komendy setenv i rosinit w terminale.

W drugim terminale ubuntu wpisac rosrun turtlesim turtlesim_node.

Aby sprawdzic, czy nawiazalismy polaczenie mozna wpisac komende rostopic list.
Jezeli udalo sie nawiazac polaczenie, lista bedzie zawierala wiecej niz 2 pozycje (rosout, rosshutdown).

Aby zakonczyc nalezy wpisac w terminalu Matlab komende rosshutdown oraz zamknac wszystkie terminale w linuxie.


