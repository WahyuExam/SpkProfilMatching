unit Unilbatas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, jpeg, ExtCtrls;

type
  TFnilbatas = class(TForm)
    grp1: TGroupBox;
    lbl1: TLabel;
    grp2: TGroupBox;
    grp3: TGroupBox;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    grp4: TGroupBox;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    grp5: TGroupBox;
    edtcurah1: TEdit;
    edtsuhu1: TEdit;
    edtph1: TEdit;
    edtcurah2: TEdit;
    edtsuhu2: TEdit;
    edtph2: TEdit;
    edtcurah3: TEdit;
    edtsuhu3: TEdit;
    edtph3: TEdit;
    edtcurah4: TEdit;
    edtsuhu4: TEdit;
    edtph4: TEdit;
    edtcurah5: TEdit;
    edtsuhu5: TEdit;
    edtph5: TEdit;
    grp6: TGroupBox;
    lbl17: TLabel;
    grp7: TGroupBox;
    btncampur: TBitBtn;
    btnkeluar: TBitBtn;
    edtid: TEdit;
    lbl18: TLabel;
    edtcurah2b: TEdit;
    lbl19: TLabel;
    edtcurah3b: TEdit;
    lbl20: TLabel;
    edtcurah4b: TEdit;
    edtsuhu2b: TEdit;
    lbl21: TLabel;
    edtph2b: TEdit;
    lbl22: TLabel;
    lbl24: TLabel;
    edtsuhu3b: TEdit;
    lbl25: TLabel;
    edtph3b: TEdit;
    lbl27: TLabel;
    edtsuhu4b: TEdit;
    lbl28: TLabel;
    edtph4b: TEdit;
    img1: TImage;
    edt1: TEdit;
    edtumur5: TEdit;
    edtumur4b: TEdit;
    edtumur4: TEdit;
    edtumur3b: TEdit;
    edtumur3: TEdit;
    edtumur2b: TEdit;
    edtumur2: TEdit;
    edtumur1: TEdit;
    lbl11: TLabel;
    procedure btnkeluarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btncampurClick(Sender: TObject);
    procedure edtcurah1KeyPress(Sender: TObject; var Key: Char);
    procedure edtcurah1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcurah2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcurah2bKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcurah3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcurah3bKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcurah4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcurah4bKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcurah5KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtsuhu1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtsuhu2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtsuhu2bKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtsuhu3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtsuhu3bKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtsuhu4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtsuhu4bKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtsuhu5KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtph1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtph2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtph2bKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtph3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtph3bKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtph4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtph4bKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtph5KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtumur1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtumur2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtumur2bKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtumur3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtumur3bKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtumur4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtumur4bKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtumur5KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fnilbatas: TFnilbatas;

implementation

uses
  udm, DB, uisibatasnilai;

{$R *.dfm}

procedure TFnilbatas.btnkeluarClick(Sender: TObject);
begin
close;
end;

procedure TFnilbatas.FormShow(Sender: TObject);
begin
 with dm.qrynilbatas do
  begin
    edtid.Text:=fieldbyname('idbatas').AsString;
    edtcurah1.Text:=fieldbyname('curah1').AsString;
    edtcurah2.Text:=fieldbyname('curah2a').AsString; edtcurah2b.Text:=fieldbyname('curah2b').AsString;
    edtcurah3.Text:=fieldbyname('curah3a').AsString; edtcurah3b.Text:=fieldbyname('curah3b').AsString;
    edtcurah4.Text:=fieldbyname('curah4a').AsString; edtcurah4b.Text:=fieldbyname('curah4b').AsString;
    edtcurah5.Text:=fieldbyname('curah5').AsString;

    edtsuhu1.Text:=fieldbyname('suhu1').AsString;
    edtsuhu2.Text:=fieldbyname('suhu2a').AsString; edtsuhu2b.Text:=FieldByName('suhu2b').AsString;
    edtsuhu3.Text:=fieldbyname('suhu3a').AsString; edtsuhu3b.Text:=FieldByName('suhu3b').AsString;
    edtsuhu4.Text:=fieldbyname('suhu4a').AsString; edtsuhu4b.Text:=FieldByName('suhu4b').AsString;
    edtsuhu5.Text:=fieldbyname('suhu5').AsString;

    edtph1.Text:=fieldbyname('ph1').AsString;
    edtph2.Text:=fieldbyname('ph2a').AsString; edtph2b.Text:=fieldbyname('ph2b').AsString;
    edtph3.Text:=fieldbyname('ph3a').AsString; edtph3b.Text:=fieldbyname('ph3b').AsString;
    edtph4.Text:=fieldbyname('ph4a').AsString; edtph4b.Text:=fieldbyname('ph4b').AsString;
    edtph5.Text:=fieldbyname('ph5').AsString;

    edtumur1.Text:=fieldbyname('umur1').AsString;
    edtumur2.Text:=fieldbyname('umur2a').AsString; edtumur2b.Text:=fieldbyname('umur2b').AsString;
    edtumur3.Text:=fieldbyname('umur3a').AsString; edtumur3b.Text:=fieldbyname('umur3b').AsString;
    edtumur4.Text:=fieldbyname('umur4a').AsString; edtumur4b.Text:=fieldbyname('umur4b').AsString;
    edtumur5.Text:=fieldbyname('umur5').AsString;
  end;

  grp5.Enabled:=false;
  btncampur.Caption:='Ubah';
