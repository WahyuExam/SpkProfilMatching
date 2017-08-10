unit ukelpetani;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  Tfkeltani = class(TForm)
    grp1: TGroupBox;
    lbl1: TLabel;
    grp2: TGroupBox;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    edtnotrans: TEdit;
    edtnm: TEdit;
    edttinggi: TEdit;
    edtcurah: TEdit;
    edtsuhu: TEdit;
    edtph: TEdit;
    grp3: TGroupBox;
    btntambah: TBitBtn;
    btnsimpan: TBitBtn;
    btnubah: TBitBtn;
    btnhapus: TBitBtn;
    btnsimpan2: TBitBtn;
    grp4: TGroupBox;
    lbl9: TLabel;
    edtpencarian: TEdit;
    btnkeluar: TBitBtn;
    grp5: TGroupBox;
    DBGrid1: TDBGrid;
    btn1: TBitBtn;
    edtkode: TEdit;
    img1: TImage;
    procedure btnkeluarClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure konek;
    procedure btntambahClick(Sender: TObject);
    procedure edttinggiKeyPress(Sender: TObject; var Key: Char);
    procedure btnsimpanClick(Sender: TObject);
    procedure btnsimpan2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnubahClick(Sender: TObject);
    procedure edtpencarianKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure kosong;
    procedure btnhapusClick(Sender: TObject);
    procedure aktif;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fkeltani: Tfkeltani;
  ulang:Boolean;
  curah, suhu, ph, a, lahan : Integer;

implementation

uses
  udm, ubntupem, DB, StrUtils;

{$R *.dfm}

procedure Tfkeltani.btnkeluarClick(Sender: TObject);
begin
close;
end;

procedure Tfkeltani.btn1Click(Sender: TObject);
begin
fbantupemilik.edt2.Text:='spek';
fbantupemilik.ShowModal;
end;

procedure Tfkeltani.FormShow(Sender: TObject);
begin
 grp2.Enabled:=False;

 edtnotrans.Clear;
 edtkode.Clear;
 edtnm.Clear;
 edttinggi.Clear;
 edtcurah.Clear;
 edtsuhu.Clear;
 edtph.Clear;

 btntambah.Caption:='Tambah'; btntambah.Enabled:=True;
 btnsimpan.Enabled:=false;
 btnubah.Enabled:=false;
 btnhapus.Enabled:=false;

 edtpencarian.Clear; edtpencarian.Enabled:=True;
 btn1.Enabled:=false;
 //konek;
 kosong;

 btnsimpan2.SendToBack;
end;

procedure Tfkeltani.konek;
begin
  with dm.qrytampilkelpem do
   begin
     close;
     SQL.Clear;
     SQL.Add('select a.id_pemilik, a.nm_pemilik, a.tgl_lhir, a.alamat, b.tinggi, b.curah, b.suhu, b.ph,');
     sql.Add('b.kel_tinggi, b.kel_curah, b.kel_suhu, b.kel_ph, b.notrans, b.lahan from tbl_pemilik a,');
     sql.Add('tbl_kelpemilik b where b.id_pemilik=a.id_pemilik and a.id_pemilik='+QuotedStr(edtkode.Text)+'');
     Open;
   end;
end;

procedure Tfkeltani.btntambahClick(Sender: TObject);
var kode:string;
begin
 if btntambah.Caption='Tambah' then
  begin
    with dm.qrykelpem do
     begin
      if IsEmpty then kode:='001' else
        begin
         Last;
         kode:=RightStr(fieldbyname('notrans').AsString,3);
         kode:=IntToStr(StrToInt(kode)+1);
        end;
     end;
     edtnotrans.Text:='TR-'+format('%.3d',[StrToInt(kode)]);

     grp2.Enabled:=True;
     edtnotrans.Enabled:=false;
     edtnm.Enabled:=false;
     btn1.Enabled:=True;
     edttinggi.Enabled:=True;
     edtcurah.Enabled:=True;
     edtsuhu.Enabled:=True;
     edtph.Enabled:=True;

     btntambah.Caption:='Batal';
     btnsimpan.Enabled:=True;
     btnubah.Enabled:=false;
     btnhapus.Enabled:=false;

     edtpencarian.Enabled:=false;

     btnsimpan2.SendToBack;
  end
  else
 if (btntambah.Caption='Batal') or (btntambah.Caption='Selesai') then
  begin
    FormShow(Sender);
  end;

