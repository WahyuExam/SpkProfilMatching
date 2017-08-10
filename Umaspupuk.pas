unit Umaspupuk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, jpeg, ExtCtrls;

type
  Tfmaspupuk = class(TForm)
    grp1: TGroupBox;
    lbl1: TLabel;
    grp2: TGroupBox;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    edtkode: TEdit;
    edtjns: TEdit;
    edttgnmin: TEdit;
    edttgnmax: TEdit;
    edtcurah: TEdit;
    edtsuhu: TEdit;
    edtph: TEdit;
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
    btnsimpan2: TBitBtn;
    img1: TImage;
    edt1: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnkeluarClick(Sender: TObject);
    procedure btntambahClick(Sender: TObject);
    procedure edtjnsKeyPress(Sender: TObject; var Key: Char);
    procedure edttgnminKeyPress(Sender: TObject; var Key: Char);
    procedure btnsimpanClick(Sender: TObject);
    procedure btnsimpan2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnubahClick(Sender: TObject);
    procedure btnhapusClick(Sender: TObject);
    procedure konek;
    procedure edtpencarianKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtjnsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtjnsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmaspupuk: Tfmaspupuk;
  status : string;
  ulang:Boolean;
  curah, suhu, ph : Integer;
  x : Integer;

implementation

uses
  udm, ADODB, DB, StrUtils;

{$R *.dfm}

procedure Tfmaspupuk.FormShow(Sender: TObject);
begin
 grp2.Enabled:=False;
 edtkode.Clear;
 edtjns.Clear;
 edttgnmin.Clear;
 edttgnmax.Clear;
 edtcurah.Clear;
 edtsuhu.Clear;
 edtph.Clear;

 btntambah.Enabled:=True; btntambah.Caption:='Tambah';
 btnsimpan.Enabled:=false; btnsimpan.Caption:='Simpan'; btnsimpan.BringToFront;
 btnubah.Enabled:=false;
 btnhapus.Enabled:=false;

 edtpencarian.Clear; edtpencarian.Enabled:=True;
 konek;
 x:=0;
end;

procedure Tfmaspupuk.btnkeluarClick(Sender: TObject);
begin
close;
end;

procedure Tfmaspupuk.btntambahClick(Sender: TObject);
var kode: string;
begin
if btntambah.Caption='Tambah' then
 begin
   with dm.qrypupuk do
    begin
      if IsEmpty then kode:='01' else
       begin
         Last;
         kode:=RightStr(fieldbyname('id_pupuk').AsString,2);
         kode:=IntToStr(StrToInt(kode)+1);
       end;
    end;
    edtkode.Text:='PU-'+Format('%.2d',[StrToInt(kode)]);
    btntambah.Caption:='Batal';

    grp2.Enabled:=True;
    edtkode.Enabled:=false;
    edtjns.SetFocus;

    btnsimpan.Enabled:=True; btnsimpan.Caption:='Simpan';
    status:='simpan';
    btnsimpan2.SendToBack;

    edtpencarian.Enabled:=false;
    edtpencarian.Clear;
 end
 else
if btntambah.Caption='Batal' then
 begin
   FormShow(sender);
 end;
end;

