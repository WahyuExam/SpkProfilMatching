unit uprosesmatching;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Grids, DBGrids, jpeg, ExtCtrls;

type
  Tfproses = class(TForm)
    grp1: TGroupBox;
    lbl1: TLabel;
    grp2: TGroupBox;
    grp3: TGroupBox;
    lbl2: TLabel;
    lbl3: TLabel;
    edtnm: TEdit;
    dblkcbblahan: TDBLookupComboBox;
    btn1: TBitBtn;
    edtidpemilik: TEdit;
    grp4: TGroupBox;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    edttinggi: TEdit;
    edtcurah: TEdit;
    edtph: TEdit;
    edtsuhu: TEdit;
    grp5: TGroupBox;
    DBGrid1: TDBGrid;
    grp6: TGroupBox;
    grp7: TGroupBox;
    btnproses: TBitBtn;
    btnkeluar: TBitBtn;
    lbl8: TLabel;
    edtnotrans: TEdit;
    img1: TImage;
    procedure btnkeluarClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure dblkcbblahanCloseUp(Sender: TObject);
    procedure btnprosesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure konek;
    procedure kosong;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fproses: Tfproses;

implementation

uses
  udm, ubntupem, DB, StrUtils;

{$R *.dfm}

procedure Tfproses.btnkeluarClick(Sender: TObject);
begin
close;
end;

procedure Tfproses.btn1Click(Sender: TObject);
begin
fbantupemilik.edt2.Text:='proses';
fbantupemilik.ShowModal;
end;

procedure Tfproses.dblkcbblahanCloseUp(Sender: TObject);
begin
 with dm.qrymatching do
  begin
    if dblkcbblahan.KeyValue=null then
     begin
       MessageDlg('Lahan Belum Dipilih',mtWarning,[mbOK],0);
       Exit;
     end;
     
    close;
    sql.Clear;
    SQL.Add('select * from tbl_prosesmatching where id_pemilik='+QuotedStr(edtidpemilik.Text)+' and lahan='+QuotedStr(dblkcbblahan.KeyValue)+'');
    Open;

    if not IsEmpty then
     begin
       MessageDlg('Data Lahan Sudah Dinilai',mtInformation,[mbok],0);
       konek;
       lbl8.Caption:='Bibit Pupuk yang Cocok Ditanam Yaitu Jenis Pupuk '+DBGrid1.Fields[4].AsString;
       btnproses.Caption:='Bersih';
     end
     else
     begin
       kosong;
       lbl8.Caption:='';
       btnproses.Caption:='Proses';
     end;

       with dm.qrykelpem2 do
        begin
         close;
         SQL.Clear;
         SQL.Add('select * from tbl_kelpemilik where id_pemilik='+QuotedStr(edtidpemilik.Text)+' and lahan='+QuotedStr(dblkcbblahan.KeyValue)+'');
         Open;

         edttinggi.Text:=fieldbyname('tinggi').AsString;
         edtcurah.Text:=fieldbyname('curah').AsString;
         edtsuhu.Text:=fieldbyname('suhu').AsString;
         edtph.Text:=fieldbyname('ph').AsString;
        end;

  end;
end;

