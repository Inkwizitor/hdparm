.\" {PTM/PB/0.1/02-02-1999/"pobierz/ustaw parametry dysku twardego"}
.\" Updated to version 4.1 2001 Andrzej M. Krzysztofowicz <ankry@pld.org.pl>
.\" Translation 1999,2000 Przemek Borys <pborys@dione.ids.pl>
.\" Huh... to by� trudny kawa�ek tekstu ;)
.TH HDPARM 8 "Marzec 2001" "Wersja 4.1"

.SH NAZWA
hdparm \- pobierz/ustaw parametry dysku twardego
.SH SK�ADNIA
.B hdparm
[ opcje ] [urz�dzenie] ..
.SH OPIS
.BI hdparm
daje interfejs linii polece� do r�nych ioctli dysk�w twardych
obs�ugiwanych przez podsystem sterownika ATA/IDE. Niekt�re opcje mog�
dzia�a� prawid�owo tylko z najnowszymi j�drami. Aby uzyska� najlepsze wyniki,
nale�y skompilowa� hdparm z plikami nagl�wkowymi pochodz�cymi ze �r�de�
najnowszego j�dra.
.SH OPCJE
Bez opcji, zak�ada si�
.IR -acdgkmnru .
.TP
.I -a 
Pobierz/ustaw wska�nik odczytu z wyprzedzeniem (read-ahead) systemu plik�w. 
Jest to u�ywane do
zwi�kszania wydajno�ci w sekwencyjnych odczytach du�ych plik�w poprzez
pobieranie dodatkowych blok�w, w nadziei, �e b�d� potrzebne danemu
zadaniu. W obecnej wersji j�dra (2.0.10) domy�lnym ustawieniem tej opcji
jest 8 sektor�w (4KB). Warto�� ta wydaje si� by� dobra dla wi�kszo�ci
zastosowa�, lecz w systemach, gdzie w wi�kszo�ci u�ywa si� losowych
repozycjowa� plikowych, ustawienie mniejszej warto�ci mo�e zapewni� lepsz�
wydajno��. Poza tym, wiele sterownik�w IDE ma tak�e wbudowane oddzielne
funkcje tego typu, kt�re w wielu sytuacjach niweluj� potrzeb� odczytu
z wyprzedzeniem przez system plik�w.
.TP
.I -A
W��cz/wy��cz w�a�ciwo�� odczytu wyprzedzaj�cego (read-lookahead) 
nap�du IDE (zwykle domy�lnie ON -- w��czon�).
.TP
.I -B
Odczytaj ustawienie dla w�a�ciwo�ci Zaawansowanego Zarza�dzania Energi� (APM),
o ile nap�d posiada wspomaganie dla niej.
.TP
.I -c
Zapytaj/w��cz obs�ug� 32-bitowego I/O w (E)IDE. Mo�na u�y� numerycznego
parametru w��czaj�cego/wy��czaj�cego obs�ug�:
Obecnie obs�ugiwane warto�ci zawieraj�
.I 0
dla wy��czenia obs�ugi 32-bitowego I/O,
.I 1
dla w��czenia 32-bitowej transmisji danych,
.I 3
dla w��czenia 32-bitowej transmisji danych ze specjaln� sekwencj�
.I sync
wymagan� przez wiele chipset�w. Warto��
.I 3
dzia�a z prawie wszystkimi 32-bitowymi chipsetami IDE, lecz nara�a na
dodatkowe koszty. Zauwa�, �e "32-bit" odnosi si� do transmisji poprzez
magistral� PCI lub VLB, ale tylko do karty interfejsu; wszystkie nap�dy
(E)IDE maj� wci�� tylko 16-bitowe po��czenie z kart� interfejsu.
.TP
.I -C
Sprawd� obecny stan trybu zasilania IDE. Jest on zawsze jednym z
.B unknown
(dysk nie obs�uguje tego polecenia),
.B active/idle
(normalne dzia�anie),
.B standby
(tryb oszcz�dzania energii, dysk si� zatrzyma�),
lub
.B sleeping
(najni�szy tryb oszcz�dzania energii, dysk jest ca�kowicie wy��czony).
Za pomoc� opcji
.BR -S ,
.BR -y ,
.BR -Y ,
i
.B -Z
mo�na manipulowa� trybami zasilania IDE.
.TP
.I -d
W��cz/wy��cz flag� "using_dma" (u�ywaj�cy DMA) dla tego nap�du. Opcja ta 
dzia�a tylko z kilkoma kombinacjami nap�d�w i interfejs�w, kt�re obs�uguj� DMA, 
i kt�re s� znane sterownikowi IDE (oraz ze wszystkimi obs�ugiwanymi sterownikami
XT). Praktycznie, dla zarz�dzanych przez magistral� operacji DMA dla wielu
nap�d�w obs�ugiwany jest (eksperymentalnie) chipset Intel Triton.
Dobrym pomys�em jest r�wnie� u�ywanie opcji
.I -X34
w po��czeniu z
.IR -d1 .
aby zapewni�, �e sam nap�d jest zaprogramowany na multiword DMA mode2.
U�ywanie DMA niekoniecznie musi powodowa� zwi�kszenie przepustowo�ci lub
 wydajno�ci systemu, lecz wiele os�b ma takie zdanie. R�nie to bywa.
