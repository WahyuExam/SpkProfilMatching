unit ubanckup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  Tfbackup = class(TForm)
    grp1: TGroupBox;
    lbl1: TLabel;
    grp2: TGroupBox;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    dlgOpen1: TOpenDialog;
    dlgSave1: TSaveDialog;
    img1: TImage;
    procedure btn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fbackup: Tfbackup;
  a,b,c : string;

implementation

uses
  udm;

{$R *.dfm}

procedure Tfbackup.btn3Click(Sender: TObject);
begin
 close;
end;

procedure Tfbackup.FormShow(Sender: TObject);
begin
a:=GetCurrentDir+'\profil.mdb';
end;

procedure Tfbackup.btn1Click(Sender: TObject);
begin
 dlgOpen1.Execute;
 dlgOpen1.Filter:=A;
 If dlgOpen1.FileName <> '' Then
  c:=dlgOpen1.FileName
  else
  Exit;

  if MessageDlg('Panggil Data "'+ExtractFileName(C)+'"  ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      dm.con1.Connected:=false;
      RenameFile(C,'profil.mdb');
      dm.con1.ConnectionString:=A;
      dm.con1.Connected:=true;
      dm.DataModuleCreate(sender);
      MessageDlg('Panggil Data Berhasil',mtInformation,[mbOK],0);
    end;

end;

procedure Tfbackup.btn2Click(Sender: TObject);
begin
 dlgSave1.Execute;
 If dlgSave1.filename <> '' Then
   b:=dlgSave1.FileName
  else
 Exit;

  CopyFile(Pchar(A),Pchar(B+'.mdb'),True);
  MessageDlg('Salin Data Berhasil',mtInformation,[mbOK],0);
end;
end.
