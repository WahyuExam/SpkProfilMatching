object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 253
  Top = 174
  Height = 350
  Width = 688
  object con1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=profil.mdb;Persist ' +
      'Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 168
    Top = 24
  end
  object qrynilbatas: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbl_nilbatas')
    Left = 32
    Top = 72
    object qrynilbatasidbatas: TWideStringField
      FieldName = 'idbatas'
      Size = 7
    end
    object qrynilbatascurah1: TFloatField
      FieldName = 'curah1'
    end
    object qrynilbatascurah2a: TFloatField
      FieldName = 'curah2a'
    end
    object qrynilbatascurah2b: TFloatField
      FieldName = 'curah2b'
    end
    object qrynilbatascurah3a: TFloatField
      FieldName = 'curah3a'
    end
    object qrynilbatascurah3b: TFloatField
      FieldName = 'curah3b'
    end
    object qrynilbatascurah4a: TFloatField
      FieldName = 'curah4a'
    end
    object qrynilbatascurah4b: TFloatField
      FieldName = 'curah4b'
    end
    object qrynilbatascurah5: TFloatField
      FieldName = 'curah5'
    end
    object qrynilbatassuhu1: TFloatField
      FieldName = 'suhu1'
    end
    object qrynilbatassuhu2a: TFloatField
      FieldName = 'suhu2a'
    end
    object qrynilbatassuhu2b: TFloatField
      FieldName = 'suhu2b'
    end
    object qrynilbatassuhu3a: TFloatField
      FieldName = 'suhu3a'
    end
    object qrynilbatassuhu3b: TFloatField
      FieldName = 'suhu3b'
    end
    object qrynilbatassuhu4a: TFloatField
      FieldName = 'suhu4a'
    end
    object qrynilbatassuhu4b: TFloatField
      FieldName = 'suhu4b'
    end
    object qrynilbatassuhu5: TFloatField
      FieldName = 'suhu5'
    end
    object qrynilbatasph1: TFloatField
      FieldName = 'ph1'
    end
    object qrynilbatasph2a: TFloatField
      FieldName = 'ph2a'
    end
    object qrynilbatasph2b: TFloatField
      FieldName = 'ph2b'
    end
    object qrynilbatasph3a: TFloatField
      FieldName = 'ph3a'
    end
    object qrynilbatasph3b: TFloatField
      FieldName = 'ph3b'
    end
    object qrynilbatasph4a: TFloatField
      FieldName = 'ph4a'
    end
    object qrynilbatasph4b: TFloatField
      FieldName = 'ph4b'
    end
    object qrynilbatasph5: TFloatField
      FieldName = 'ph5'
    end
    object qrynilbatasumur1: TFloatField
      FieldName = 'umur1'
    end
    object qrynilbatasumur2a: TFloatField
      FieldName = 'umur2a'
    end
    object qrynilbatasumur2b: TFloatField
      FieldName = 'umur2b'
    end
    object qrynilbatasumur3a: TFloatField
      FieldName = 'umur3a'
    end
    object qrynilbatasumur3b: TFloatField
      FieldName = 'umur3b'
    end
    object qrynilbatasumur4a: TFloatField
      FieldName = 'umur4a'
    end
    object qrynilbatasumur4b: TFloatField
      FieldName = 'umur4b'
    end
    object qrynilbatasumur5: TFloatField
      FieldName = 'umur5'
    end
  end
  object XPManifest1: TXPManifest
    Left = 216
    Top = 24
  end
  object qrypupuk: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbl_pupuk')
    Left = 32
    Top = 136
    object qrypupukid_pupuk: TWideStringField
      FieldName = 'id_pupuk'
      Size = 12
    end
    object qrypupukjns_pupuk: TWideStringField
      FieldName = 'jns_pupuk'
      Size = 25
    end
    object qrypupuktinggi_min: TIntegerField
      FieldName = 'tinggi_min'
    end
    object qrypupuktinggi_max: TIntegerField
      FieldName = 'tinggi_max'
    end
    object qrypupukcurah: TFloatField
      FieldName = 'curah'
    end
    object qrypupuksuhu: TFloatField
      FieldName = 'suhu'
    end
    object qrypupukph: TFloatField
      FieldName = 'ph'
    end
  end
  object dspupuk: TDataSource
    DataSet = qrypupuk
    Left = 80
    Top = 136
  end
  object qrykelpupuk: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbl_kelpupuk')
    Left = 32
    Top = 208
    object qrykelpupukid_pupuk: TWideStringField
      FieldName = 'id_pupuk'
      Size = 12
    end
    object qrykelpupuktinggi_min: TIntegerField
      FieldName = 'tinggi_min'
    end
    object qrykelpupuktinggi_max: TIntegerField
      FieldName = 'tinggi_max'
    end
    object qrykelpupukcurah: TIntegerField
      FieldName = 'curah'
    end
    object qrykelpupuksuhu: TIntegerField
      FieldName = 'suhu'
    end
    object qrykelpupukph: TIntegerField
      FieldName = 'ph'
    end
  end
  object qrypemilik: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbl_pemilik')
    Left = 256
    Top = 80
  end
  object dspemilik: TDataSource
    DataSet = qrypemilik
    Left = 312
    Top = 80
  end
  object qrykelpem: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbl_kelpemilik')
    Left = 256
    Top = 136
  end
  object qrytampilkelpem: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select a.id_pemilik, a.nm_pemilik, a.tgl_lhir, a.alamat, b.tingg' +
        'i, b.curah, b.suhu,'
      
        'b.ph, b.kel_tinggi, b.kel_curah, b.kel_suhu, b.kel_ph, b.notrans' +
        ', b.lahan from tbl_pemilik a, tbl_kelpemilik b where '
      'b.id_pemilik=a.id_pemilik')
    Left = 256
    Top = 192
  end
  object dstampilkelpem: TDataSource
    DataSet = qrytampilkelpem
    Left = 328
    Top = 184
  end
  object dskellpem: TDataSource
    DataSet = qrykelpem
    Left = 352
    Top = 128
  end
  object qrykelpem2: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 256
    Top = 248
  end
  object qrymatching: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbl_prosesmatching')
    Left = 472
    Top = 80
  end
  object qrytampilmatching: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select a.id_transaksi, b.id_pemilik, b.nm_pemilik, a.lahan, c.id' +
        '_pupuk, c.jns_pupuk, a.bbt_tinggi,'
      
        ' a.bbt_curah, a.bbt_suhu, a.bbt_ph, a.core, a.second, a.hasil fr' +
        'om tbl_prosesmatching a, '
      
        'tbl_pemilik b, tbl_pupuk c where a.id_pemilik=b.id_pemilik and a' +
        '.id_pupuk=c.id_pupuk')
    Left = 472
    Top = 144
  end
  object dstampilmatching: TDataSource
    DataSet = qrytampilmatching
    Left = 528
    Top = 136
  end
  object tbllogin: TADOTable
    Active = True
    Connection = con1
    CursorType = ctStatic
    TableName = 'tbl_pengguna'
    Left = 472
    Top = 224
  end
end