.TP
.I -D
Wy��cz/w��cz wbudowan� w dnap�d w�a�ciwo�� zarz�dzania uszkodzeniami, za
pomoc� kt�rej jego firmware pr�buje automatycznie zarz�dza� uszkodzonymi
sektorami, przenosz�c je na sektory "zapasowe", zarezerwowane fabrycznie
do tego celu.
.TP
.I -E
Ustaw szybko�� cdrom-u. NIE jest to konieczne do normalnego dzia�ania, gdy�
nap�d automatycznie sam prze��cza pr�dko�ci. Jednak je�li chcesz si� nim
bawi�, podaj po tej opcji warto�� szybko�ci, zwykle liczb� tak� jak 2 lub 4.
.TP
.I -f
Synchronizuj (sync) i wypr�niaj (flush) bufory podr�czne urz�dzenia przy
wyj�ciu.
Operacja ta jest r�wnie� wykonywana jako cz�� pomiar�w
.I -t
i
.IR -T .
.TP
.I -g
Poka� geometri� dysku (cylindry, g�owice, sektory), rozmiar (w
sektorach), a tak�e przesuni�cie (w sektorach) pocz�tku urz�dzenia,
poczynaj�c od pocz�tku nap�du.
.TP
.I -h
Poka� kr�tk� informacj� o u�yciu (pomoc).
.TP
.I -i
Poka� informacje identyfikacyjne, kt�re zosta�y pobrane z nap�du podczas
startu, o ile s� one dost�pne.
Jest to w�a�ciwo�� nowoczesnych nap�d�w IDE i mo�e nie by� obs�ugiwana przez
starsze urz�dzenia.
Zwracane dane mog� nie by� aktualne, zale�nie od czynno�ci wykonanych po 
uruchomieniu systemu.
Pomimo tego, pokazywana jest zawsze bie��ca warto�� trybu operacji
wielosektorowych (multiple sector mode count).
Dla dok�adniejszej interpretacji informacji identyfikacyjnych, odsy�amy do
.I AT Attachment Interface for Disk Drives
(ANSI ASC X3T9.2 working draft, revision 4a, April 19/93).
.TP
.I -I
 �daj informacji identyfikacji bezpo�rednio od nap�du. Wy�wietlana jest ona
