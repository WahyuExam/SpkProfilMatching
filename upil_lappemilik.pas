unit upil_lappemilik;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, jpeg, ExtCtrls;

type
  Tfpillappemilik = class(TForm)
    grp1: TGroupBox;
    lbl1: TLabel;
    grp2: TGroupBox;
    rb1: TRadioButton;
    rb2: TRadioButton;
    btn1: TBitBtn;
    btn2: TBitBtn;
    dblkcbb1: TDBLookupComboBox;
    img1: TImage;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fpillappemilik: Tfpillappemilik;

implementation

uses
  urep_semuavarietaspemilik, udm, DB, urep_varietasperpemilik;

{$R *.dfm}

procedure Tfpillappemilik.btn2Click(Sender: TObject);
begin
close;
end;

procedure Tfpillappemilik.btn1Click(Sender: TObject);
begin
if rb1.Checked=True then
 begin
  repsemuavarietaspemilik.Preview;
  Exit;
 end
 else
if rb2.Checked=True then
 begin
   if dblkcbb1.KeyValue=null then
    begin
      MessageDlg('Nama Pemilik Belum dipilih',mtWarning,[mbOK],0);
      Exit;
    end;
    
   with dm.qrytampilkelpem do
    begin
      close;
      sql.Clear;
      sql.Add('select a.id_pemilik, a.nm_pemilik, a.tgl_lhir, a.alamat, b.tinggi, b.curah, b.suhu,');
      sql.Add('b.ph, b.kel_tinggi, b.kel_curah, b.kel_suhu, b.kel_ph, b.notrans, b.lahan from tbl_pemilik a, tbl_kelpemilik b where');
      sql.Add('b.id_pemilik=a.id_pemilik and a.id_pemilik='+QuotedStr(dblkcbb1.KeyValue)+'');
      Open;
      if IsEmpty then
       begin
         MessageDlg('Belum Memiliki Laha',mtInformation,[mbok],0);
         Exit;
       end
       else
       repvarietasperpemilik.QRLabel6.Caption:=dblkcbb1.Text;
       repvarietasperpemilik.Preview;
    end;

 end;
end;

procedure Tfpillappemilik.rb1Click(Sender: TObject);
begin
 dblkcbb1.Enabled:=False;
end;

procedure Tfpillappemilik.rb2Click(Sender: TObject);
begin
dblkcbb1.Enabled:=True;
end;

procedure Tfpillappemilik.FormShow(Sender: TObject);
begin
dblkcbb1.Enabled:=False;
end;

end.
