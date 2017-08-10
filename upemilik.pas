unit upemilik;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, jpeg, ExtCtrls;

type
  Tfpemilik = class(TForm)
    grp1: TGroupBox;
    lbl1: TLabel;
    grp2: TGroupBox;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edtkode: TEdit;
    edtnm: TEdit;
    grp3: TGroupBox;
    btntambah: TBitBtn;
    btnsimpan: TBitBtn;
    btnubah: TBitBtn;
    btnhapus: TBitBtn;
    grp4: TGroupBox;
    lbl9: TLabel;
    edtpencarian: TEdit;
    btnkeluar: TBitBtn;
    grp5: TGroupBox;
    DBGrid1: TDBGrid;
    dtp1: TDateTimePicker;
    mmo1: TMemo;
    img1: TImage;
    edt1: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnkeluarClick(Sender: TObject);
    procedure btntambahClick(Sender: TObject);
    procedure konek;
    procedure edtnmKeyPress(Sender: TObject; var Key: Char);
    procedure btnsimpanClick(Sender: TObject);
    procedure btnubahClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnhapusClick(Sender: TObject);
    procedure edtpencarianKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtnmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtnmKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mmo1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtp1CloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fpemilik: Tfpemilik;
  status, tanpung : string;
  x : Integer;

implementation

uses
  udm, DB, StrUtils;

{$R *.dfm}

procedure Tfpemilik.FormShow(Sender: TObject);
begin
 grp2.Enabled:=false;

 edtkode.Clear;
 edtnm.Clear;
 mmo1.Clear;
 dtp1.Date:=Now;

 edtpencarian.Clear; edtpencarian.Enabled:=True;
 btntambah.Caption:='Tambah'; btntambah.Enabled:=True;
 btnsimpan.Enabled:=false;
 btnubah.Enabled:=false;
 btnhapus.Enabled:=False;

 konek;
 x:=0;
end;

procedure Tfpemilik.btnkeluarClick(Sender: TObject);
begin
Close;
end;

procedure Tfpemilik.btntambahClick(Sender: TObject);
var kode:string;
begin
 if btntambah.Caption='Tambah' then
  begin
    with dm.qrypemilik do
     begin
       if IsEmpty then kode:='01' else
        begin
          Last;
          kode := RightStr(fieldbyname('id_pemilik').AsString,2);
          kode := IntToStr(StrToInt(kode)+1);
        end;
     end;
     edtkode.Text:='PL-'+format('%.2d',[StrToInt(kode)]);

     grp2.Enabled:=True; edtkode.Enabled:=False;
     edtnm.SetFocus;
     edtpencarian.Enabled:=false;

     btntambah.Caption:='Batal';
     btnsimpan.Enabled:=True;
     btnubah.Enabled:=false;
     btnhapus.Enabled:=false;

     status:='simpan';
  end
  else
 if btntambah.Caption='Batal' then
  begin
    FormShow(Sender);
  end;
end;

procedure Tfpemilik.konek;
begin
with dm.qrypemilik do
 begin
   close;
   sql.Clear;
   SQL.Text:='select * from tbl_pemilik';
   Open;
 end;
end;

procedure Tfpemilik.edtnmKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['a'..'z','A'..'Z',#32, #13, #8, #9, '.', ',','''']) then Key:=#0;
end;

procedure Tfpemilik.btnsimpanClick(Sender: TObject);
begin
 if (edtnm.Text='') or (mmo1.Text='') then
  begin
   MessageDlg('Semua Data Wajib Diisi',mtWarning,[mbOK],0);
   Exit;
  end;

 tanpung:=FloatToStr(Round(StrToFloat(FloatToStr((StrToDate(DateToStr(Now))-StrToDate(DateToStr(dtp1.Date)))/360))));
 if StrToInt(tanpung) < 17 then
  begin
    MessageDlg('Usia Minimal 17 Tahun',mtInformation,[mbok],0);
    dtp1.Date:=Now;
    Exit;
  end;


 if dm.qrypemilik.Locate('nm_pemilik;tgl_lhir',VarArrayOf([edtnm.Text,DateToStr(dtp1.Date)]),[]) then
  begin
    MessageDlg('Data Sudah Ada',mtWarning,[mbok],0);
    edtnm.SetFocus;
    Exit;
  end;

  if status='simpan' then dm.qrypemilik.Append else dm.qrypemilik.Edit;

  with dm.qrypemilik do
   begin
     FieldByName('id_pemilik').AsString:=edtkode.Text;
     FieldByName('nm_pemilik').AsString:=edtnm.Text;
     FieldByName('tgl_lhir').AsString:=DateToStr(dtp1.Date);
     FieldByName('alamat').AsString:=mmo1.Text;
     Post
   end;
   MessageDlg('Data Sudah Disimpan',mtInformation,[mbOK],0);
   FormShow(sender);
end;

procedure Tfpemilik.btnubahClick(Sender: TObject);
begin
status:='ubah';

btnubah.Enabled:=false;
btnhapus.Enabled:=false;
btnsimpan.Enabled:=True;
grp2.Enabled:=True;
edtnm.Enabled:=True; edtnm.SetFocus;
dtp1.Enabled:=True;
mmo1.Enabled:=True;
edtkode.Enabled:=false;

end;

procedure Tfpemilik.DBGrid1DblClick(Sender: TObject);
begin
 edtkode.Text:=DBGrid1.Fields[0].AsString;
 edtnm.Text:=DBGrid1.Fields[1].AsString;
 dtp1.Date:=StrToDate(DBGrid1.Fields[2].AsString);
 mmo1.Text:=DBGrid1.Fields[3].AsString;

 btnubah.Enabled:=True;
 btntambah.Caption:='Batal';
 btnhapus.Enabled:=True;
 btnsimpan.Enabled:=false;
end;

procedure Tfpemilik.btnhapusClick(Sender: TObject);
begin
if MessageDlg('Yakin Data Akan Dihapus ?',mtConfirmation,[mbYes,mbNo],0)=mryes then
 begin
   dm.qrypemilik.Delete;
   FormShow(sender);
   MessageDlg('Data Berhasil Dihapus',mtInformation,[mbOK],0);
 end;
end;

procedure Tfpemilik.edtpencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtpencarian.Text='' then konek else
 begin
   with dm.qrypemilik do
    begin
      close;
      sql.Clear;
      sql.Text:='select * from tbl_pemilik where id_pemilik like ''%'+edtpencarian.Text+'%'' or nm_pemilik like ''%'+edtpencarian.Text+'%''';
      Open;
    end;
 end;
end;

procedure Tfpemilik.edtnmKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=vk_space then x:=x+1 else x:=0;
if x > 1 then key:=VK_LEFT;
end;

procedure Tfpemilik.edtnmKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtnm.Text=edt1.Text then edtnm.Text:='';
end;

procedure Tfpemilik.mmo1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if mmo1.Text=edt1.Text then mmo1.Text:='';
end;

procedure Tfpemilik.dtp1CloseUp(Sender: TObject);
begin
 tanpung:=FloatToStr(Round(StrToFloat(FloatToStr((StrToDate(DateToStr(Now))-StrToDate(DateToStr(dtp1.Date)))/360))));
 if StrToInt(tanpung) < 17 then
  begin
    MessageDlg('Usia Minimal 17 Tahun',mtInformation,[mbok],0);
    dtp1.Date:=Now;
    Exit;
  end;

 if dtp1.Date > Now then
  begin
    MessageDlg('Tanggal Salah',mtWarning,[mbok],0);
    dtp1.Date:=Now;
    Exit;
  end;
end;

end.
