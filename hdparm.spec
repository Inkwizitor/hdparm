Summary:	Utility for setting (E)IDE performance parameters
Summary(de):	Dienstprogramm zum Einstellen von (E)IDE-Parametern
Summary(fr):	Utilitaire pour ajuster les param�tres de performances des unit�s (E)IDE.
Summary(pl):	Narz�dzie do ustawiania parametrow (E)IDE
Summary(tr):	(E)IDE sabit disklerle ilgili baz� parametreleri de�i�tirir
Name:		hdparm
Version:	3.5
Release:	4
Copyright:	distributable
Group:		Utilities/System
Group(pl):	Narz�dzia/System
Source0:	ftp://sunsite.unc.edu/pub/Linux/system/hardware/%{name}-%{version}.tar.gz
Source1:	hdparm.init
Source2:	hdparm.sysconfig
Patch0:		hdparm-optflags.patch
Buildroot:	/tmp/%{name}-%{version}-root

%description
This is a utility for setting Hard Drive parameters.  It is useful for
tweaking performance and for doing things like spinning down hard drives
to conserve power.

%description -l de
Dies ist ein Utility zum Einstellen der Festplatten-Parameter, n�tzlich zum 
Feintunen der Leistung und zum Verlangsamen der Drehgeschwindigkeit, wenn 
Strom gespart werden soll. 

%description -l fr
Utilitaire pour configurer les param�tres du disque dur. Utile pour
am�liorer les performances et pour ralentir les disques durs afin
d'�conomiser l'�nergie.

description -l pl
Pakiet ten zawiera program pozwalaj�cy manipulowa� r�nymi parametrami
dysk�w (E)IDE i SCSI. Przydaje si�, gdy chcemy polepszy� wydajno�� naszego
dysku (E)IDE (na przyklad opcje -u, -d), zatrzyma� aby nie zu�ywa� pr�du na
laptopie, itd. Prosz� zapozna� si� ze stron� manuala przed u�yciem hdparma.

%description -l tr
Bu program ile sabit disk parametrelerini de�i�tirebilirsiniz. Sistemin
performans�n� artt�rmak ya da �rne�in disk h�z�n� azaltarak daha az g��
harcamak i�in kullanabilirsiniz.

%prep
%setup -q
%patch0 -p1

%build
make OPTFLAGS="$RPM_OPT_FLAGS"

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT/{{sbin,usr/man/man8},etc/{sysconfig,rc.d/init.d}}

install -s hdparm $RPM_BUILD_ROOT/sbin
install hdparm.8 $RPM_BUILD_ROOT/usr/man/man8

install %{SOURCE1} $RPM_BUILD_ROOT/etc/rc.d/init.d/hdparm
install %{SOURCE2} $RPM_BUILD_ROOT/etc/sysconfig/hdparm

gzip -9nf $RPM_BUILD_ROOT/usr/man/man*/* \
	Changelog

%post
/sbin/chkconfig --add hdparm

%preun
if [ "$1" = "0" ]; then
	/sbin/chkconfig --del hdparm
fi

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,0755)
%doc *.gz
%attr(755,root,root) /sbin/hdparm
%attr(754,root,root) /etc/rc.d/init.d/hdparm
%config(noreplace) %verify(not size mtime md5) /etc/sysconfig/hdparm
/usr/man/man8/*

%changelog
* Fri Apr 23 1999 Tomasz K�oczko <kloczek@rudy.mif.pg.gda.pl>
  [3.5-3]
- added %preun, %post with {de}activation service on {un}install.

* Thu Apr 22 1999 Jacek Konieczny <jajcus@zeus.polsl.gliwice.pl>
- added init script  

* Thu Sep 24 1998 Krzysztof G. Baranowski <kgb@knm.org.pl>
  [3.3-3]
- added pl transpation,
- added patch (hdparm-optflags.diff) for using $RPM_OPT_FLAGS during
  compile,
- changed Buildroot to /tmp/%%{name}-%%{version}-root,
- added using %%{name} and %%{version} in Source,
- spec rewrited for building package from non-root account.

* Fri Apr 24 1998 Prospector System <bugs@redhat.com>
- translations modified for de, fr, tr

* Wed Apr 08 1998 Erik Troan <ewt@redhat.com>
- updated to 3.3
- build rooted

* Fri Oct 31 1997 Donnie Barnes <djb@redhat.com>
- fixed spelling error in summary

* Mon Jun 02 1997 Erik Troan <ewt@redhat.com>
- built against glibc
