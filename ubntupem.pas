unit ubntupem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, jpeg, ExtCtrls;

type
  Tfbantupemilik = class(TForm)
    grp1: TGroupBox;
    lbl1: TLabel;
    grp2: TGroupBox;
    DBGrid1: TDBGrid;
    grp3: TGroupBox;
    lbl2: TLabel;
    edt1: TEdit;
    btn1: TBitBtn;
    btn2: TBitBtn;
    edt2: TEdit;
    img1: TImage;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fbantupemilik: Tfbantupemilik;
  status :string;

implementation

uses
  udm, ukelpetani, uprosesmatching, DB;

{$R *.dfm}

procedure Tfbantupemilik.btn2Click(Sender: TObject);
begin
Close;
end;

procedure Tfbantupemilik.btn1Click(Sender: TObject);
begin
 if edt2.Text='spek' then
   begin
    fkeltani.edtkode.Text:=DBGrid1.Fields[0].AsString;
    fkeltani.edtnm.Text:=DBGrid1.Fields[1].AsString;
    fkeltani.edttinggi.SetFocus;
    fkeltani.konek;
    Self.Close;
   end
   else
 if edt2.Text='proses' then
  begin
   fproses.edtidpemilik.Text:=DBGrid1.Fields[0].AsString;
   fproses.edtnm.Text:=DBGrid1.Fields[1].AsString;
   with dm.qrykelpem do
    begin
      close;
      sql.Clear;
      SQL.Text:='select * from tbl_kelpemilik where id_pemilik='+QuotedStr(fproses.edtidpemilik.Text)+'';
      Open;

      if IsEmpty then
       begin
         MessageDlg('Belum Ada Data Lahan',mtInformation,[mbOK],0);
         fproses.dblkcbblahan.Enabled:=False;
         fproses.btnproses.Enabled:=false;
       end
       else
       begin
         fproses.dblkcbblahan.Enabled:=True;
         fproses.btnproses.Enabled:=True;
       end;
    end;
    Self.Close;
  end;
end;

procedure Tfbantupemilik.FormShow(Sender: TObject);
begin
edt1.Clear;
end;

procedure Tfbantupemilik.edt1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if edt1.Text='' then dm.qrypemilik.Filtered:=false else
   begin
    dm.qrypemilik.Filtered:=false;
    dm.qrypemilik.Filter:='id_pemilik like ''%'+edt1.Text+'%'' or nm_pemilik like ''%'+edt1.Text+'%''';
    dm.qrypemilik.Filtered:=True;
   end;
end;

end.