w surowej postaci, bez zmian kolejno�ci bajt�w lub poprawek. �a�cuchy tesktowe
mog� ukaza� si� poprzestawiane w razie u�ycia
.I -I
lecz NIE jest to b��d. W pozosta�ym zakresie podobne do opcji
.IR -i .
.TP
.I -k
Pobierz/ustaw flag� keep_settings_over_reset (zachowaj ustawienia po
resecie). Gdy ta flaga jest ustawiona, sterownik b�dzie chroni� opcje
.I -dmu
po mi�kkim resecie.
Flaga ta domy�lnie jest wy��czona, aby uchroni� nap�d przed p�tlami
reset�w, kt�re mog�yby by� spowodowane kombinacjami ustawie�
.I -dmu
Opcja
.I -k
powinna wi�c by� ustawiana tylko gdy jeste� przekonany, �e system b�dzie
dzia�a� poprawnie przy wybranych ustawieniach konfiguracyjnych.
W rzeczywisto�ci wszystko co zazwyczaj trzeba zrobi� aby przetestowa�
konfiguracj� (przed u�yciem -k) to sprawdzenie czy nap�d daje si�
odczyta�/zapisa� i czy proces ten nie generuje b��d�w w logach (komunikaty
j�dra) (w wi�kszo�ci system�w zajrzyj do /var/adm/messages).
.TP
.I -K
Ustaw flag� keep_features_over_reset (zachowaj w�a�ciwo�ci po resecie) nap�du.
Jej ustawienie powoduje, �e nap�d odzyskuje po mi�kkim resecie (kt�ry
wyst�puje w procesie usuwania b��du) ustawienia dla
.IR -APSWXZ .
Nie wszystkie nap�dy obs�uguj� t� w�a�ciwo��.
.TP
.I -L
Ustaw flag� blokowania drzwiczek nap�du. Ustawienie tego na
.B 1
powoduje blokowanie mechanizmu drzwiczek niekt�rych przeno�nych dysk�w
twardych (np. Syquest, ZIP, Jazz..), a ustawienie na
.B 0 
powoduje odblokowanie drziwczek. Normalnie Linux obs�uguje ten
mechanizm automatycznie, zale�nie od u�ywania dysku (blokuje przy
zamontowaniu systemu plik�w). Jednak mo�e to by� przykre np. po zamkni�ciu
systemu, gdy partycja root jest na dysku przeno�nym, gdy� jest ona
pozostawiana zamontowana (ro) po zamkni�ciu systemu. Tak wi�c u�ycie tego
polecenia do otwarcia drzwiczek
.B po
przemontowaniu systemu plik�w root na ro
umo�liwia usuni�cie kasety z nap�du po zamkni�ciu systemu.
.TP
.I -m
Pobierz/ustaw licznik sektor�w dla wielosektorowego I/O w nap�dzie.
Ustawienie
.B 0
wy��cza t� w�a�ciwo��. Tryb ten (inaczej znany jako IDE Block Mode) jest
w�a�ciwo�ci� wi�kszo�ci nowoczesnych dysk�w twardych IDE, zezwalaj�c� na
transmisj� wielu sektor�w na ka�de przerwanie I/O (w przeciwie�stwie do
tradycyjnego jednego sektora na przerwanie). Gdy w��czona jest ta w�a�ciwo��,
zazwyczaj zmniejsza si� systemowe obci��enie dyskowego I/O o 30-50%. W wielu
systemach zapewnia to tak�e zwi�kszony przep�yw danych w zakresie od 5% do 50%.
Mimo to, niekt�re nap�dy (najbardziej zauwa�alnie seria WD Caviar)
wydaj� si� dzia�a� wolniej trybie wielosektorowym. R�nie to bywa.
Wi�kszo�� nap�d�w obs�uguje co najmniej ustawienia 2, 4, 8 i 16 (sektor�w).
Wiksze ustawienia r�wnie� bywaj� mo�liwe, zale�y to od nap�du.
Ustawienie 16 lub 32 wydaje si� optymalnym dla wielu system�w.
Western Digital zaleca ni�sze ustawienia od 4 do 8 dla wielu z ich dysk�w,
a to z powodu ma�ych (32KB) bufor�w nap�d�w i niezoptymalizowanych algorytm�w
buforowania.
Do znalezienia maksymalnej obs�ugiwanej przez zainstalowany nap�d warto�ci
mo�na u�y� opcji
.B -i
(szukaj MaxMultSect na wyj�ciu).
Niekt�re nap�dy twierdz�, �e obs�uguj� ten tryb, lecz trac� dane przy
pewnych ustawieniach. W rzadkich wypadkach, takie b��dy mog� spowodowa�
.BR powa�ne uszkodzenie systemu plik�w!
.TP
.I -n
Pobierz lub ustaw flag� "ignoruj b��dy zapisu" w sterowniku.
NIE baw si� t� opcj� nie przejrzawszy uprzednio �r�de� sterownika.
.TP
.I -p
Pr�ba przeprogramowania chipsetu interfejsu IDE na okre�lony tryb PIO, lub
pr�ba automatycznego dostosowania si� do "najlepszego" trybu PIO
obs�ugiwanego przez nap�d. W�a�ciwo�� ta jest obs�ugiwana w j�drze tylko dla
kilku "znanych" chipset�w, a nawet w�wczas obs�uga jest co najmniej w�tpliwa.
Niekt�re chipsety IDE nie s� w stanie zmieni� trybu PIO dla pojedynczego
 nap�du; w tym wypadku opcja ta mo�e spowodowa� ustawienie trybu
