unit ulogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons;

type
  Tflogin = class(TForm)
    img1: TImage;
    edt2: TEdit;
    btn1: TBitBtn;
    btn2: TBitBtn;
    cbb1: TComboBox;
    edt1: TEdit;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure cbb1CloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  flogin: Tflogin;

implementation

uses
  udm, umenu;

{$R *.dfm}

procedure Tflogin.btn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tflogin.btn2Click(Sender: TObject);
begin
if cbb1.Text='' then
 begin
   MessageDlg('Pengguna Belum Dipilih',mtWarning,[mbOK],0);
   Exit;
 end;

if edt2.Text='' then
 begin
   MessageDlg('Password Belum Dimasukkan',mtError,[mbOK],0);
   Exit;
 end;

 with dm.tbllogin do
  begin
    if Locate('pengguna',edt1.Text,[]) then
     begin
      if (edt1.Text=FieldByName('pengguna').AsString) and (edt2.Text=FieldByName('password').AsString) then
       begin
        MessageDlg('Login Berhasil',mtInformation,[mbOK],0);
        if edt1.Text='user' then
         begin
           fmenuutama.Master1.Enabled:=false;
           fmenuutama.Pengaturan1.Enabled:=false;
           fmenuutama.stat1.Panels[0].Text:='Anda Masuk Sebagai USER';
         end
        else
        if edt1.Text='admin' then
        begin
          fmenuutama.Master1.Enabled:=True;
          fmenuutama.Proses1.Enabled:=True;
          fmenuutama.Laporan1.Enabled:=True;
          fmenuutama.Pengaturan1.Enabled:=True;
          fmenuutama.stat1.Panels[0].Text:='Anda Masuk Sebagai ADMIN';
        end;

       fmenuutama.ShowModal;
       Self.Close;
       end
      else
      begin
        MessageDlg('Login Gagal',mtError,[mbok],0);
        edt2.Clear;
        cbb1.Text:='';
      end;
     end;
  end;
end;

procedure Tflogin.cbb1CloseUp(Sender: TObject);
begin
 if cbb1.ItemIndex=0 then edt1.Text:='admin' else
 if cbb1.ItemIndex=1 then
  begin
   edt1.Text:='user';
   if dm.tbllogin.Locate('pengguna',edt1.Text,[]) then
    begin
      edt2.Text:=dm.tbllogin.fieldbyname('password').AsString;
      btn2.Click;
    end;
  end;
 edt2.SetFocus;
end;

procedure Tflogin.FormShow(Sender: TObject);
begin
 cbb1.Text:='';
 edt2.Clear;
end;

procedure Tflogin.edt2KeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then btn2.Click;
end;

end.
