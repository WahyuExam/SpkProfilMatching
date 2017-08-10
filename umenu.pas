unit umenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, jpeg, ExtCtrls, ComCtrls;

type
  Tfmenuutama = class(TForm)
    mm1: TMainMenu;
    Master1: TMenuItem;
    BatasNilai1: TMenuItem;
    VarietasPupuk1: TMenuItem;
    Pemilik1: TMenuItem;
    Proses1: TMenuItem;
    kelompoklahanPemilik1: TMenuItem;
    ProfilMatching1: TMenuItem;
    Laporan1: TMenuItem;
    DataPupuk1: TMenuItem;
    Pemilik2: TMenuItem;
    DataPemilik1: TMenuItem;
    spesifikasiLahanPemilik1: TMenuItem;
    ProsesMatching1: TMenuItem;
    Pengaturan1: TMenuItem;
    Keluar1: TMenuItem;
    BackupdanRestore1: TMenuItem;
    GantiSandi1: TMenuItem;
    img1: TImage;
    stat1: TStatusBar;
    procedure BatasNilai1Click(Sender: TObject);
    procedure VarietasPupuk1Click(Sender: TObject);
    procedure Pemilik1Click(Sender: TObject);
    procedure kelompoklahanPemilik1Click(Sender: TObject);
    procedure ProfilMatching1Click(Sender: TObject);
    procedure DataPupuk1Click(Sender: TObject);
    procedure Keluar1Click(Sender: TObject);
    procedure DataPemilik1Click(Sender: TObject);
    procedure spesifikasiLahanPemilik1Click(Sender: TObject);
    procedure ProsesMatching1Click(Sender: TObject);
    procedure BackupdanRestore1Click(Sender: TObject);
    procedure GantiSandi1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmenuutama: Tfmenuutama;

implementation

uses
  Unilbatas, Umaspupuk, upemilik, ukelpetani, ubntupem, uprosesmatching, 
  AccessXP, urep_varietaspupuk, urep_pemilik, upil_lappemilik, upildesa, 
  ubanckup, ugantipwd;

{$R *.dfm}

procedure Tfmenuutama.BatasNilai1Click(Sender: TObject);
begin
Fnilbatas.ShowModal;
end;

procedure Tfmenuutama.VarietasPupuk1Click(Sender: TObject);
begin
fmaspupuk.ShowModal;
end;

procedure Tfmenuutama.Pemilik1Click(Sender: TObject);
begin
fpemilik.ShowModal;
end;

procedure Tfmenuutama.kelompoklahanPemilik1Click(Sender: TObject);
begin
fkeltani.ShowModal;
end;

procedure Tfmenuutama.ProfilMatching1Click(Sender: TObject);
begin
fproses.ShowModal;
end;

procedure Tfmenuutama.DataPupuk1Click(Sender: TObject);
begin
report_varietaspupuk.Preview;
end;

procedure Tfmenuutama.Keluar1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure Tfmenuutama.DataPemilik1Click(Sender: TObject);
begin
rep_datapemilik.Preview;
end;

procedure Tfmenuutama.spesifikasiLahanPemilik1Click(Sender: TObject);
begin
fpillappemilik.ShowModal;
end;

procedure Tfmenuutama.ProsesMatching1Click(Sender: TObject);
begin
fpilpemilik.ShowModal;
end;

procedure Tfmenuutama.BackupdanRestore1Click(Sender: TObject);
begin
 fbackup.ShowModal;
end;

procedure Tfmenuutama.GantiSandi1Click(Sender: TObject);
begin
 fgantipwd.ShowModal
end;

end.
