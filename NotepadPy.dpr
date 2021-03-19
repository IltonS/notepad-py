program NotepadPy;

uses
  Vcl.Forms,
  TextEditor in 'TextEditor.pas' {FrmTextEditor};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmTextEditor, FrmTextEditor);
  Application.Run;
end.
