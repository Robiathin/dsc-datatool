Name:           dsc-datatool
Version:        0.03
Release:        1%{?dist}
Summary:        Export DSC data to other formats and/or databases
Group:          Productivity/Networking/DNS/Utilities

License:        BSD-3-Clause
URL:            https://www.dns-oarc.net/oarc/data/dsc
# Using same naming as to build debs, get the source (and rename it) at
# https://www.dns-oarc.net/dsc/download and change %setup
Source0:        %{name}_%{version}.orig.tar.gz

BuildArch:      noarch

BuildRequires:  perl
BuildRequires:  perl-macros
BuildRequires:  perl(Test::More)
BuildRequires:  perl(Test::CheckManifest) >= 0.9
BuildRequires:  perl(common::sense) >= 3
BuildRequires:  perl(XML::LibXML::Simple) >= 0.93
BuildRequires:  perl(IO::Socket::INET) >= 1.31
BuildRequires:  perl(Time::HiRes)
BuildRequires:  perl(Getopt::Long)
BuildRequires:  perl(YAML::Tiny)
BuildRequires:  perl(Pod::Usage)
BuildRequires:  perl(Scalar::Util)
BuildRequires:  perl(Module::Find)
BuildRequires:  perl(NetAddr::IP)
BuildRequires:  perl(IP::Authority)
BuildRequires:  perl(IP::Country::Fast)
%{perl_requires}

Provides:       perl(App::DSC::DataTool)

%description
Tool for converting, exporting, merging and transforming DSC data.


%prep
%setup -q -n %{name}_%{version}


%build
%{__perl} Makefile.PL
make %{?_smp_mflags}


%install
%perl_make_install
find %buildroot/%_prefix -name *.bs -a -size 0 | xargs rm -f
%perl_process_packlist
%perl_gen_filelist


%clean
rm -rf $RPM_BUILD_ROOT


%files -f %{name}.files
%defattr(-,root,root)
%doc Changes LICENSE README.md


%changelog
* Fri Dec 16 2016 Jerry Lundström <lundstrom.jerry@gmail.com> 0.03-1
- Release 0.03

  Support processing of 25 of the 37 DAT files that the Extractor
  can produce, the others can not be converted into time series data
  since they lack timestamps.  Processing of XML is the recommended
  approach to secure all information.

  72e829c Implement processing of DAT directories
  45294d0 RPM spec
  4e8ff69 Fix 5.24 forbidden keys usage
  7589ad2 Use perl 5.24 also
  cfac110 Fix #16: Handle directories in --xml and warn that --dat is
          not implemented yet
* Thu Dec 15 2016 Jerry Lundström <lundstrom.jerry@gmail.com> 0.02-1
- Initial package
