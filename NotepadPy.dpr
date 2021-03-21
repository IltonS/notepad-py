program NotepadPy;

uses
  Vcl.Forms,
  TextEditor in 'TextEditor.pas' {FrmTextEditor},
  About in 'About.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Notepad Py';
  Application.CreateForm(TFrmTextEditor, FrmTextEditor);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