end;

procedure TFnilbatas.btncampurClick(Sender: TObject);
begin
if btncampur.Caption='Ubah' then
 begin
 //  grp5.Enabled:=True;
 //  edtcurah1.SetFocus;
   Fisibatas.ShowModal;
   //btncampur.Caption:='Simpan';
 end
 else
if btncampur.Caption='Simpan' then
 begin
  //curah hujan

  if (StrToFloat(edtcurah1.Text) > StrToFloat(edtcurah2.Text)) or
     (StrToFloat(edtcurah1.Text) > StrToFloat(edtcurah2b.Text)) or
     (StrToFloat(edtcurah1.Text) > StrToFloat(edtcurah3.Text)) or
     (StrToFloat(edtcurah1.Text) > StrToFloat(edtcurah3b.Text)) or
     (StrToFloat(edtcurah1.Text) > StrToFloat(edtcurah4.Text)) or
     (StrToFloat(edtcurah1.Text) > StrToFloat(edtcurah4b.Text)) or
     (StrToFloat(edtcurah1.Text) > StrToFloat(edtcurah5.Text)) then
      begin
       MessageDlg('Angka Curah Hujan Salah',mtWarning,[mbOK],0);
       edtcurah1.SetFocus;
       Exit;
      end
      else
  if (StrToFloat(edtcurah2.Text) < StrToFloat(edtcurah1.Text)) or
     (StrToFloat(edtcurah2.Text) > StrToFloat(edtcurah2b.Text)) or
     (StrToFloat(edtcurah2.Text) > StrToFloat(edtcurah3.Text)) or
     (StrToFloat(edtcurah2.Text) > StrToFloat(edtcurah3b.Text)) or
     (StrToFloat(edtcurah2.Text) > StrToFloat(edtcurah4.Text)) or
     (StrToFloat(edtcurah2.Text) > StrToFloat(edtcurah4b.Text)) or
     (StrToFloat(edtcurah2.Text) > StrToFloat(edtcurah5.Text)) then
      begin
        MessageDlg('Angka Curah Hujan Salah',mtWarning,[mbOK],0);
        edtcurah2.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtcurah2b.Text) < StrToFloat(edtcurah1.Text)) or
     (StrToFloat(edtcurah2b.Text) < StrToFloat(edtcurah2.Text)) or
     (StrToFloat(edtcurah2b.Text) > StrToFloat(edtcurah3.Text)) or
     (StrToFloat(edtcurah2b.Text) > StrToFloat(edtcurah3b.Text)) or
     (StrToFloat(edtcurah2b.Text) > StrToFloat(edtcurah4.Text)) or
     (StrToFloat(edtcurah2b.Text) > StrToFloat(edtcurah4b.Text)) or
     (StrToFloat(edtcurah2b.Text) > StrToFloat(edtcurah5.Text)) then
      begin
        MessageDlg('Angka Curah Hujan Salah',mtWarning,[mbOK],0);
        edtcurah2b.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtcurah3.Text) < StrToFloat(edtcurah1.Text)) or
     (StrToFloat(edtcurah3.Text) < StrToFloat(edtcurah2.Text)) or
     (StrToFloat(edtcurah3.Text) < StrToFloat(edtcurah2b.Text)) or
     (StrToFloat(edtcurah3.Text) > StrToFloat(edtcurah3b.Text)) or
     (StrToFloat(edtcurah3.Text) > StrToFloat(edtcurah4.Text)) or
     (StrToFloat(edtcurah3.Text) > StrToFloat(edtcurah4b.Text)) or
     (StrToFloat(edtcurah3.Text) > StrToFloat(edtcurah5.Text)) then
      begin
        MessageDlg('Angka Curah Hujan Salah',mtWarning,[mbOK],0);
        edtcurah3.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtcurah3b.Text) < StrToFloat(edtcurah1.Text)) or
     (StrToFloat(edtcurah3b.Text) < StrToFloat(edtcurah2.Text)) or
     (StrToFloat(edtcurah3b.Text) < StrToFloat(edtcurah2b.Text)) or
     (StrToFloat(edtcurah3b.Text) < StrToFloat(edtcurah3.Text)) or
     (StrToFloat(edtcurah3b.Text) > StrToFloat(edtcurah4.Text)) or
     (StrToFloat(edtcurah3b.Text) > StrToFloat(edtcurah4b.Text)) or
     (StrToFloat(edtcurah3b.Text) > StrToFloat(edtcurah5.Text)) then
      begin
        MessageDlg('Angka Curah Hujan Salah',mtWarning,[mbOK],0);
        edtcurah3b.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtcurah4.Text) < StrToFloat(edtcurah1.Text)) or
     (StrToFloat(edtcurah4.Text) < StrToFloat(edtcurah2.Text)) or
     (StrToFloat(edtcurah4.Text) < StrToFloat(edtcurah2b.Text)) or
     (StrToFloat(edtcurah4.Text) < StrToFloat(edtcurah3.Text)) or
     (StrToFloat(edtcurah4.Text) < StrToFloat(edtcurah3b.Text)) or
     (StrToFloat(edtcurah4.Text) > StrToFloat(edtcurah4b.Text)) or
     (StrToFloat(edtcurah4.Text) > StrToFloat(edtcurah5.Text)) then
      begin
        MessageDlg('Angka Curah Hujan Salah',mtWarning,[mbOK],0);
        edtcurah4.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtcurah4b.Text) < StrToFloat(edtcurah1.Text)) or
     (StrToFloat(edtcurah4b.Text) < StrToFloat(edtcurah2.Text)) or
     (StrToFloat(edtcurah4b.Text) < StrToFloat(edtcurah2b.Text)) or
     (StrToFloat(edtcurah4b.Text) < StrToFloat(edtcurah3.Text)) or
     (StrToFloat(edtcurah4b.Text) < StrToFloat(edtcurah3b.Text)) or
     (StrToFloat(edtcurah4b.Text) < StrToFloat(edtcurah4.Text)) or
     (StrToFloat(edtcurah4b.Text) > StrToFloat(edtcurah5.Text)) then
      begin
        MessageDlg('Angka Curah Hujan Salah',mtWarning,[mbOK],0);
        edtcurah4b.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtcurah5.Text) < StrToFloat(edtcurah1.Text)) or
     (StrToFloat(edtcurah5.Text) < StrToFloat(edtcurah2.Text)) or
     (StrToFloat(edtcurah5.Text) < StrToFloat(edtcurah2b.Text)) or
     (StrToFloat(edtcurah5.Text) < StrToFloat(edtcurah3.Text)) or
     (StrToFloat(edtcurah5.Text) < StrToFloat(edtcurah3b.Text)) or
     (StrToFloat(edtcurah5.Text) < StrToFloat(edtcurah4.Text))  then
      begin
        MessageDlg('Angka Curah Hujan Salah',mtWarning,[mbOK],0);
        edtcurah5.SetFocus;
        Exit;
      end

  // suhu
      else
  if (StrToFloat(edtsuhu1.Text) > StrToFloat(edtsuhu2.Text)) or
     (StrToFloat(edtsuhu1.Text) > StrToFloat(edtsuhu2b.Text)) or
     (StrToFloat(edtsuhu1.Text) > StrToFloat(edtsuhu3.Text)) or
     (StrToFloat(edtsuhu1.Text) > StrToFloat(edtsuhu3b.Text)) or
     (StrToFloat(edtsuhu1.Text) > StrToFloat(edtsuhu4.Text)) or
     (StrToFloat(edtsuhu1.Text) > StrToFloat(edtsuhu4b.Text)) or
     (StrToFloat(edtsuhu1.Text) > StrToFloat(edtsuhu5.Text)) then
      begin
       MessageDlg('Angka Suhu Salah',mtWarning,[mbOK],0);
       edtsuhu1.SetFocus;
       Exit;
      end
      else
  if (StrToFloat(edtsuhu2.Text) < StrToFloat(edtsuhu1.Text)) or
     (StrToFloat(edtsuhu2.Text) > StrToFloat(edtsuhu2b.Text)) or
     (StrToFloat(edtsuhu2.Text) > StrToFloat(edtsuhu3.Text)) or
     (StrToFloat(edtsuhu2.Text) > StrToFloat(edtsuhu3b.Text)) or
     (StrToFloat(edtsuhu2.Text) > StrToFloat(edtsuhu4.Text)) or
     (StrToFloat(edtsuhu2.Text) > StrToFloat(edtsuhu4b.Text)) or
     (StrToFloat(edtsuhu2.Text) > StrToFloat(edtsuhu5.Text)) then
      begin
        MessageDlg('Angka Suhu Salah',mtWarning,[mbOK],0);
        edtsuhu2.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtsuhu2b.Text) < StrToFloat(edtsuhu1.Text)) or
     (StrToFloat(edtsuhu2b.Text) < StrToFloat(edtsuhu2.Text)) or
     (StrToFloat(edtsuhu2b.Text) > StrToFloat(edtsuhu3.Text)) or
     (StrToFloat(edtsuhu2b.Text) > StrToFloat(edtsuhu3b.Text)) or
     (StrToFloat(edtsuhu2b.Text) > StrToFloat(edtsuhu4.Text)) or
     (StrToFloat(edtsuhu2b.Text) > StrToFloat(edtsuhu4b.Text)) or
     (StrToFloat(edtsuhu2b.Text) > StrToFloat(edtsuhu5.Text)) then
      begin
        MessageDlg('Angka suhu Salah',mtWarning,[mbOK],0);
        edtsuhu2b.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtsuhu3.Text) < StrToFloat(edtsuhu1.Text)) or
     (StrToFloat(edtsuhu3.Text) < StrToFloat(edtsuhu2.Text)) or
     (StrToFloat(edtsuhu3.Text) < StrToFloat(edtsuhu2b.Text)) or
     (StrToFloat(edtsuhu3.Text) > StrToFloat(edtsuhu3b.Text)) or
     (StrToFloat(edtsuhu3.Text) > StrToFloat(edtsuhu4.Text)) or
     (StrToFloat(edtsuhu3.Text) > StrToFloat(edtsuhu4b.Text)) or
     (StrToFloat(edtsuhu3.Text) > StrToFloat(edtsuhu5.Text)) then
      begin
        MessageDlg('Angka Suhu Salah',mtWarning,[mbOK],0);
        edtsuhu3.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtsuhu3b.Text) < StrToFloat(edtsuhu1.Text)) or
     (StrToFloat(edtsuhu3b.Text) < StrToFloat(edtsuhu2.Text)) or
     (StrToFloat(edtsuhu3b.Text) < StrToFloat(edtsuhu2b.Text)) or
     (StrToFloat(edtsuhu3b.Text) < StrToFloat(edtsuhu3.Text)) or
     (StrToFloat(edtsuhu3b.Text) > StrToFloat(edtsuhu4.Text)) or
     (StrToFloat(edtsuhu3b.Text) > StrToFloat(edtsuhu4b.Text)) or
     (StrToFloat(edtsuhu3b.Text) > StrToFloat(edtsuhu5.Text)) then
      begin
        MessageDlg('Angka Suhu Salah',mtWarning,[mbOK],0);
        edtsuhu3b.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtsuhu4.Text) < StrToFloat(edtsuhu1.Text)) or
     (StrToFloat(edtsuhu4.Text) < StrToFloat(edtsuhu2.Text)) or
     (StrToFloat(edtsuhu4.Text) < StrToFloat(edtsuhu2b.Text)) or
     (StrToFloat(edtsuhu4.Text) < StrToFloat(edtsuhu3.Text)) or
     (StrToFloat(edtsuhu4.Text) < StrToFloat(edtsuhu3b.Text)) or
     (StrToFloat(edtsuhu4.Text) > StrToFloat(edtsuhu4b.Text)) or
     (StrToFloat(edtsuhu4.Text) > StrToFloat(edtsuhu5.Text)) then
      begin
        MessageDlg('Angka Suhu Salah',mtWarning,[mbOK],0);
        edtsuhu4.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtsuhu4b.Text) < StrToFloat(edtsuhu1.Text)) or
     (StrToFloat(edtsuhu4b.Text) < StrToFloat(edtsuhu2.Text)) or
     (StrToFloat(edtsuhu4b.Text) < StrToFloat(edtsuhu2b.Text)) or
     (StrToFloat(edtsuhu4b.Text) < StrToFloat(edtsuhu3.Text)) or
     (StrToFloat(edtsuhu4b.Text) < StrToFloat(edtsuhu3b.Text)) or
     (StrToFloat(edtsuhu4b.Text) < StrToFloat(edtsuhu4.Text)) or
     (StrToFloat(edtsuhu4b.Text) > StrToFloat(edtsuhu5.Text)) then
      begin
        MessageDlg('Angka Suhu Salah',mtWarning,[mbOK],0);
        edtsuhu4b.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtsuhu5.Text) < StrToFloat(edtsuhu1.Text)) or
     (StrToFloat(edtsuhu5.Text) < StrToFloat(edtsuhu2.Text)) or
     (StrToFloat(edtsuhu5.Text) < StrToFloat(edtsuhu2b.Text)) or
     (StrToFloat(edtsuhu5.Text) < StrToFloat(edtsuhu3.Text)) or
     (StrToFloat(edtsuhu5.Text) < StrToFloat(edtsuhu3b.Text)) or
     (StrToFloat(edtsuhu5.Text) < StrToFloat(edtsuhu4.Text))  then
      begin
        MessageDlg('Angka Suhu Salah',mtWarning,[mbOK],0);
        edtsuhu5.SetFocus;
        Exit;
      end

   //ph
      else
  if (StrToFloat(edtph1.Text) > StrToFloat(edtph2.Text)) or
     (StrToFloat(edtph1.Text) > StrToFloat(edtph2b.Text)) or
     (StrToFloat(edtph1.Text) > StrToFloat(edtph3.Text)) or
     (StrToFloat(edtph1.Text) > StrToFloat(edtph3b.Text)) or
     (StrToFloat(edtph1.Text) > StrToFloat(edtph4.Text)) or
     (StrToFloat(edtph1.Text) > StrToFloat(edtph4b.Text)) or
     (StrToFloat(edtph1.Text) > StrToFloat(edtph5.Text)) then
      begin
       MessageDlg('Angka PH Tanaman Salah',mtWarning,[mbOK],0);
       edtph1.SetFocus;
       Exit;
      end
      else
  if (StrToFloat(edtph2.Text) < StrToFloat(edtph1.Text)) or
     (StrToFloat(edtph2.Text) > StrToFloat(edtph2b.Text)) or
     (StrToFloat(edtph2.Text) > StrToFloat(edtph3.Text)) or
     (StrToFloat(edtph2.Text) > StrToFloat(edtph3b.Text)) or
     (StrToFloat(edtph2.Text) > StrToFloat(edtph4.Text)) or
     (StrToFloat(edtph2.Text) > StrToFloat(edtph4b.Text)) or
     (StrToFloat(edtph2.Text) > StrToFloat(edtph5.Text)) then
      begin
        MessageDlg('Angka PH Tanaman Salah',mtWarning,[mbOK],0);
        edtph2.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtph2b.Text) < StrToFloat(edtph1.Text)) or
     (StrToFloat(edtph2b.Text) < StrToFloat(edtph2.Text)) or
     (StrToFloat(edtph2b.Text) > StrToFloat(edtph3.Text)) or
     (StrToFloat(edtph2b.Text) > StrToFloat(edtph3b.Text)) or
     (StrToFloat(edtph2b.Text) > StrToFloat(edtph4.Text)) or
     (StrToFloat(edtph2b.Text) > StrToFloat(edtph4b.Text)) or
     (StrToFloat(edtph2b.Text) > StrToFloat(edtph5.Text)) then
      begin
        MessageDlg('Angka PH Tanaman Salah',mtWarning,[mbOK],0);
        edtph2b.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtph3.Text) < StrToFloat(edtph1.Text)) or
     (StrToFloat(edtph3.Text) < StrToFloat(edtph2.Text)) or
     (StrToFloat(edtph3.Text) < StrToFloat(edtph2b.Text)) or
     (StrToFloat(edtph3.Text) > StrToFloat(edtph3b.Text)) or
     (StrToFloat(edtph3.Text) > StrToFloat(edtph4.Text)) or
     (StrToFloat(edtph3.Text) > StrToFloat(edtph4b.Text)) or
     (StrToFloat(edtph3.Text) > StrToFloat(edtph5.Text)) then
      begin
        MessageDlg('Angka PH Tanaman Salah',mtWarning,[mbOK],0);
        edtph3.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtph3b.Text) < StrToFloat(edtph1.Text)) or
     (StrToFloat(edtph3b.Text) < StrToFloat(edtph2.Text)) or
     (StrToFloat(edtph3b.Text) < StrToFloat(edtph2b.Text)) or
     (StrToFloat(edtph3b.Text) < StrToFloat(edtph3.Text)) or
     (StrToFloat(edtph3b.Text) > StrToFloat(edtph4.Text)) or
     (StrToFloat(edtph3b.Text) > StrToFloat(edtph4b.Text)) or
     (StrToFloat(edtph3b.Text) > StrToFloat(edtph5.Text)) then
      begin
        MessageDlg('Angka PH Tanaman Salah',mtWarning,[mbOK],0);
        edtph3b.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtph4.Text) < StrToFloat(edtph1.Text)) or
     (StrToFloat(edtph4.Text) < StrToFloat(edtph2.Text)) or
     (StrToFloat(edtph4.Text) < StrToFloat(edtph2b.Text)) or
     (StrToFloat(edtph4.Text) < StrToFloat(edtph3.Text)) or
     (StrToFloat(edtph4.Text) < StrToFloat(edtph3b.Text)) or
     (StrToFloat(edtph4.Text) > StrToFloat(edtph4b.Text)) or
     (StrToFloat(edtph4.Text) > StrToFloat(edtph5.Text)) then
      begin
        MessageDlg('Angka PH Tanaman Salah',mtWarning,[mbOK],0);
        edtph4.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtph4b.Text) < StrToFloat(edtph1.Text)) or
     (StrToFloat(edtph4b.Text) < StrToFloat(edtph2.Text)) or
     (StrToFloat(edtph4b.Text) < StrToFloat(edtph2b.Text)) or
     (StrToFloat(edtph4b.Text) < StrToFloat(edtph3.Text)) or
     (StrToFloat(edtph4b.Text) < StrToFloat(edtph3b.Text)) or
     (StrToFloat(edtph4b.Text) < StrToFloat(edtph4.Text)) or
     (StrToFloat(edtph4b.Text) > StrToFloat(edtph5.Text)) then
      begin
        MessageDlg('Angka PHH Tanaman Salah',mtWarning,[mbOK],0);
        edtph4b.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtph5.Text) < StrToFloat(edtph1.Text)) or
     (StrToFloat(edtph5.Text) < StrToFloat(edtph2.Text)) or
     (StrToFloat(edtph5.Text) < StrToFloat(edtph2b.Text)) or
     (StrToFloat(edtph5.Text) < StrToFloat(edtph3.Text)) or
     (StrToFloat(edtph5.Text) < StrToFloat(edtph3b.Text)) or
     (StrToFloat(edtph5.Text) < StrToFloat(edtph4.Text))  then
      begin
        MessageDlg('Angka PH Tanaman Salah',mtWarning,[mbOK],0);
        edtph5.SetFocus;
        Exit;
      end

    // umur
      else
  if (StrToFloat(edtumur1.Text) > StrToFloat(edtumur2.Text)) or
     (StrToFloat(edtumur1.Text) > StrToFloat(edtumur2b.Text)) or
     (StrToFloat(edtumur1.Text) > StrToFloat(edtumur3.Text)) or
     (StrToFloat(edtumur1.Text) > StrToFloat(edtumur3b.Text)) or
     (StrToFloat(edtumur1.Text) > StrToFloat(edtumur4.Text)) or
     (StrToFloat(edtumur1.Text) > StrToFloat(edtumur4b.Text)) or
     (StrToFloat(edtumur1.Text) > StrToFloat(edtumur5.Text)) then
      begin
       MessageDlg('Angka Umur Salah',mtWarning,[mbOK],0);
       edtumur1.SetFocus;
       Exit;
      end
      else
  if (StrToFloat(edtumur2.Text) < StrToFloat(edtumur1.Text)) or
     (StrToFloat(edtumur2.Text) > StrToFloat(edtumur2b.Text)) or
     (StrToFloat(edtumur2.Text) > StrToFloat(edtumur3.Text)) or
     (StrToFloat(edtumur2.Text) > StrToFloat(edtumur3b.Text)) or
     (StrToFloat(edtumur2.Text) > StrToFloat(edtumur4.Text)) or
     (StrToFloat(edtumur2.Text) > StrToFloat(edtumur4b.Text)) or
     (StrToFloat(edtumur2.Text) > StrToFloat(edtumur5.Text)) then
      begin
        MessageDlg('Angka Umur Salah',mtWarning,[mbOK],0);
        edtumur2.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtumur2b.Text) < StrToFloat(edtumur1.Text)) or
     (StrToFloat(edtumur2b.Text) < StrToFloat(edtumur2.Text)) or
     (StrToFloat(edtumur2b.Text) > StrToFloat(edtumur3.Text)) or
     (StrToFloat(edtumur2b.Text) > StrToFloat(edtumur3b.Text)) or
     (StrToFloat(edtumur2b.Text) > StrToFloat(edtumur4.Text)) or
     (StrToFloat(edtumur2b.Text) > StrToFloat(edtumur4b.Text)) or
     (StrToFloat(edtumur2b.Text) > StrToFloat(edtumur5.Text)) then
      begin
        MessageDlg('Angka Umur Salah',mtWarning,[mbOK],0);
        edtumur2b.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtumur3.Text) < StrToFloat(edtumur1.Text)) or
     (StrToFloat(edtumur3.Text) < StrToFloat(edtumur2.Text)) or
     (StrToFloat(edtumur3.Text) < StrToFloat(edtumur2b.Text)) or
     (StrToFloat(edtumur3.Text) > StrToFloat(edtumur3b.Text)) or
     (StrToFloat(edtumur3.Text) > StrToFloat(edtumur4.Text)) or
     (StrToFloat(edtumur3.Text) > StrToFloat(edtumur4b.Text)) or
     (StrToFloat(edtumur3.Text) > StrToFloat(edtumur5.Text)) then
      begin
        MessageDlg('Angka Umur Salah',mtWarning,[mbOK],0);
        edtumur3.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtumur3b.Text) < StrToFloat(edtumur1.Text)) or
     (StrToFloat(edtumur3b.Text) < StrToFloat(edtumur2.Text)) or
     (StrToFloat(edtumur3b.Text) < StrToFloat(edtumur2b.Text)) or
     (StrToFloat(edtumur3b.Text) < StrToFloat(edtumur3.Text)) or
     (StrToFloat(edtumur3b.Text) > StrToFloat(edtumur4.Text)) or
     (StrToFloat(edtumur3b.Text) > StrToFloat(edtumur4b.Text)) or
     (StrToFloat(edtumur3b.Text) > StrToFloat(edtumur5.Text)) then
      begin
        MessageDlg('Angka Umur Salah',mtWarning,[mbOK],0);
        edtumur3b.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtumur4.Text) < StrToFloat(edtumur1.Text)) or
     (StrToFloat(edtumur4.Text) < StrToFloat(edtumur2.Text)) or
     (StrToFloat(edtumur4.Text) < StrToFloat(edtumur2b.Text)) or
     (StrToFloat(edtumur4.Text) < StrToFloat(edtumur3.Text)) or
     (StrToFloat(edtumur4.Text) < StrToFloat(edtumur3b.Text)) or
     (StrToFloat(edtumur4.Text) > StrToFloat(edtumur4b.Text)) or
     (StrToFloat(edtumur4.Text) > StrToFloat(edtumur5.Text)) then
      begin
        MessageDlg('Angka Umur Salah',mtWarning,[mbOK],0);
        edtumur4.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtumur4b.Text) < StrToFloat(edtumur1.Text)) or
     (StrToFloat(edtumur4b.Text) < StrToFloat(edtumur2.Text)) or
     (StrToFloat(edtumur4b.Text) < StrToFloat(edtumur2b.Text)) or
     (StrToFloat(edtumur4b.Text) < StrToFloat(edtumur3.Text)) or
     (StrToFloat(edtumur4b.Text) < StrToFloat(edtumur3b.Text)) or
     (StrToFloat(edtumur4b.Text) < StrToFloat(edtumur4.Text)) or
     (StrToFloat(edtumur4b.Text) > StrToFloat(edtumur5.Text)) then
      begin
        MessageDlg('Angka Umur Salah',mtWarning,[mbOK],0);
        edtumur4b.SetFocus;
        Exit;
      end
      else
  if (StrToFloat(edtumur5.Text) < StrToFloat(edtumur1.Text)) or
     (StrToFloat(edtumur5.Text) < StrToFloat(edtumur2.Text)) or
     (StrToFloat(edtumur5.Text) < StrToFloat(edtumur2b.Text)) or
     (StrToFloat(edtumur5.Text) < StrToFloat(edtumur3.Text)) or
     (StrToFloat(edtumur5.Text) < StrToFloat(edtumur3b.Text)) or
     (StrToFloat(edtumur5.Text) < StrToFloat(edtumur4.Text))  then
      begin
        MessageDlg('Angka Umur Salah',mtWarning,[mbOK],0);
        edtumur5.SetFocus;
        Exit;
      end
      else
      begin
        with dm.qrynilbatas do
          begin
           Edit;

           FieldByName('curah1').AsString:=edtcurah1.Text;
           FieldByName('curah2a').AsString:=edtcurah2.Text;
           FieldByName('curah2b').AsString:=edtcurah2b.Text;
           FieldByName('curah3a').AsString:=edtcurah3.Text;
           FieldByName('curah3b').AsString:=edtcurah3b.Text;
           FieldByName('curah4a').AsString:=edtcurah4.Text;
           FieldByName('curah4b').AsString:=edtcurah4b.Text;
           FieldByName('curah5').AsString:=edtcurah5.Text;

           FieldByName('suhu1').AsString:=edtsuhu1.Text;
           FieldByName('suhu2a').AsString:=edtsuhu2.Text;
           FieldByName('suhu2b').AsString:=edtsuhu2b.Text;
           FieldByName('suhu3a').AsString:=edtsuhu3.Text;
           FieldByName('suhu3b').AsString:=edtsuhu3b.Text;
           FieldByName('suhu4a').AsString:=edtsuhu4.Text;
           FieldByName('suhu4b').AsString:=edtsuhu4b.Text;
           FieldByName('suhu5').AsString:=edtsuhu5.Text;

           FieldByName('ph1').AsString:=edtph1.Text;
           FieldByName('ph2a').AsString:=edtph2.Text;
           FieldByName('ph2b').AsString:=edtph2b.Text;
           FieldByName('ph3a').AsString:=edtph3.Text;
           FieldByName('ph3b').AsString:=edtph3b.Text;
           FieldByName('ph4a').AsString:=edtph4.Text;
           FieldByName('ph4b').AsString:=edtph4b.Text;
           FieldByName('ph5').AsString:=edtph5.Text;

           FieldByName('umur1').AsString:=edtumur1.Text;
           FieldByName('umur2a').AsString:=edtumur2.Text;
           FieldByName('umur2b').AsString:=edtumur2b.Text;
           FieldByName('umur3a').AsString:=edtumur3.Text;
           FieldByName('umur3b').AsString:=edtumur3b.Text;
           FieldByName('umur4a').AsString:=edtumur4.Text;
           FieldByName('umur4b').AsString:=edtumur4b.Text;
           FieldByName('umur5').AsString:=edtumur5.Text;

           Post;
          end;
          MessageDlg('Data Berhasil Diubah',mtInformation,[mbok],0);
          FormShow(Sender);
      end;
 end;