procedure Tfproses.btnprosesClick(Sender: TObject);
var a: Integer;
bbt_tinggi, bbt_curah, bbt_suhu, bbt_ph, tampungnilai,
nil_tinggi, nil_curah, nil_suhu, nil_ph, cf, sf, hasil : Real;
begin
if btnproses.Caption='Proses' then
 begin
  if edtnm.Text='' then
   begin
     MessageDlg('Nama Pemilik Lahan Belum Dipilih',mtInformation,[mbOK],0);
     btn1.Click;
     Exit;
   end;

  if dblkcbblahan.KeyValue=null then
   begin
     MessageDlg('Lahan Belum Dipilih',mtInformation,[mbOK],0);
     dblkcbblahan.SetFocus;
     Exit;
   end;

  with dm.qrykelpem2 do
   begin
    close;
    SQL.Clear;
    SQL.Add('select * from tbl_kelpemilik where id_pemilik='+QuotedStr(edtidpemilik.Text)+' and lahan='+QuotedStr(dblkcbblahan.KeyValue)+'');
    Open;
   end;

  for a:=1 to dm.qrykelpupuk.RecordCount do
   begin
     dm.qrykelpupuk.RecNo:=a;

     if (dm.qrykelpem2.FieldByName('kel_tinggi').AsFloat >= dm.qrykelpupuk.FieldByName('tinggi_min').AsFloat) and
        (dm.qrykelpem2.FieldByName('kel_tinggi').AsFloat <= dm.qrykelpupuk.FieldByName('tinggi_max').AsFloat) then
          begin
            bbt_tinggi:=0;
          end
          else
          begin
            tampungnilai:=dm.qrykelpem2.fieldbyname('tinggi').AsFloat - dm.qrykelpupuk.fieldbyname('tinggi_max').AsFloat;
            bbt_tinggi:=tampungnilai/10;
          end;

      bbt_curah:=dm.qrykelpupuk.fieldbyname('curah').AsFloat - dm.qrykelpem2.fieldbyname('kel_curah').AsFloat;
      bbt_suhu:=dm.qrykelpupuk.fieldbyname('suhu').AsFloat - dm.qrykelpem2.fieldbyname('kel_suhu').AsFloat;
      bbt_ph:=dm.qrykelpupuk.fieldbyname('ph').AsFloat - dm.qrykelpem2.fieldbyname('kel_ph').AsFloat;

      if bbt_tinggi=0 then nil_tinggi:=5 else
      if bbt_tinggi=1 then nil_tinggi:=4.5 else
      if bbt_tinggi=-1 then nil_tinggi:=4 else
      if bbt_tinggi=2 then nil_tinggi:=3.5 else
      if bbt_tinggi=-2 then nil_tinggi:=3 else
      if bbt_tinggi=3 then nil_tinggi:=2.5 else
      if bbt_tinggi=-3 then nil_tinggi:=2 else
      if bbt_tinggi>=4 then nil_tinggi:=1.1 else
      if bbt_tinggi>=-4 then nil_tinggi:=1;

      if bbt_curah=0 then nil_curah:=5 else
      if bbt_curah=1 then nil_curah:=4.5 else
      if bbt_curah=-1 then nil_curah:=4 else
      if bbt_curah=2 then nil_curah:=3.5 else
      if bbt_curah=-2 then nil_curah:=3 else
      if bbt_curah=3 then nil_curah:=2.5 else
      if bbt_curah=-3 then nil_curah:=2 else
      if bbt_curah>=4 then nil_curah:=1.1 else
      if bbt_curah>=-4 then nil_curah:=1;

      if bbt_suhu=0 then nil_suhu:=5 else
      if bbt_suhu=1 then nil_suhu:=4.5 else
      if bbt_suhu=-1 then nil_suhu:=4 else
      if bbt_suhu=2 then nil_suhu:=3.5 else
      if bbt_suhu=-2 then nil_suhu:=3 else
      if bbt_suhu=3 then nil_suhu:=2.5 else
      if bbt_suhu=-3 then nil_suhu:=2 else
      if bbt_suhu>=4 then nil_suhu:=1.1 else
      if bbt_suhu>=-4 then nil_suhu:=1;

      if bbt_ph=0 then nil_ph:=5 else
      if bbt_ph=1 then nil_ph:=4.5 else
      if bbt_ph=-1 then nil_ph:=4 else
      if bbt_ph=2 then nil_ph:=3.5 else
      if bbt_ph=-2 then nil_ph:=3 else
      if bbt_ph=3 then nil_ph:=2.5 else
      if bbt_ph=-3 then nil_ph:=2 else
      if bbt_ph>=4 then nil_ph:=1.1 else
      if bbt_ph>=-4 then nil_ph:=1;

       cf:=(nil_suhu + nil_ph) / 2;
       sf:=(nil_tinggi + nil_curah)/2;

       hasil:=((60/100)*cf) + ((40/100)*sf);

       with dm.qrymatching do
        begin
          Append;
          FieldByName('id_transaksi').AsString:=edtnotrans.Text;
          FieldByName('id_pemilik').AsString:=edtidpemilik.Text;
          FieldByName('id_pupuk').AsString:=dm.qrykelpupuk.fieldbyname('id_pupuk').AsString;
          FieldByName('bbt_tinggi').AsString:=FloatToStr(nil_tinggi);
          FieldByName('bbt_curah').AsString:=FloatToStr(nil_curah);
          FieldByName('bbt_suhu').AsString:=FloatToStr(nil_suhu);
          FieldByName('bbt_ph').AsString:=FloatToStr(nil_ph);
          FieldByName('core').AsString:=FloatToStr(cf);
          FieldByName('second').AsString:=FloatToStr(sf);
          FieldByName('hasil').AsString:=FloatToStr(hasil);
          FieldByName('lahan').AsString:=dblkcbblahan.KeyValue;
          Post;
        end;
   end;
   a:=a+1;

   konek;
   lbl8.Caption:='Pupuk yang Cocok Digunakan Yaitu Jenis Pupuk '+DBGrid1.Fields[4].AsString;
   btnproses.Caption:='Bersih';
 end
 else
