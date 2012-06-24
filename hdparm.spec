Summary:	Utility for setting (E)IDE performance parameters
Summary(de):	Dienstprogramm zum Einstellen von (E)IDE-Parametern
Summary(fr):	Utilitaire pour ajuster les param�tres de performances des unit�s (E)IDE.
Summary(pl):	Narz�dzie do ustawiania parametrow (E)IDE
Summary(tr):	(E)IDE sabit disklerle ilgili baz� parametreleri de�i�tirir
Name:		hdparm
Version:	3.9
Release:	2
Copyright:	distributable
Group:		Utilities/System
Group(pl):	Narz�dzia/System
Source0:	ftp://sunsite.unc.edu/pub/Linux/system/hardware/%{name}-%{version}.tar.gz
Source1:	hdparm.init
Source2:	hdparm.sysconfig
Patch0:		hdparm-optflags.patch
Patch1:		hdparm-sparc.patch
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%description
This is a utility for setting Hard Drive parameters.  It is useful for
tweaking performance and for doing things like spinning down hard drives to
conserve power.

%description -l de
Dies ist ein Utility zum Einstellen der Festplatten-Parameter, n�tzlich zum
Feintunen der Leistung und zum Verlangsamen der Drehgeschwindigkeit, wenn
Strom gespart werden soll.

%description -l fr
Utilitaire pour configurer les param�tres du disque dur. Utile pour
am�liorer les performances et pour ralentir les disques durs afin
d'�conomiser l'�nergie.

%description -l pl
Pakiet ten zawiera program pozwalaj�cy manipulowa� r�nymi parametrami
dysk�w (E)IDE i SCSI. Przydaje si�, gdy chcemy polepszy� wydajno�� naszego
dysku (E)IDE (na przyklad opcje -u, -d), zatrzyma� aby nie zu�ywa� pr�du na
laptopie, itd. Prosz� zapozna� si� ze stron� manuala przed u�yciem hdparma.

%description -l tr
Bu program ile sabit disk parametrelerini de�i�tirebilirsiniz. Sistemin
performans�n� artt�rmak ya da �rne�in disk h�z�n� azaltarak daha az g��
harcamak i�in kullanabilirsiniz.

%prep
%setup  -q
%patch0 -p1
%patch1 -p1

%build
make OPTFLAGS="$RPM_OPT_FLAGS"

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT{{/sbin,%{_mandir}/man8},/etc/{sysconfig,rc.d/init.d}}

install -s hdparm $RPM_BUILD_ROOT/sbin
install hdparm.8 $RPM_BUILD_ROOT%{_mandir}/man8

install %{SOURCE1} $RPM_BUILD_ROOT/etc/rc.d/rc.hdparm
install %{SOURCE2} $RPM_BUILD_ROOT/etc/sysconfig/hdparm

gzip -9nf $RPM_BUILD_ROOT%{_mandir}/man*/* \
	Changelog

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%doc *.gz
%attr(755,root,root) /sbin/hdparm
%attr(754,root,root) /etc/rc.d/rc.hdparm
%config(noreplace) %verify(not size mtime md5) /etc/sysconfig/hdparm
%{_mandir}/man8/*