end;

procedure TFnilbatas.edtcurah1KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.']) then key:=#0;
end;

procedure TFnilbatas.edtcurah1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtcurah1.Text=edt1.Text then edtcurah1.Text:='';
end;

procedure TFnilbatas.edtcurah2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtcurah2.Text=edt1.Text then edtcurah2.Text:='';
end;

procedure TFnilbatas.edtcurah2bKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtcurah2b.Text=edt1.Text then edtcurah2b.Text:='';
end;

procedure TFnilbatas.edtcurah3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtcurah3.Text=edt1.Text then edtcurah3.Text:='';
end;

procedure TFnilbatas.edtcurah3bKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtcurah3b.Text=edt1.Text then edtcurah3b.Text:='';
end;

procedure TFnilbatas.edtcurah4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtcurah4.Text=edt1.Text then edtcurah4.Text:='';
end;

procedure TFnilbatas.edtcurah4bKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtcurah4b.Text=edt1.Text then edtcurah4b.Text:='';
end;

procedure TFnilbatas.edtcurah5KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtcurah5.Text=edt1.Text then edtcurah5.Text:='';
end;

procedure TFnilbatas.edtsuhu1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtsuhu1.Text=edt1.Text then edtsuhu1.Text:='';
end;

procedure TFnilbatas.edtsuhu2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtsuhu2.Text=edt1.Text then edtsuhu2.Text:='';
end;