PIO dla
.I obydwu
nap�d�w. Wiele chipset�w IDE obs�uguje albo mniej, albo wi�cej ni� standardowe
sze�� (od 0 do 5) tryb�w PIO, wi�c dok�adne ustawienie szybko�ci, kt�re
w�a�ciwie jest zaimplementowane, b�dzie r�ni� si� zale�nie od wyrafinowania
chipsetu/sterownika.
.I U�ywaj z wielk� ostro�no�ci�!
W�a�ciwo�� ta nie chroni przed nierozwag�, a niepomy�lne dzia�anie mo�e
spowodowa�
.I powa�ne uszkodzenie systemu plik�w!
.TP
.I -P
Ustaw maksymalny licznik sektor�w dla wewn�trznych mechanizm�w odczytu z
wyprzedzeniem nap�du. Nie wszystkie nap�dy obs�uguj� t� w�a�ciwo��.
.TP
.I -q
Obs�u� nast�pn� opcj� cicho, nie wypisuj�c komunikat�w na wyj�cie. Jest to
przydatne do zmniejszenia zamieszania na ekranie w wypadku uruchamiania z
/etc/rc.c/rc.local.
Nie dotyczy opcji
.IR -i ,
.IR -v ,
.IR -t 
lub
.IR -T .

.TP
.I -r
Pobierz/ustaw flag� read-only (tylko do odczytu) urz�dzenia. Gdy jest
ustawiona, operacje zapisu nie s� na tym urz�dzeniu dozwolone.
.TP
.I -R
Zarejestruj interfejs IDE.
.B Niebezpieczne.
Zobacz dla dalszych informacji opcj�
.BR -U . 
.TP
.I -S
Ustaw czas op�nienia standby (zatrzymania) dla nap�du.
Warto�� ta jest u�ywana przez nap�d w celu okre�lenia jak
d�ugo oczekiwa� (bez aktywno�ci dyskowej) przed wy��czeniem silnika w
celach oszcz�dno�ci mocy. W takich warunkach, dysk mo�e potrzebowa� do 30
sekund aby odpowiedzie� na nast�pne odwo�anie, cho� wi�kszo�� nap�d�w robi to
znacznie szybciej. Kodowanie czasu jest do�� spcyficzne. Warto�� 0 oznacza
wy��czenie tej w�a�ciwo�ci. Warto�ci od 1 do 240 okre�laj� wielokrotno�ci
5 sekund, czyli daj� czasy op�nienia od 5 sekund do 20 minut. Warto�ci od
241 do 251 okre�laj� 1 do 11 jednostek po 30 minut dla czas�w op�nienia od
30 minut do 5,5 godzin. Warto�� 252 oznacza czas op�nienia 21 minut, 253
ustawia czas zdefiniowany przez dostawc�, a 255 jest interpretowane jako
21 minut plus 15 sekund.
.TP
.I -T
Dokonuj pomiar�w czasu odczyt�w bufora podr�cznego dla cel�w por�wnawczych i 
test�w wydajno�ciowych. Dla oznaczaj�cych co� wynik�w, operacja ta powinna 
by� powtarzana 2-3 razy na nieaktywnym pod innymi wzgl�dami systemie (bez 
innych aktywnych proces�w) z przynajmniej kilkoma megabajtami wolnej pami�ci.
Podaje ona szybko�� odczytu bezpo�rednio z linuksowego bufora podr�cznego,
bez dost�pu do dysku. Ta miara jest  wska�nikiem przep�ywu danych mi�dzy
procesorem, buforem podr�cznym i pami�ci� testowanego systemu.
Je�li podano r�wnie� opcj�
.IR -t ,
to czynnik koryguj�cy, oparty na wyniku 
.IR -T ,
zostanie w��czony do wyniku zg�aszanego przez operacj�
.IR -t .
.TP
.I -t
Dokonuj pomiar�w czasu odczyt�w z urz�dzenia dla cel�w por�wnawczych i
test�w wydajno�ciowych. Dla oznaczaj�cych co� wynik�w, operacja ta powinna
by� powtarzana 2-3 razy na nieaktywnym pod innymi wzgl�dami systemie (bez
innych aktywnych proces�w) z przynajmniej kilkoma megabajtami wolnej
pami�ci. Podaje ona szybko�� odczytu poprzez bufor podr�czny z dysku, bez
wcze�niejszego buforowania danych. Ten pomiar jest wska�nikiem jak szybko
nap�d jest w stanie obs�ugiwa� liniowe odczyty danych pod Linuksem bez
obci��enia zwi�zanego z systemem plik�w. Aby zapewni� dok�adne pomiary,
bufor podr�czny jest wypr�niany przy u�yciu ioctl BLKFLSBUF.
.TP
.I -u
Pobierz/ustaw flag� interrupt-unmask nap�du. Ustawienie 
.B 1
zezwala sterownikowi na niemaskowanie innych przerwa� podczas przetwarzania
przerwania dyskowego, co poprawia w du�ej mierze odpowiadywalno�� Linuksa i
eliminuje b��dy "serial port overrun"
.B U�ywaj tej w�a�ciwo�ci z ostro�no�ci�:
niekt�re kombinacje nap�du/kontrolera nie toleruj� zwi�kszonego czasu
oczekiwania na I/O, gdy ta w�a�ciwo�� jest w��czona, co mo�e spowodowa�
.B powa�ne uszkodzenie systemu plik�w.
W szczeg�lno�ci interfejsy
.B CMD-640B
i
.B RZ1000
(E)IDE mog� by�
.B niestabilne
(z powodu usterek sprz�towych) gdy opcja ta jest u�ywana z wersjami j�dra
wcze�niejszymi ni� 2.0.13. Wy��czenie w�a�ciwo�ci
.B IDE prefetch
tych interfejs�w (zwykle ustawienie BIOS/CMOS) daje bezpieczne rozwi�zanie
opisanego problemu dla wcze�niejszych j�der.
.TP
.I -U
Wyrejestruj interfejs IDE.
.B Niebezpieczne.
Kompan opcji
.BR -R .
Przeznaczone do u�ytku ze sprz�tem stworzonym specjalnie do wymieniania
podczas pracy (hot-swapping) (bardzo rzadkie!).
U�ywaj rozumnie i z
.B wielk� ostro�no�ci�
gdy� mo�e to �atwo zawiesi� lub uszkodzi� system.
Dystrybucja �r�d�owa hdparm zawiera katalog 'contrib' z pochodz�cymi od
u�ytkownik�w skryptami dla wymiany podczas pracy na UltraBay z ThinkPad 600E.
U�ywaj na w�asn� odpowiedzialno��.
.TP
.I -v 
Poka� wszystkie ustawienia, poza -i (tak jak -asdgmknru dla IDE, -gr dla SCSI
lub -adgr dla XT). Jest to te� domy�lne zachowanie, kiedy nie poda si� �adnych
opcji.
.TP
.I -w
Wykonaj reset urz�dzenia (NIEBEZPIECZNE). NIE u�ywaj tej opcji.
Istnieje ona dla rzadkich sytuacji, gdy w przeciwnym razie niezb�dny dla
przywr�cenia zg�upia�emu nap�dowi stanu u�ywalno�ci byby restart systemu.
.TP
.I -W
W��cz/wy��cz w�a�ciwo�� podr�cznego buforowania zapisu w nap�dach IDE (zwykle
domy�lnie wy��czone -- OFF)
.TP
.I -X 
Ustaw tryb transferu IDE dla nowszych nap�d�w (E)IDE/ATA2.
Jest to zazwyczaj u�ywane w po��czeniu z
.I -d1
gdy w��cza si� DMA do/z nap�du na obs�ugiwanym chipsecie interfejsu (takim
jak Intel 430FX Triton),  gdzie u�ywane jest
.I -X34
do wyboru transfer�w w multiword DMA mode2.
W systemach, obs�uguj�cych timingi burst UltraDMA, do wybierania transfer�w
UDMA mode2 u�ywane jest
.I -X66
(b�dziesz musia� uprzednio przygotowa� chipset dla UltraDMA).
Poza tym, u�ycie tej opcji jest
.I rzadko potrzebne
gdy� wi�kszo��/wszystkie nowoczesne nap�dy IDE domy�lnie ustawiaj� si� na
najszybszy ze swoich tryb�w PIO zaraz przy w��czeniu. Walczenie z tym mo�e 
by� bezu�yteczne i ryzykowne. Na dyskach, kt�re obs�uguj� dodatkowe tryby
transferu, mo�na u�y�
.I -X
do prze��czania 
.I tylko
trybu nap�du.
Przed zmian� trybu transferu, interfejs IDE powinien by� zezworkowany lub
zaprogramowany (zobacz opcj�
.IR -p )
dla nowego trybu, aby zapobiec utracie i/lub zniszczeniu danych.
.I U�ywaj tego ze szczeg�ln� ostro�no�ci�!
Dla tryb�w transferu PIO (Programmed Input/Output) u�ywanych przez Linuksa,
warto�� ta jest po prostu oczekiwanym numerem trybu PIO plus 8. Dlatego
warto�� 09 ustawia tryb PIO mode1, 10 PIO mode2, a 11 wybiera PIO mode3.
Ustawienie 00 odtwarza "domy�lny" tryb PIO dysku, a 01 wy��cza IORDY.
Dla multiword DMA, u�ywana warto�� to numer DMA plus 32. Dla UltraDMA,
warto�� to oczekiwany numer trybu UltraDMA plus 64.
.TP
.I -y
Zmu� dysk IDE do natychmiastowego przej�cia na energooszcz�dny tryb
.B standby
zazwyczaj powoduj�c zaprzestanie wirowania.
Obecny status zasilania mo�na sprawdzi� przy u�yciu flagi
.BR -C .
.TP
.I -Y
Zmu� dysk IDE do natychmiastowego przej�cia w najni�szy tryb energooszcz�dny
.B sleep
powoduj�cy wy��czenie zasilania dysku. Przed ponownym dost�pem do dysku
wymagany jest twardy lub mi�kki reset (sterownik IDE robi to automatycznie).
Obecny stan trybu zasilania mo�na uzyska�, korzystaj�c z opcji
.BR -C . 
.TP
.I -Z
Wy��cz automatyczne funkcje oszcz�dzania energii w niekt�rych nap�dach
Seagate (modelach ST3xxx?), aby uchroni� je od wy��czania si� w
nieoczekiwanych momentach.
.SH B��DY
Jak zauwa�ono powy�ej, opcje
.B -m sectcount
i
.B -u 1
powinny by� u�ywane z ostro�no�ci�, najlepiej na systemie plik�w tylko dla
odczytu. Wi�kszo�� nap�d�w pracuje z tymi w�a�ciwo�ciami dobrze, lecz
niekt�re kombinacje nap�d/kontroler nie s� w 100% zgodne. System plik�w mo�e
wtedy ulec zniszczeniu. Pami�taj o backupie przed takimi eksperymentami!
.PP
Niekt�re opcje (np. -r dla SCSI) mog� nie dzia�a� ze starymi j�drami, gdy�
nie by�o potrzebnych ioctl()-i.
.PP
Chocia� to narz�dzie jest skierowane przede wszystkim do u�ytku ze zwyk�ymi
nap�dami dysk�w twardych (E)IDE, to u�ywanie cz�ci opcji jest r�wnie�
prawid�owe (i dozwolone) dla dyskam�w twardych SCSI oraz dysk�w twardych
MFM/RLL z interfejsami XT.
.SH AUTOR
.B hdparm
zosta� napisany przez Marka Lorda <mlord@pobox.com>,
g��wnego tw�rc� i opiekuna sterownika (E)IDE dla Linuksa.
.PP
Kod wy��czaj�cy automatyczne oszcz�dzanie energii w Seagate zosta� napisany
przez Tomiego Leppikangasa (tomilepp@paju.oulu.fi).
.SH ZOBACZ TAK�E
.B AT Attachment Interface for Disk Drives,
ANSI ASC X3T9.2 working draft, revision 4a, April 19, 1993.
.PP
.B AT Attachment Interface with Extensions (ATA-2),
ANSI ASC X3T9.2 working draft, revision 2f, July 26, 1994.
.PP
.B Western Digital Enhanced IDE Implementation Guide,
by Western Digital Corporation, revision 5.0, November 10, 1993.
.PP
.B Enhanced Disk Drive Specification,
by Phoenix Technologies Ltd., version 1.0, January 25, 1994.