end;

procedure Tfkeltani.edttinggiKeyPress(Sender: TObject; var Key: Char);
begin
if not(key in['0'..'9','.',#13,#9,#8]) then key:=#0;
if Key=#13 then SelectNext(sender as TWinControl, True,True);
end;

procedure Tfkeltani.btnsimpanClick(Sender: TObject);
begin
 if (edtnm.Text='') or (edttinggi.Text='') or (edtcurah.Text='') or (edtsuhu.Text='') or (edtph.Text='') then
  begin
    MessageDlg('Semua Data Wajib Diisi',mtWarning,[mbok],0);
    Exit;
  end;

  if dm.qrykelpem.Locate('id_pemilik;tinggi;curah;suhu;ph',VarArrayOf([edtkode.Text,edttinggi.Text,edtcurah.Text,edtsuhu.Text,edtph.Text]),[]) then
   begin
     MessageDlg('Data Sudah Ada',mtInformation,[mbOK],0);
     Exit;
   end;

  with dm.qrykelpem do
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
     FieldByName('id_pemilik').AsString:=edtkode.Text;
     FieldByName('tinggi').AsString:=edttinggi.Text;
     FieldByName('curah').AsString:=edtcurah.Text;
     FieldByName('suhu').AsString:=edtsuhu.Text;
     FieldByName('ph').AsString:=edtph.Text;
     FieldByName('kel_tinggi').AsString:=edttinggi.Text;
     FieldByName('kel_curah').AsString:=IntToStr(curah);
     FieldByName('kel_suhu').AsString:=IntToStr(suhu);
     FieldByName('kel_ph').AsString:=IntToStr(ph);
     FieldByName('notrans').AsString:=edtnotrans.Text;
     Post;
   end;

   with dm.qrykelpem do
    begin
     close;
     SQL.Clear;
     SQL.Text:='select * from tbl_kelpemilik where id_pemilik='+QuotedStr(edtkode.Text)+'';
     Open;

     for a:=1 to RecordCount do
      begin
        RecNo:=a;

        Edit;
        FieldByName('lahan').AsString:=IntToStr(a);
        Post;
      end;
      a:=a+1;
    end;

   //FormShow(sender);

   edtnotrans.Enabled:=False;
   edtnm.Enabled:=false;
   btn1.Enabled:=false;

   edtcurah.Clear;
   edttinggi.Clear;
   edtsuhu.Clear;
   edtph.Clear;
   edttinggi.SetFocus;

   btnsimpan.BringToFront;

   konek;
   MessageDlg('Data Sudah Disimpan',mtInformation,[mbok],0);
   btntambah.Caption:='Selesai';
end;

procedure Tfkeltani.btnsimpan2Click(Sender: TObject);
begin
if (edtnm.Text='') or (edttinggi.Text='') or (edtcurah.Text='') or (edtsuhu.Text='') or (edtph.Text='') then
  begin
    MessageDlg('Semua Data Wajib Diisi',mtWarning,[mbok],0);
    Exit;
  end;

  with dm.qrykelpem do
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
     FieldByName('id_pemilik').AsString:=edtkode.Text;
     FieldByName('tinggi').AsString:=edttinggi.Text;
     FieldByName('curah').AsString:=edtcurah.Text;
     FieldByName('suhu').AsString:=edtsuhu.Text;
     FieldByName('ph').AsString:=edtph.Text;
     FieldByName('kel_tinggi').AsString:=edttinggi.Text;
     FieldByName('kel_curah').AsString:=IntToStr(curah);
     FieldByName('kel_suhu').AsString:=IntToStr(suhu);
     FieldByName('kel_ph').AsString:=IntToStr(ph);
     FieldByName('notrans').AsString:=edtnotrans.Text;
     Post;
   end;

   edtnotrans.Enabled:=False;
   edtnm.Enabled:=false;
   btn1.Enabled:=false;

   edtcurah.Clear;
   edttinggi.Clear;
   edtsuhu.Clear;
   edtph.Clear;
   edttinggi.SetFocus;

   btnsimpan.BringToFront;
   btnsimpan.Enabled:=True;

   konek;
   MessageDlg('Data Sudah Disimpan',mtInformation,[mbok],0);
   btntambah.Caption:='Selesai';
end;

procedure Tfkeltani.DBGrid1DblClick(Sender: TObject);
begin
  edtnotrans.Text:=DBGrid1.Fields[1].AsString;
  edtnm.Text:=DBGrid1.Fields[2].AsString;
  edttinggi.Text:=DBGrid1.Fields[5].AsString;
  edtcurah.Text:=DBGrid1.Fields[6].AsString;
  edtsuhu.Text:=DBGrid1.Fields[7].AsString;
  edtph.Text:=DBGrid1.Fields[8].AsString;
  edtkode.Text:=DBGrid1.Fields[13].AsString;

  btntambah.Caption:='Batal';
  btnubah.Enabled:=True;
  btnhapus.Enabled:=True;
  btnsimpan.Enabled:=false;

  edtpencarian.Enabled:=false; edtpencarian.Clear;

  grp2.Enabled:=false;
end;

procedure Tfkeltani.btnubahClick(Sender: TObject);
begin
 grp2.Enabled:=True;

 edtnotrans.Enabled:=false;
 edtnm.Enabled:=False;
 btn1.Enabled:=false;
 edttinggi.SetFocus;

 btnubah.Enabled:=false;
 btnhapus.Enabled:=false;
 btnsimpan2.BringToFront; btnsimpan2.Enabled:=True;
end;

procedure Tfkeltani.edtpencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if edtpencarian.Text='' then konek else
  begin
   with dm.qrytampilkelpem do
    begin
     DisableControls;
     close;
     SQL.Clear;
     SQL.Add('select a.id_pemilik, a.nm_pemilik, a.tgl_lhir, a.alamat, b.tinggi, b.curah, b.suhu, b.ph,');
     sql.Add('b.kel_tinggi, b.kel_curah, b.kel_suhu, b.kel_ph, b.notrans, b.lahan from tbl_pemilik a, tbl_kelpemilik b where b.id_pemilik=a.id_pemilik');
     sql.Add('and b.notrans like ''%'+edtpencarian.Text+'%'' or a.nm_pemilik like ''%'+edtpencarian.Text+'%''');
     Open;
     EnableControls;
    end;
  end;
end;

procedure Tfkeltani.kosong;
begin
  with dm.qrytampilkelpem do
   begin
     close;
     SQL.Clear;
     SQL.Add('select a.id_pemilik, a.nm_pemilik, a.tgl_lhir, a.alamat, b.tinggi, b.curah, b.suhu, b.ph,');
     sql.Add('b.kel_tinggi, b.kel_curah, b.kel_suhu, b.kel_ph, b.notrans, b.lahan from tbl_pemilik a,');
     sql.add('tbl_kelpemilik b where b.id_pemilik=a.id_pemilik and a.id_pemilik='+QuotedStr('kosong')+'');
     Open;
   end;
end;

procedure Tfkeltani.btnhapusClick(Sender: TObject);
begin
if MessageDlg('Yakin Data Mau dihapus ?',mtConfirmation,[mbYes,mbNo],0)=mryes then
 begin
   dm.qrykelpem.Delete;

   edtnotrans.Enabled:=False;
   edtnm.Enabled:=false;
   btn1.Enabled:=false;

   edtcurah.Clear;
   edttinggi.Clear;
   edtsuhu.Clear;
   edtph.Clear;
   aktif;
   edttinggi.SetFocus;

   btnsimpan.BringToFront;
   btnsimpan.Enabled:=True;
   btnubah.Enabled:=false;
   btnhapus.Enabled:=false;

   konek;
   MessageDlg('Data Sudah Disimpan',mtInformation,[mbok],0);
   btntambah.Caption:='Selesai';

 end;
end;

procedure Tfkeltani.aktif;
begin
 grp2.Enabled:=True;
 edtnm.Enabled:=false;
 btn1.Enabled:=false;
end;

end.
