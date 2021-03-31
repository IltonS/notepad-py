unit About;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, System.Types, System.StrUtils;

type
  TAboutBox = class(TForm)
    Image1: TImage;
    MemoCopyright: TMemo;
    BtnFechar: TButton;
    Label1: TLabel;
    LblVersion: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LblMemory: TLabel;
    Label5: TLabel;
    LblInUse: TLabel;
    procedure BtnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    function GetAppVersionStr: string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

//From: https://delphihaven.wordpress.com/2012/12/08/retrieving-the-applications-version-string/
function TAboutBox.GetAppVersionStr: string;
var
  Exe: string;
  Size, Handle: DWORD;
  Buffer: TBytes;
  FixedPtr: PVSFixedFileInfo;
begin
  Exe := ParamStr(0);
  Size := GetFileVersionInfoSize(PChar(Exe), Handle);
  if Size = 0 then
    RaiseLastOSError;
  SetLength(Buffer, Size);
  if not GetFileVersionInfo(PChar(Exe), Handle, Size, Buffer) then
    RaiseLastOSError;
  if not VerQueryValue(Buffer, '\', Pointer(FixedPtr), Size) then
    RaiseLastOSError;
  Result := Format('%d.%d.%d.%d',
    [LongRec(FixedPtr.dwFileVersionMS).Hi,  //major
     LongRec(FixedPtr.dwFileVersionMS).Lo,  //minor
     LongRec(FixedPtr.dwFileVersionLS).Hi,  //release
     LongRec(FixedPtr.dwFileVersionLS).Lo]) //build
end;

procedure TAboutBox.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TAboutBox.FormActivate(Sender: TObject);
begin
  BtnFechar.SetFocus
end;

procedure TAboutBox.FormCreate(Sender: TObject);
var
  MS: TMemoryStatus;
  Version: TStringDynArray;
begin
  GlobalMemoryStatus(MS);
  LblMemory.Caption := FormatFloat('#,###" GB"', MS.dwAvailPhys /1024 /1024 /1024);
  LblInUse.Caption := Format('%d %%', [MS.dwMemoryLoad]);

  Version := SplitString(GetAppVersionStr, '.');

  LblVersion.Caption := 'Versão: ' + Version[0] + '.' + Version[1] + ' (Release: ' + Version[2] + ' Build: ' + Version[3] + ')';
end;

end.