if btnproses.Caption='Bersih' then
 begin
   kosong;
   lbl8.Caption:='';
   FormShow(Sender);
 end;
end;

procedure Tfproses.FormShow(Sender: TObject);
var kode: string;
begin
 with dm.qrymatching do
  begin
    if IsEmpty then kode:='001' else
     begin
       Last;
       kode:=RightStr(fieldbyname('id_transaksi').AsString,3);
       kode:=IntToStr(StrToInt(kode)+1);
     end;
  end;
  edtnotrans.Text:='TRS-'+format('%.3d',[StrToInt(kode)]);
  edtnm.Clear; edtnm.Enabled:=false;
  dblkcbblahan.Enabled:=false; dblkcbblahan.KeyValue:=null;

  edttinggi.Enabled:=false; edttinggi.Clear;
  edtcurah.Enabled:=false; edtcurah.Clear;
  edtsuhu.Enabled:=false; edtsuhu.Clear;
  edtph.Enabled:=false; edtph.Clear;

  kosong;
  lbl8.Caption:='';

  btnproses.Caption:='Proses';
end;

procedure Tfproses.konek;
begin
 with dm.qrytampilmatching do
  begin
    Close;
    SQL.Clear;
    sql.Add('select a.id_transaksi, b.id_pemilik, b.nm_pemilik, a.lahan, c.id_pupuk, c.jns_pupuk, a.bbt_tinggi,');
    sql.Add('a.bbt_curah, a.bbt_suhu, a.bbt_ph, a.core, a.second, a.hasil from tbl_prosesmatching a,');
    sql.Add('tbl_pemilik b, tbl_pupuk c where a.id_pemilik=b.id_pemilik and a.id_pupuk=c.id_pupuk and a.id_pemilik='+QuotedStr(edtidpemilik.Text)+'');
    sql.Add(' and a.lahan='+QuotedStr(dblkcbblahan.KeyValue)+' order by a.hasil desc');
    Open;
  end;
end;

procedure Tfproses.kosong;
begin
 with dm.qrytampilmatching do
  begin
    Close;
    SQL.Clear;
    sql.Add('select a.id_transaksi, b.id_pemilik, b.nm_pemilik, a.lahan, c.id_pupuk, c.jns_pupuk, a.bbt_tinggi,');
    sql.Add('a.bbt_curah, a.bbt_suhu, a.bbt_ph, a.core, a.second, a.hasil from tbl_prosesmatching a,');
    sql.Add('tbl_pemilik b, tbl_pupuk c where a.id_pemilik=b.id_pemilik and a.id_pupuk=c.id_pupuk and a.id_pemilik='+QuotedStr('kosong')+'');
    Open;
  end;
end;

end.
