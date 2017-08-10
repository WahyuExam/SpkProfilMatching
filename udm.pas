unit udm;

interface

uses
  SysUtils, Classes, DB, ADODB, XPMan;

type
  Tdm = class(TDataModule)
    con1: TADOConnection;
    qrynilbatas: TADOQuery;
    qrynilbatasidbatas: TWideStringField;
    qrynilbatascurah1: TFloatField;
    qrynilbatascurah2a: TFloatField;
    qrynilbatascurah2b: TFloatField;
    qrynilbatascurah3a: TFloatField;
    qrynilbatascurah3b: TFloatField;
    qrynilbatascurah4a: TFloatField;
    qrynilbatascurah4b: TFloatField;
    qrynilbatascurah5: TFloatField;
    qrynilbatassuhu1: TFloatField;
    qrynilbatassuhu2a: TFloatField;
    qrynilbatassuhu2b: TFloatField;
    qrynilbatassuhu3a: TFloatField;
    qrynilbatassuhu3b: TFloatField;
    qrynilbatassuhu4a: TFloatField;
    qrynilbatassuhu4b: TFloatField;
    qrynilbatassuhu5: TFloatField;
    qrynilbatasph1: TFloatField;
    qrynilbatasph2a: TFloatField;
    qrynilbatasph2b: TFloatField;
    qrynilbatasph3a: TFloatField;
    qrynilbatasph3b: TFloatField;
    qrynilbatasph4a: TFloatField;
    qrynilbatasph4b: TFloatField;
    qrynilbatasph5: TFloatField;
    qrynilbatasumur1: TFloatField;
    qrynilbatasumur2a: TFloatField;
    qrynilbatasumur2b: TFloatField;
    qrynilbatasumur3a: TFloatField;
    qrynilbatasumur3b: TFloatField;
    qrynilbatasumur4a: TFloatField;
    qrynilbatasumur4b: TFloatField;
    qrynilbatasumur5: TFloatField;
    XPManifest1: TXPManifest;
    qrypupuk: TADOQuery;
    dspupuk: TDataSource;
    qrykelpupuk: TADOQuery;
    qrykelpupukid_pupuk: TWideStringField;
    qrykelpupuktinggi_min: TIntegerField;
    qrykelpupuktinggi_max: TIntegerField;
    qrykelpupukcurah: TIntegerField;
    qrykelpupuksuhu: TIntegerField;
    qrykelpupukph: TIntegerField;
    qrypupukid_pupuk: TWideStringField;
    qrypupukjns_pupuk: TWideStringField;
    qrypupuktinggi_min: TIntegerField;
    qrypupuktinggi_max: TIntegerField;
    qrypupukcurah: TFloatField;
    qrypupuksuhu: TFloatField;
    qrypupukph: TFloatField;
    qrypemilik: TADOQuery;
    dspemilik: TDataSource;
    qrykelpem: TADOQuery;
    qrytampilkelpem: TADOQuery;
    dstampilkelpem: TDataSource;
    dskellpem: TDataSource;
    qrykelpem2: TADOQuery;
    qrymatching: TADOQuery;
    qrytampilmatching: TADOQuery;
    dstampilmatching: TDataSource;
    tbllogin: TADOTable;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
var ss : string;
begin
 con1.Connected:=false;
 getdir(0,ss);
 con1.ConnectionString:=
 'Provider=Microsoft.Jet.OLEDB.4.0;'+
 'Data Source='+ ss +'\profil.mdb;';
 con1.Connected:=true;

 qrynilbatas.Active:=True;
 qrypupuk.Active:=True;
 qrykelpupuk.Active:=True;

 qrypemilik.Active:=True;
 qrykelpem.Active:=True;
 qrytampilkelpem.Active:=True;

 qrymatching.Active:=True;
 qrytampilmatching.Active:=True;
 tbllogin.Active:=True;
end;

end.
