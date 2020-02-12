**Robot przenoszący puszkę z jednego punktu do drugiego**
--
Robot miał za zadanie podnieść puszkę ze stołu i przenieść ją w inne miejsce na stole.

Wykorzystywane programy i środowiska:

-ROS Melodic

-MATLAB 2019b

-Gazebo

Do wykonania projektu wykorzystaliśmy robota PR2 produkcji firmy Willow Garage.
Przygotowano też dwa modele, które należy wykorzystać w programie Gazebo pod nazwą Puszka oraz Stolik.
Te pliki, jako skompresowane, znajdują się w repozytorium w folderze ROBOT. Należy je rozpakować.

**Instrukcja**
--
**Przygotowanie środowiska i oprogramowania:**


1. Zainstalować symulator PR2 przekopiowując pliki z repozytorium i instalując potrzebne komponenty. Sekwencja komend wygląda następująco:

    cd src

    git clone https://github.com/PR2/pr2_simulator.git

    cd ..

    catkin_make


    cd src

    git clone https://github.com/PR2/pr2_apps.git

    sudo apt-get install ros-melodic-pr2-apps


2. MATLAB powinien posiadać dodatki:

     - ROS Toolbox

     - Robotics System Toolbox

**Symulacja:**


1. Uruchomić ROS oraz Gazebo, najpierw pusty projekt, a potem samego robota

   Kolejność komend(każda komenda w osobnym terminalu):

   roscore

   roslaunch gazebo_ros empty_world.launch

   roslaunch pr2_gazebo pr2.launch


2. Kiedy robot pojawi się w programie należy postawić przed nim stół oraz puszkę
•	Należy użyć modelu stołu, który został dołączony do repozytorium o nazwie "Stolik.zip"(należy wskazać Gazebo w zakładce "Insert" do niego ścieżkę, gdzie został umieszczony rozpakowany folder Stolik)
•	Puszka, którą trzeba użyć znajdzie się w repozytorium pod nazwą "Puszka.zip"(należy w Gazebo w zakładce "Insert" wskazać do niego ścieżkę, gdzie został umieszczony rozpakowany folder Stolik) 
•	Puszkę należy położyć na pozycji X=0,6 Y=-0,5 Z=0,480607 Roll=0 Pitch=0 Yaw=0 (klikając na puszkę i odwijając pasek "Pose"
•	Stół natomiast umieścić tak, by puszka znajdowała się blisko jego krawędzi, która jest najbliżej robota

  3. W MATLABie w Command window należy wpisać komendę "rosinit" i sprawdzić połączenie komendą "rostopic list". Odpalić skrypt znajdujący się w repozytorium pod nazwą „Robot.m” (MATLAB oraz Gazebo zostały zainstalowane na jednym systemie operacyjnym) I przenieść wzrok na Gazebo(pamiętać by wystartować symulację w Gazebo)


Robot powinien prawą rękę ustawić w pozycję wyjściową, a następnie etapowo kierować się w kierunku puszki pokonując kolejne zadane punkty, złapać puszkę, podnieść ją oraz przenieść ją o 0,5 jednostek w lewą stronę i 0,1 jednostek do przodu, puścić ją, a na koniec powrócić do pozycji wyjściowej.
