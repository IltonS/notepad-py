program NotepadPy;

uses
  Vcl.Forms,
  Main in 'Main.pas' {MainForm},
  About in 'About.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Notepad Py';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