procedure TFnilbatas.edtsuhu2bKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtsuhu2b.Text=edt1.Text then edtsuhu2b.Text:='';
end;

procedure TFnilbatas.edtsuhu3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtsuhu3.Text=edt1.Text then edtsuhu3.Text:='';
end;

procedure TFnilbatas.edtsuhu3bKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtsuhu3b.Text=edt1.Text then edtsuhu3b.Text:='';
end;

procedure TFnilbatas.edtsuhu4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtsuhu4.Text=edt1.Text then edtsuhu4.Text:='';
end;

procedure TFnilbatas.edtsuhu4bKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtsuhu4b.Text=edt1.Text then edtsuhu4b.Text:='';
end;

procedure TFnilbatas.edtsuhu5KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtsuhu5.Text=edt1.Text then edtsuhu5.Text:='';
end;

procedure TFnilbatas.edtph1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtph1.Text=edt1.Text then edtph1.Text:='';
end;

procedure TFnilbatas.edtph2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtph2.Text=edt1.Text then edtph2.Text:='';
end;

procedure TFnilbatas.edtph2bKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtph2b.Text=edt1.Text then edtph2b.Text:='';
end;

procedure TFnilbatas.edtph3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtph3.Text=edt1.Text then edtph3.Text:='';
end;

procedure TFnilbatas.edtph3bKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtph3b.Text=edt1.Text then edtph3b.Text:='';
end;

