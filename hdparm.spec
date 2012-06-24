Summary:	Utility for setting (E)IDE performance parameters
Summary(es):	Utilitario para ajustar par�metros de desempe�o (E)IDE
Summary(de):	Dienstprogramm zum Einstellen von (E)IDE-Parametern
Summary(fr):	Utilitaire pour ajuster les param�tres de performances des unit�s (E)IDE
Summary(pl):	Narz�dzie do ustawiania parametrow (E)IDE
Summary(pt_BR):	Utilit�rio para ajustar par�metros de performance (E)IDE
Summary(tr):	(E)IDE sabit disklerle ilgili baz� parametreleri de�i�tirir
Name:		hdparm
Version:	4.6
Release:	1
License:	BSD
Group:		Applications/System
Source0:	ftp://sunsite.unc.edu/pub/Linux/system/hardware/%{name}-%{version}.tar.gz
Source1:	%{name}.init
Source2:	%{name}.sysconfig
Source3:	hdparm.8.pl
Patch0:		%{name}-man-patch
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%define		_sbindir	/sbin

%description
This is a utility for setting Hard Drive parameters. It is useful for
tweaking performance and for doing things like spinning down hard
drives to conserve power.

%description -l de
Dies ist ein Utility zum Einstellen der Festplatten-Parameter,
n�tzlich zum Feintunen der Leistung und zum Verlangsamen der
Drehgeschwindigkeit, wenn Strom gespart werden soll.

%description -l es
Este es un utilitario para ajustar par�metros del disco duro. Es �til
para mejorar el desempe�o y para hacer cosas como diminuir la rotaci�n
del disco para conservar energ�a.

%description -l fr
Utilitaire pour configurer les param�tres du disque dur. Utile pour
am�liorer les performances et pour ralentir les disques durs afin
d'�conomiser l'�nergie.

%description -l pl
Pakiet ten zawiera program pozwalaj�cy manipulowa� r�nymi parametrami
dysk�w (E)IDE i SCSI. Przydaje si�, gdy chcemy polepszy� wydajno��
naszego dysku (E)IDE (na przyklad opcje -u, -d), zatrzyma� aby nie
zu�ywa� pr�du na laptopie, itd. Prosz� zapozna� si� ze stron� manuala
przed u�yciem hdparma.

%description -l pt_BR
Este � um utilit�rio para ajustar par�metros do disco r�gido. Ele �
�til para melhorar a performance e para fazer coisas como diminuir a
rota��o do disco para conservar energia.

%description -l tr
Bu program ile sabit disk parametrelerini de�i�tirebilirsiniz.
Sistemin performans�n� artt�rmak ya da �rne�in disk h�z�n� azaltarak
daha az g�� harcamak i�in kullanabilirsiniz.

%prep
%setup  -q
%patch0 -p1

%build
%{__make} \
	CC="%{__cc}" \
	CFLAGS="%{rpmcflags}"

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT{{%{_sbindir},%{_mandir}/{man8,pl/man8}},%{_sysconfdir}/{sysconfig,rc.d/init.d}}

install hdparm $RPM_BUILD_ROOT%{_sbindir}
install hdparm.8 $RPM_BUILD_ROOT%{_mandir}/man8

install %{SOURCE1} $RPM_BUILD_ROOT/etc/rc.d/rc.hdparm
install %{SOURCE2} $RPM_BUILD_ROOT/etc/sysconfig/hdparm
install %{SOURCE3} $RPM_BUILD_ROOT%{_mandir}/pl/man8/hdparm.8

gzip -9nf contrib/* Changelog

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%doc *.gz contrib
%attr(755,root,root) %{_sbindir}/hdparm
%attr(754,root,root) /etc/rc.d/rc.hdparm
%config(noreplace) %verify(not size mtime md5) /etc/sysconfig/hdparm
%{_mandir}/man8/*
%lang(pl) %{_mandir}/pl/man8/*
