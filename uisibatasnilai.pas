unit uisibatasnilai;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TFisibatas = class(TForm)
    img1: TImage;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edtcurahmin: TEdit;
    edtsuhumin: TEdit;
    edtphmin: TEdit;
    edtcurahmax: TEdit;
    edtsuhumax: TEdit;
    edtphmax: TEdit;
    grp2: TGroupBox;
    btn1: TBitBtn;
    grp3: TGroupBox;
    lbl6: TLabel;
    btn2: TBitBtn;
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fisibatas: TFisibatas;

implementation

uses Math, Unilbatas, udm;

{$R *.dfm}

procedure TFisibatas.btn1Click(Sender: TObject);
var tampungshuhu, tampungcurah, tampungph : Real;
begin
  tampungshuhu := (StrToFloat(edtsuhumax.Text)-StrToFloat(edtsuhumin.Text))/5;
  tampungcurah := (StrToFloat(edtcurahmax.Text)-StrToFloat(edtcurahmin.Text))/5;
  tampungph := (StrToFloat(edtphmax.Text)-StrToFloat(edtphmin.Text))/5;

  Fnilbatas.edtcurah1.Text:=edtcurahmin.Text;
  Fnilbatas.edtcurah2.Text:=edtcurahmin.Text;
  Fnilbatas.edtcurah2b.Text:=FloatToStr(StrToFloat(Fnilbatas.edtcurah2.Text)+tampungcurah);
  Fnilbatas.edtcurah3.Text:=FloatToStr(StrToFloat(Fnilbatas.edtcurah2b.Text)+1);
  Fnilbatas.edtcurah3b.Text:=FloatToStr(StrToFloat(Fnilbatas.edtcurah3.Text)+tampungcurah);
  Fnilbatas.edtcurah4.Text:=FloatToStr(StrToFloat(Fnilbatas.edtcurah3b.Text)+1);
  Fnilbatas.edtcurah4b.Text:=FloatToStr(StrToFloat(Fnilbatas.edtcurah4.Text)+tampungcurah);
  Fnilbatas.edtcurah5.Text:=edtcurahmax.Text;

  Fnilbatas.edtsuhu1.Text:=edtsuhumin.Text;
  Fnilbatas.edtsuhu2.Text:=edtsuhumin.Text;
  Fnilbatas.edtsuhu2b.Text:=FloatToStr(StrToFloat(Fnilbatas.edtsuhu2.Text)+tampungshuhu);
  Fnilbatas.edtsuhu3.Text:=FloatToStr(StrToFloat(Fnilbatas.edtsuhu2b.Text)+1);
  Fnilbatas.edtsuhu3b.Text:=FloatToStr(StrToFloat(Fnilbatas.edtsuhu3.Text)+tampungshuhu);
  Fnilbatas.edtsuhu4.Text:=FloatToStr(StrToFloat(Fnilbatas.edtsuhu3b.Text)+1);
  Fnilbatas.edtsuhu4b.Text:=FloatToStr(StrToFloat(Fnilbatas.edtsuhu4.Text)+tampungshuhu);
  Fnilbatas.edtsuhu5.Text:=edtsuhumax.Text;

  Fnilbatas.edtph1.Text:=edtphmin.Text;
  Fnilbatas.edtph2.Text:=edtphmin.Text;
  Fnilbatas.edtph2b.Text:=FloatToStr(StrToFloat(Fnilbatas.edtph2.Text)+tampungph);
  Fnilbatas.edtph3.Text:=FloatToStr(StrToFloat(Fnilbatas.edtph2b.Text)+1);
  Fnilbatas.edtph3b.Text:=FloatToStr(StrToFloat(Fnilbatas.edtph3.Text)+tampungph);
  Fnilbatas.edtph4.Text:=FloatToStr(StrToFloat(Fnilbatas.edtph3b.Text)+1);
  Fnilbatas.edtph4b.Text:=FloatToStr(StrToFloat(Fnilbatas.edtph4.Text)+tampungph);
  Fnilbatas.edtph5.Text:=edtphmax.Text;

  Fnilbatas.btncampur.Caption:='Simpan';
  Self.Close;
end;

procedure TFisibatas.FormShow(Sender: TObject);
begin
  edtcurahmin.Text:= dm.qrynilbatas.fieldbyname('curah1').AsString;
  edtcurahmax.Text:= dm.qrynilbatas.fieldbyname('curah5').AsString;

  edtsuhumin.Text := dm.qrynilbatas.fieldbyname('suhu1').AsString;
  edtsuhumax.Text := dm.qrynilbatas.fieldbyname('suhu5').AsString;

  edtphmin.Text := dm.qrynilbatas.fieldbyname('ph1').AsString;
  edtphmax.Text := dm.qrynilbatas.fieldbyname('ph5').AsString;

  edtcurahmin.SetFocus;
end;

procedure TFisibatas.btn2Click(Sender: TObject);
begin
 Fnilbatas.btncampur.Caption:='Ubah';
 Close;
end;

end.
