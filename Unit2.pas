unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Registry;

type
  TForm2 = class(TForm)
    RadioGroup1: TRadioGroup;
    BtnRunAnimationWindow: TButton;
    procedure BtnRunAnimationWindowClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit1;

// Method Animation Disable
procedure AnimationDisable;
var
// Variabel Registry dengan nama reg
reg:TRegistry;
begin
      ShowMessage('Disable Animation Active!');
      // Penciptaan Registry
      reg:=TRegistry.Create;

      // Root Pada Registry
      reg.RootKey:=HKEY_CURRENT_USER;

      // Detail Lokasi
      reg.OpenKey('\Control Panel\Desktop\WindowMetrics', true);

      // Nilai 1 = disable, 0 enable
      reg.WriteInteger('MinAnimate',1);

      // Menutup key
      reg.CloseKey;

      // Menginsert Label Animation Window ke Menu Histori
      Form1.ListHistoryOptimize.Items.Add(Form1.Label6.Caption);
end;

// Method Animation Enable
procedure AnimationEnable;
var
// Variabel Registry dengan nama reg
reg:TRegistry;
begin
      ShowMessage('Enable Animation Active!');
      // Penciptaan Registry
      reg:=TRegistry.Create;

      // Root Pada Registry
      reg.RootKey:=HKEY_CURRENT_USER;

      // Detail Lokasi
      reg.OpenKey('\Control Panel\Desktop\WindowMetrics', true);

      // Nilai 1 = disable, 0 enable
      reg.DeleteValue('MinAnimate');

      // Menutup key
      reg.CloseKey;

      // Menginsert Label Animation Window ke Menu Histori
      Form1.ListHistoryOptimize.Items.Add(Form1.Label6.Caption);
end;

// Tombol Run Animation Window
procedure TForm2.BtnRunAnimationWindowClick(Sender: TObject);
begin
    // Pilihan tombol animation enable dan disable
    case RadioGroup1.ItemIndex of

        // Jika pengguna memilih tombol enable animation maka method
        // Animation Enable dijalankan
        0: AnimationDisable;

        // Jika pengguna memilih tombol disable animation maka method
        // Animation Disable Dijalankan
        1: AnimationEnable;
    end;

    // Jika pengguna memilih tombol Yes maka komputer akan merestart dengan sendirinya
    // Jika memilih tombol No maka komputer tidak jadi restart
    if messageDlg ('Untuk menerapkan fitur Animation Window'+chr(10)+ 'Diharuskan untuk melakukan Restart Komputer'+chr(10)+ 'Restart Komputer sekarang?', mtInformation,  [mbYes]+[mbNo],0) = mrYes then begin
      WinExec('Shutdown -r -t 0 -f', SW_NORMAL);
    end;
  end;
end.