procedure Tfmaspupuk.edtjnsKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['a'..'z','A'..'Z','0'..'9',#13,#32,#8,#9,'.',',','''']) then key:=#0;
if Key=#13 then edttgnmin.SetFocus;
end;

procedure Tfmaspupuk.edttgnminKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#13,#8,#9,'.']) then key:=#0;
if Key=#13 then SelectNext(sender as TWinControl, True, True);

end;

procedure Tfmaspupuk.btnsimpanClick(Sender: TObject);
begin
 if (edtjns.Text='') or (edttgnmin.Text='') or (edttgnmax.Text='') or (edtcurah.Text='') or (edtsuhu.Text='') or (edtph.Text='') then
  begin
    MessageDlg('Semua Data Wajib Diisi',mtInformation,[mbok],0);
    Exit;
  end;

   with dm.qrypupuk do
    begin
      if Locate('jns_pupuk',edtjns.Text,[]) then
       begin
         MessageDlg('Jenis Pupuk Sudah Ada',mtInformation,[mbOK],0);
         Exit;
       end
       else
       begin
         Append;
         FieldByName('id_pupuk').AsString:=edtkode.Text;
         FieldByName('jns_pupuk').AsString:=edtjns.Text;
         FieldByName('tinggi_min').AsString:=edttgnmin.Text;
         FieldByName('tinggi_max').AsString:=edttgnmax.Text;
         FieldByName('curah').AsString:=edtcurah.Text;
         FieldByName('suhu').AsString:=edtsuhu.Text;
         FieldByName('ph').AsString:=edtph.Text;
         Post;
       end;
    end;

 with dm.qrykelpupuk do
  begin
    ulang:=True;
    while ulang=True do
     begin
       dm.qrynilbatas.RecNo:=1;
       //curah
       if StrToFloat(edtcurah.Text) < StrToFloat(dm.qrynilbatas.fieldbyname('curah1').AsString) then
         begin
          curah:=1;
          ulang:=false;
         end
         else
       if (StrToFloat(edtcurah.Text) >= StrToFloat(dm.qrynilbatas.fieldbyname('curah2a').AsString)) and
          (StrToFloat(edtcurah.Text) <= StrToFloat(dm.qrynilbatas.fieldbyname('curah2b').AsString)) then
           begin
            curah:=2;
            ulang:=false;
           end
           else
       if (StrToFloat(edtcurah.Text) >= StrToFloat(dm.qrynilbatas.fieldbyname('curah3a').AsString)) and
          (StrToFloat(edtcurah.Text) <= StrToFloat(dm.qrynilbatas.fieldbyname('curah3b').AsString)) then
           begin
            curah:=3;
            ulang:=false;
            end
            else
       if (StrToFloat(edtcurah.Text) >= StrToFloat(dm.qrynilbatas.fieldbyname('curah4a').AsString)) and
          (StrToFloat(edtcurah.Text) <= StrToFloat(dm.qrynilbatas.fieldbyname('curah4b').AsString)) then
           begin
            curah:=4;
            ulang:=false;
            end
           else
       if StrToFloat(edtcurah.Text) > StrToFloat(dm.qrynilbatas.fieldbyname('curah5').AsString) then
         begin
          curah:=5;
          ulang:=false;
         end;

         //suhu
         if StrToFloat(edtsuhu.Text) < StrToFloat(dm.qrynilbatas.fieldbyname('suhu1').AsString) then
         begin
          suhu:=1;
          ulang:=false;
         end
         else
       if (StrToFloat(edtsuhu.Text) >= StrToFloat(dm.qrynilbatas.fieldbyname('suhu2a').AsString)) and
          (StrToFloat(edtsuhu.Text) <= StrToFloat(dm.qrynilbatas.fieldbyname('suhu2b').AsString)) then
           begin
            suhu:=2;
            ulang:=false;
           end
           else
       if (StrToFloat(edtsuhu.Text) >= StrToFloat(dm.qrynilbatas.fieldbyname('suhu3a').AsString)) and
          (StrToFloat(edtsuhu.Text) <= StrToFloat(dm.qrynilbatas.fieldbyname('suhu3b').AsString)) then
           begin
            suhu:=3;
            ulang:=false;
            end
            else
       if (StrToFloat(edtsuhu.Text) >= StrToFloat(dm.qrynilbatas.fieldbyname('suhu4a').AsString)) and
          (StrToFloat(edtsuhu.Text) <= StrToFloat(dm.qrynilbatas.fieldbyname('suhu4b').AsString)) then
           begin
            suhu:=4;
            ulang:=false;
            end
           else
       if StrToFloat(edtsuhu.Text) > StrToFloat(dm.qrynilbatas.fieldbyname('suhu5').AsString) then
         begin
          suhu:=5;
          ulang:=false;
         end;


     //ph tanah
     if StrToFloat(edtph.Text) < StrToFloat(dm.qrynilbatas.fieldbyname('ph1').AsString) then
         begin
          ph:=1;
          ulang:=false;
         end
         else
       if (StrToFloat(edtph.Text) >= StrToFloat(dm.qrynilbatas.fieldbyname('ph2a').AsString)) and
          (StrToFloat(edtph.Text) <= StrToFloat(dm.qrynilbatas.fieldbyname('ph2b').AsString)) then
           begin
            ph:=2;
            ulang:=false;
           end
           else
       if (StrToFloat(edtph.Text) >= StrToFloat(dm.qrynilbatas.fieldbyname('ph3a').AsString)) and
          (StrToFloat(edtph.Text) <= StrToFloat(dm.qrynilbatas.fieldbyname('ph3b').AsString)) then
           begin
            ph:=3;
            ulang:=false;
            end
            else
       if (StrToFloat(edtph.Text) >= StrToFloat(dm.qrynilbatas.fieldbyname('ph4a').AsString)) and
          (StrToFloat(edtph.Text) <= StrToFloat(dm.qrynilbatas.fieldbyname('ph4b').AsString)) then
           begin
            ph:=4;
            ulang:=false;
            end
           else
       if StrToFloat(edtph.Text) > StrToFloat(dm.qrynilbatas.fieldbyname('ph5').AsString) then
         begin
          ph:=5;
          ulang:=false;
         end;
     end;
     Append;
     FieldByName('id_pupuk').AsString:=edtkode.Text;
     FieldByName('tinggi_min').AsString:=edttgnmin.Text;
     FieldByName('tinggi_max').AsString:=edttgnmax.Text;
     FieldByName('curah').AsString:=IntToStr(curah);
     FieldByName('suhu').AsString:=IntToStr(suhu);
     FieldByName('ph').AsString:=IntToStr(ph);
     Post;
  end;

 MessageDlg('Data Sudah Disimpan',mtInformation,[mbok],0);
 FormShow(sender);
end;

procedure Tfmaspupuk.btnsimpan2Click(Sender: TObject);
begin
 if (edtjns.Text='') or (edttgnmin.Text='') or (edttgnmax.Text='') or (edtcurah.Text='') or (edtsuhu.Text='') or (edtph.Text='') then
  begin
    MessageDlg('Semua Data Wajib Diisi',mtInformation,[mbok],0);
    Exit;
  end;

   with dm.qrypupuk do
    begin
     { if Locate('jns_pupuk',edtjns.Text,[]) then
       begin
         MessageDlg('Jenis Pupuk Sudah Ada',mtInformation,[mbOK],0);
         Exit;
       end
       else   }
      // begin
         Edit;
         FieldByName('id_pupuk').AsString:=edtkode.Text;
         FieldByName('jns_pupuk').AsString:=edtjns.Text;
         FieldByName('tinggi_min').AsString:=edttgnmin.Text;
         FieldByName('tinggi_max').AsString:=edttgnmax.Text;
         FieldByName('curah').AsString:=edtcurah.Text;
         FieldByName('suhu').AsString:=edtsuhu.Text;
         FieldByName('ph').AsString:=edtph.Text;
         Post;
      // end;
    end;

 with dm.qrykelpupuk do
  begin
    ulang:=True;
    while ulang=True do
     begin
       dm.qrynilbatas.RecNo:=1;
       //curah
       if StrToFloat(edtcurah.Text) < StrToFloat(dm.qrynilbatas.fieldbyname('curah1').AsString) then
         begin
          curah:=1;
          ulang:=false;
         end
         else
       if (StrToFloat(edtcurah.Text) >= StrToFloat(dm.qrynilbatas.fieldbyname('curah2a').AsString)) and
          (StrToFloat(edtcurah.Text) <= StrToFloat(dm.qrynilbatas.fieldbyname('curah2b').AsString)) then
           begin
            curah:=2;
            ulang:=false;
           end
           else
       if (StrToFloat(edtcurah.Text) >= StrToFloat(dm.qrynilbatas.fieldbyname('curah3a').AsString)) and
          (StrToFloat(edtcurah.Text) <= StrToFloat(dm.qrynilbatas.fieldbyname('curah3b').AsString)) then
           begin
            curah:=3;
            ulang:=false;
            end
            else
       if (StrToFloat(edtcurah.Text) >= StrToFloat(dm.qrynilbatas.fieldbyname('curah4a').AsString)) and
          (StrToFloat(edtcurah.Text) <= StrToFloat(dm.qrynilbatas.fieldbyname('curah4b').AsString)) then
           begin
            curah:=4;
            ulang:=false;
            end
           else
       if StrToFloat(edtcurah.Text) > StrToFloat(dm.qrynilbatas.fieldbyname('curah5').AsString) then
         begin
          curah:=5;
          ulang:=false;
         end;

         //suhu
         if StrToFloat(edtsuhu.Text) < StrToFloat(dm.qrynilbatas.fieldbyname('suhu1').AsString) then
         begin
          suhu:=1;
          ulang:=false;
         end
         else
       if (StrToFloat(edtsuhu.Text) >= StrToFloat(dm.qrynilbatas.fieldbyname('suhu2a').AsString)) and
          (StrToFloat(edtsuhu.Text) <= StrToFloat(dm.qrynilbatas.fieldbyname('suhu2b').AsString)) then
           begin
            suhu:=2;
            ulang:=false;
           end
           else
       if (StrToFloat(edtsuhu.Text) >= StrToFloat(dm.qrynilbatas.fieldbyname('suhu3a').AsString)) and
          (StrToFloat(edtsuhu.Text) <= StrToFloat(dm.qrynilbatas.fieldbyname('suhu3b').AsString)) then
           begin
            suhu:=3;
            ulang:=false;
            end
            else
       if (StrToFloat(edtsuhu.Text) >= StrToFloat(dm.qrynilbatas.fieldbyname('suhu4a').AsString)) and
          (StrToFloat(edtsuhu.Text) <= StrToFloat(dm.qrynilbatas.fieldbyname('suhu4b').AsString)) then
           begin
            suhu:=4;
            ulang:=false;
            end
           else
       if StrToFloat(edtsuhu.Text) > StrToFloat(dm.qrynilbatas.fieldbyname('suhu5').AsString) then
         begin
          suhu:=5;
          ulang:=false;
         end;


     //ph tanah
     if StrToFloat(edtph.Text) < StrToFloat(dm.qrynilbatas.fieldbyname('ph1').AsString) then
         begin
          ph:=1;
          ulang:=false;
         end
         else
       if (StrToFloat(edtph.Text) >= StrToFloat(dm.qrynilbatas.fieldbyname('ph2a').AsString)) and
          (StrToFloat(edtph.Text) <= StrToFloat(dm.qrynilbatas.fieldbyname('ph2b').AsString)) then
           begin
            ph:=2;
            ulang:=false;
           end
           else
       if (StrToFloat(edtph.Text) >= StrToFloat(dm.qrynilbatas.fieldbyname('ph3a').AsString)) and
          (StrToFloat(edtph.Text) <= StrToFloat(dm.qrynilbatas.fieldbyname('ph3b').AsString)) then
           begin
            ph:=3;
            ulang:=false;
            end
            else
       if (StrToFloat(edtph.Text) >= StrToFloat(dm.qrynilbatas.fieldbyname('ph4a').AsString)) and
          (StrToFloat(edtph.Text) <= StrToFloat(dm.qrynilbatas.fieldbyname('ph4b').AsString)) then
           begin
            ph:=4;
            ulang:=false;
            end
           else
       if StrToFloat(edtph.Text) > StrToFloat(dm.qrynilbatas.fieldbyname('ph5').AsString) then
         begin
          ph:=5;
          ulang:=false;
         end;
     end;
     Edit;
     FieldByName('id_pupuk').AsString:=edtkode.Text;
     FieldByName('tinggi_min').AsString:=edttgnmin.Text;
     FieldByName('tinggi_max').AsString:=edttgnmax.Text;
     FieldByName('curah').AsString:=IntToStr(curah);
     FieldByName('suhu').AsString:=IntToStr(suhu);
     FieldByName('ph').AsString:=IntToStr(ph);
     Post;
  end;

 MessageDlg('Data Sudah Diubah',mtInformation,[mbok],0);
 FormShow(sender);
end;

procedure Tfmaspupuk.DBGrid1DblClick(Sender: TObject);
begin
 edtkode.Text:=DBGrid1.Fields[0].AsString;
 edtjns.Text:=DBGrid1.Fields[1].AsString;
 edttgnmin.Text:=DBGrid1.Fields[2].AsString;
 edttgnmax.Text:=DBGrid1.Fields[3].AsString;
 edtcurah.Text:=DBGrid1.Fields[4].AsString;
 edtsuhu.Text:=DBGrid1.Fields[5].AsString;
 edtph.Text:=DBGrid1.Fields[6].AsString;

 btnubah.Enabled:=True;
 btntambah.Caption:='Batal';
 btnhapus.Enabled:=True;
end;

procedure Tfmaspupuk.btnubahClick(Sender: TObject);
begin
 grp2.Enabled:=True;

 edtkode.Enabled:=false;
 edtjns.Enabled:=True;
 edttgnmin.Enabled:=True;
 edttgnmax.Enabled:=True;
 edtcurah.Enabled:=True;
 edtsuhu.Enabled:=True;
 edtph.Enabled:=True;

 btnubah.Enabled:=false;
 btnsimpan2.BringToFront;
end;

procedure Tfmaspupuk.btnhapusClick(Sender: TObject);
begin
  if MessageDlg('Yakin Data Akan Dihapus ?',mtConfirmation,[mbYes,mbNo],0)=mryes then
   begin
     dm.qrypupuk.Delete;
     FormShow(Sender);
     MessageDlg('Data Berhasil Dihapus',mtInformation,[mbOK],0);
   end;
end;

procedure Tfmaspupuk.konek;
begin
with dm.qrypupuk do
 begin
   close;
   SQL.Clear;
   SQL.Text:='select * from tbl_pupuk';
   Open;
 end;
end;

procedure Tfmaspupuk.edtpencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtpencarian.Text='' then konek else
 begin
  with dm.qrypupuk do
   begin
    Close;
    SQL.Clear;
    sql.Text:='select * from tbl_pupuk where id_pupuk like ''%'+edtpencarian.Text+'%'' or jns_pupuk like ''%'+edtpencarian.Text+'%''';
    Open;
   end;
 end;

end;

procedure Tfmaspupuk.edtjnsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=vk_space then x:=x+1 else x:=0;
 if x > 1 then Key:=VK_LEFT;
end;

procedure Tfmaspupuk.edtjnsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtjns.Text=edt1.Text then edtjns.Text:='';
end;

end.