procedure TFnilbatas.edtph4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtph4.Text=edt1.Text then edtph4.Text:='';
end;

procedure TFnilbatas.edtph4bKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtph4b.Text=edt1.Text then edtph4b.Text:='';
end;

procedure TFnilbatas.edtph5KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtph5.Text=edt1.Text then edtph5.Text:='';
end;

procedure TFnilbatas.edtumur1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtumur1.Text=edt1.Text then edtumur1.Text:='';
end;

procedure TFnilbatas.edtumur2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtumur2.Text=edt1.Text then edtumur2.Text:='';
end;

procedure TFnilbatas.edtumur2bKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtumur2b.Text=edt1.Text then edtumur2b.Text:='';
end;

procedure TFnilbatas.edtumur3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtumur3.Text=edt1.Text then edtumur3.Text:='';
end;

procedure TFnilbatas.edtumur3bKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtumur3b.Text=edt1.Text then edtumur3b.Text:='';
end;

procedure TFnilbatas.edtumur4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtumur4.Text=edt1.Text then edtumur4.Text:='';
end;

procedure TFnilbatas.edtumur4bKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtumur4b.Text=edt1.Text then edtumur4b.Text:='';
end;

procedure TFnilbatas.edtumur5KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if edtumur5.Text=edt1.Text then edtumur5.Text:='';
end;

end.
