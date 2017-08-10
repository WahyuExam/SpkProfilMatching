unit upildesa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, jpeg, ExtCtrls;

type
  Tfpilpemilik = class(TForm)
    grp1: TGroupBox;
    lbl1: TLabel;
    grp2: TGroupBox;
    lbl2: TLabel;
    dblkcbbpemilik: TDBLookupComboBox;
    lbl3: TLabel;
    dblkcbblahan: TDBLookupComboBox;
    grp3: TGroupBox;
    btn1: TBitBtn;
    btn2: TBitBtn;
    img1: TImage;
    procedure btn2Click(Sender: TObject);
    procedure dblkcbbpemilikCloseUp(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fpilpemilik: Tfpilpemilik;

implementation

uses
  udm, urep_hasilmatching;

{$R *.dfm}

procedure Tfpilpemilik.btn2Click(Sender: TObject);
begin
close;
end;

procedure Tfpilpemilik.dblkcbbpemilikCloseUp(Sender: TObject);
begin
with dm.qrykelpem do
    begin
      close;
      sql.Clear;
      SQL.Text:='select * from tbl_kelpemilik where id_pemilik='+QuotedStr(dblkcbbpemilik.KeyValue)+'';
      Open;
    end;
end;

procedure Tfpilpemilik.btn1Click(Sender: TObject);
begin
 if dblkcbbpemilik.KeyValue=null then
  begin
   MessageDlg('Nama Pemilik Belum Dipilih',mtWarning,[mbok],0);
   Exit;
  end;

 if dblkcbblahan.KeyValue=null then
  begin
    MessageDlg('Lahan Belum Dipilih',mtWarning,[mbok],0);
    Exit;
  end;

  with dm.qrykelpem do
   begin
     close;
     SQL.Clear;
     sql.Text:='select * from tbl_kelpemilik where id_pemilik='+QuotedStr(dblkcbbpemilik.KeyValue)+' and lahan='+QuotedStr(dblkcbblahan.KeyValue)+'';
     Open;
   end;

  with dm.qrytampilmatching do
  begin
    Close;
    SQL.Clear;
    sql.Add('select a.id_transaksi, b.id_pemilik, b.nm_pemilik, a.lahan, c.id_pupuk, c.jns_pupuk, a.bbt_tinggi,');
    sql.Add('a.bbt_curah, a.bbt_suhu, a.bbt_ph, a.core, a.second, a.hasil from tbl_prosesmatching a,');
    sql.Add('tbl_pemilik b, tbl_pupuk c where a.id_pemilik=b.id_pemilik and a.id_pupuk=c.id_pupuk and a.id_pemilik='+QuotedStr(dblkcbbpemilik.KeyValue)+'');
    sql.Add(' and a.lahan='+QuotedStr(dblkcbblahan.KeyValue)+' order by a.hasil desc');
    Open;
  end;

  rephasilmatching.QRLabel4.Caption:=dblkcbblahan.KeyValue;
  rephasilmatching.QRLabel12.Caption:=dblkcbbpemilik.Text;
  //lap
  rephasilmatching.QRLabel22.Caption:= dm.qrytampilmatching.fieldbyname('jns_pupuk').AsString;

  rephasilmatching.Preview;
  dblkcbbpemilik.OnCloseUp(Sender);
end;

end.
