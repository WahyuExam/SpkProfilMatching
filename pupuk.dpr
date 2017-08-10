program pupuk;

uses
  Forms,
  Unilbatas in 'Unilbatas.pas' {Fnilbatas},
  udm in 'udm.pas' {dm: TDataModule},
  Umaspupuk in 'Umaspupuk.pas' {fmaspupuk},
  upemilik in 'upemilik.pas' {fpemilik},
  ukelpetani in 'ukelpetani.pas' {fkeltani},
  ubntupem in 'ubntupem.pas' {fbantupemilik},
  uprosesmatching in 'uprosesmatching.pas' {fproses},
  umenu in 'umenu.pas' {fmenuutama},
  urep_varietaspupuk in 'urep_varietaspupuk.pas' {report_varietaspupuk: TQuickRep},
  urep_pemilik in 'urep_pemilik.pas' {rep_datapemilik: TQuickRep},
  upil_lappemilik in 'upil_lappemilik.pas' {fpillappemilik},
  urep_semuavarietaspemilik in 'urep_semuavarietaspemilik.pas' {repsemuavarietaspemilik: TQuickRep},
  urep_varietasperpemilik in 'urep_varietasperpemilik.pas' {repvarietasperpemilik: TQuickRep},
  upildesa in 'upildesa.pas' {fpilpemilik},
  urep_hasilmatching in 'urep_hasilmatching.pas' {rephasilmatching: TQuickRep},
  ubanckup in 'ubanckup.pas' {fbackup},
  ulogin in 'ulogin.pas' {flogin},
  ugantipwd in 'ugantipwd.pas' {fgantipwd},
  uisibatasnilai in 'uisibatasnilai.pas' {Fisibatas};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tflogin, flogin);
  Application.CreateForm(TFisibatas, Fisibatas);
  Application.CreateForm(Tfmenuutama, fmenuutama);
  Application.CreateForm(Tfproses, fproses);
  Application.CreateForm(Tfkeltani, fkeltani);
  Application.CreateForm(Tfpemilik, fpemilik);
  Application.CreateForm(Tfmaspupuk, fmaspupuk);
  Application.CreateForm(TFnilbatas, Fnilbatas);
  Application.CreateForm(Tfbantupemilik, fbantupemilik);
  Application.CreateForm(Treport_varietaspupuk, report_varietaspupuk);
  Application.CreateForm(Trep_datapemilik, rep_datapemilik);
  Application.CreateForm(Tfpillappemilik, fpillappemilik);
  Application.CreateForm(Trepsemuavarietaspemilik, repsemuavarietaspemilik);
  Application.CreateForm(Trepvarietasperpemilik, repvarietasperpemilik);
  Application.CreateForm(Tfpilpemilik, fpilpemilik);
  Application.CreateForm(Trephasilmatching, rephasilmatching);
  Application.CreateForm(Tfbackup, fbackup);
  Application.CreateForm(Tfgantipwd, fgantipwd);
  Application.Run;
end.
