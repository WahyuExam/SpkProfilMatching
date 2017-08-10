unit ugantipwd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons;

type
  Tfgantipwd = class(TForm)
    img1: TImage;
    grp1: TGroupBox;
    lbl1: TLabel;
    grp2: TGroupBox;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edt2: TEdit;
    edt3: TEdit;
    grp3: TGroupBox;
    btn1: TBitBtn;
    btn2: TBitBtn;
    cbb1: TComboBox;
    edt1: TEdit;
    procedure FormShow(Sender: TObject);
    procedure cbb1CloseUp(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure edt2KeyPress(Sender: TObject; var Key: Char);
    procedure edt3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fgantipwd: Tfgantipwd;

implementation

uses
  udm;

{$R *.dfm}

procedure Tfgantipwd.FormShow(Sender: TObject);
begin
 cbb1.Enabled:=True;
 cbb1.ItemIndex:=-1;
 edt2.Enabled:=false; edt3.Enabled:=false;
 edt2.Clear; edt3.Clear;

 btn1.Caption:='Ubah';
 btn2.Caption:='Keluar';
end;

procedure Tfgantipwd.cbb1CloseUp(Sender: TObject);
begin
  if cbb1.ItemIndex=0 then edt1.Text:='admin' else
  if cbb1.ItemIndex=1 then edt1.Text:='user';
end;

procedure Tfgantipwd.btn1Click(Sender: TObject);
begin
if btn1.Caption='Ubah' then
 begin
   if cbb1.Text='' then
    begin
      MessageDlg('Pengguna Belum Dipilih',mtWarning,[mbok],0);
      cbb1.SetFocus;
      Exit;
    end;

   cbb1.Enabled:=false;
   edt2.Enabled:=True;
   edt3.Enabled:=True;

   edt2.SetFocus;
   
   btn1.Caption:='Simpan';
   btn2.Caption:='Batal'
 end
 else
if btn1.Caption='Simpan' then
 begin
   with dm.tbllogin do
    begin
      if Locate('pengguna',edt1.Text,[]) then
       begin
         if edt2.Text<>FieldByName('password').AsString then
          begin
            MessageDlg('Kata Sandi Lama Salah',mtError,[mbok],0);
            edt2.Clear; edt3.Clear;
            edt2.SetFocus;
            Exit;
          end
          else
          begin
            Edit;
            FieldByName('password').AsString:=edt3.Text;
            Post;

             MessageDlg('Kata Sandi Berhasil Diubah',mtInformation,[mbok],0);
             FormShow(Sender);
          end;
       end;
    end;
 end;
end;


procedure Tfgantipwd.btn2Click(Sender: TObject);
begin
 if btn2.Caption='Batal' then FormShow(sender) else close;
end;

procedure Tfgantipwd.edt2KeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then edt3.SetFocus;
end;

procedure Tfgantipwd.edt3KeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then btn1.SetFocus;
end;

end.
