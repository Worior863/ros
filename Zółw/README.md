Turtlesim - sterowanie żółwiem
Projekt polegał na zaprojektowaniu sterowania dla żółwia(narzędzie turtlesim) poprzez ROS(Robot Operating System) z użyciem MATLABa.
Przygotowano 4 rodzaje ruchu:
- jazda po kole,
- jazda po spirali,
- jazda po sinusoidzie,
- jazda z aktualnego punktu do zadanego punktu.
Będą one prezentowane jedna po drugiej.

Turtlesim jest narzędziem stworzonym do nauki korzystania z ROSa oraz pakietów ROSa.

Korzystaliśmy z ROSa w wersji Melodic Morenia oraz MATLABa 2019b.

Instrukcja:
1. Otworzyć okno terminalu i wpisać komendę "roscore"(jeśli ROS i MATLAB nie są zainstalowane na tej samej maszynie to terminal z komendą "roscore" należy otworzyć na maszynie, gdzie znajduje się ROS)
2. Otworzyć kolejne okno terminalu i wpisać komendę "rosrun turtlesim turtlesim_node" , powinno pojawić się nowe okno z niebieską planszą, na środku której powinien być żółw(jego wygląd jest losowy)
3. Otworzyć przygotowany plik "turtlesim.m" w MATLABie.
4. Połączyć MATLABa z ROSem

a) jeśli ROS oraz MATLAB są zainstalowane na tej samej maszynie: w Command Window MATLABa należy wpisać komendę "rosinit", w kodzie      należy też pominąć dwie pierwsze linijki w sekcji init(te zaczynające się od "setnev")
b) jeśli ROS oraz MATLAB nie są zainstalowane na tej samej maszynie (np. ROS na maszynie wirtualnej a MATLAB na głównym systemie)  należy wpierw skonfigurować adresy IP edytując je w kodzie na początku sekcji init, potem wpisać w Command Window MATLABa komendę "rosinit"

5. Sprawdzić połączenie poprzez wpisanie komendy rostopic list w Command Window MATLABa. Jeśli udało się nawiązać połączenie, lista powinna posiadać więcej niż 2 pozycje(rosout, rosshutdown)
6. Odpalić kod pliku "turtlesim.m"

Aby zakończyć należy wpisać w terminalu Matlab komendę rosshutdown oraz zamknąć wszystkie terminale.

