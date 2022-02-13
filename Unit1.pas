unit Unit1;

interface

uses
  Unit2, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, ShellApi, Registry,
  Vcl.Buttons;

type
  TForm1 = class(TForm)
    ChkRegistryClean: TCheckBox;
    ChkJunkFileClean: TCheckBox;
    ChkStartupOptimization: TCheckBox;
    ChkSystemOptimization: TCheckBox;
    ChkDiskOptimization: TCheckBox;
    BtnOptimize: TImage;
    ChkDiskCleanUp: TCheckBox;
    ChkDisableAnimation: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ChkRegistryDefrag: TCheckBox;
    Label10: TLabel;
    ListHistoryOptimize: TListBox;
    BtnToggleHistoryOptimize: TButton;
    Reset: TBitBtn;
    procedure BtnOptimizeClick(Sender: TObject);
    procedure BtnToggleHistoryOptimizeClick(Sender: TObject);
    procedure ResetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// Tombol History Optimize
procedure TForm1.BtnToggleHistoryOptimizeClick(Sender: TObject);
begin
// Nilai awal History Menu adalah True
// Jika History Menu dalam keadaan False atau tidak tampil
  if ListHistoryOptimize.Visible = False then begin
    // Maka tampilkan History Menu
    ListHistoryOptimize.Visible:=True;
    end
  else
    begin
    // Jika History Menu dalam keadaan True atau tampil
      if ListHistoryOptimize.Visible = True then begin
        // Maka sembunyikan History Menu
        ListHistoryOptimize.Visible:=False;
      end;
    end
end;

// Tombol Optimize
procedure TForm1.BtnOptimizeClick(Sender: TObject);
var
// Variabel registry dengan nama reg
reg:TRegistry;
begin
  // Jika pengguna menceklis checkbox Registry Clean
  if ChkRegistryClean.Checked then begin
      // Maka Label Registry Clean akan menginsert ke menu Histori
      ListHistoryOptimize.Items.Add(Label1.Caption);

      // Melakukan Eksekusi ke file Registry Clean.exe secara Run As Administrator
      // File tersebut adalah file macro yang telah dibuat sebelumnya yang berfungsi untuk menggerakkan cursor mouse sekaligus untuk mengklik tombol pada aplikasi eksternal
      ShellExecute(Handle, 'runas', PChar(GetCurrentDir+'\Fitur\Registry Clean.exe'), nil, nil, SW_SHOWNORMAL);

      // Membuka program aplikasi Advanced SystemCare sebagai aplikasi ekternal
      WinExec('C:\Program Files (x86)\IObit\Advanced SystemCare\ASC.exe', SW_NORMAL);
      exit();
      end;

  // Jika pengguna menceklis checkbox Registry Defrag
  if ChkRegistryDefrag.Checked then begin
      // Maka Label Registry Defrag akan menginsert ke menu Histori
      ListHistoryOptimize.Items.Add(Label10.Caption);

      // Melakukan Eksekusi ke file Registry Defrag.exe secara Run As Administrator
      // File tersebut adalah file macro yang telah dibuat sebelumnya yang berfungsi untuk menggerakkan cursor mouse sekaligus untuk mengklik tombol pada aplikasi eksternal
      ShellExecute(Handle, 'runas', PChar(GetCurrentDir+'\Fitur\Registry Defrag.exe'), nil, nil, SW_SHOWNORMAL);

      // Membuka program aplikasi Advanced SystemCare sebagai aplikasi ekternal
      WinExec('C:\Program Files (x86)\IObit\Advanced SystemCare\ASC.exe', SW_NORMAL);
      exit();
      end;

  // Jika pengguna menceklis checkbox Junk File Clean
  if ChkJunkFileClean.Checked then begin
      // Maka Label Junk File Clean akan menginsert ke menu Histori
      ListHistoryOptimize.Items.Add(Label2.Caption);

      // Melakukan Eksekusi ke file Junk File Clean.exe secara Run As Administrator
      // File tersebut adalah file macro yang telah dibuat sebelumnya yang berfungsi untuk menggerakkan cursor mouse sekaligus untuk mengklik tombol pada aplikasi eksternal
      ShellExecute(Handle, 'runas', PChar(GetCurrentDir+'\Fitur\Junk File Clean.exe'), nil, nil, SW_SHOWNORMAL);

      // Membuka program aplikasi Advanced SystemCare sebagai aplikasi ekternal
      WinExec('C:\Program Files (x86)\IObit\Advanced SystemCare\ASC.exe', SW_NORMAL);
      exit();
      end;

  // Jika pengguna menceklis checkbox Startup Optimization
  if ChkStartupOptimization.Checked then begin
      // Maka Label Startup Optimization akan menginsert ke menu Histori
      ListHistoryOptimize.Items.Add(Label3.Caption);

      // Melakukan Eksekusi ke file Startup Optimization.exe secara Run As Administrator
      // File tersebut adalah file macro yang telah dibuat sebelumnya yang berfungsi untuk menggerakkan cursor mouse sekaligus untuk mengklik tombol pada aplikasi eksternal
      ShellExecute(handle, 'runas', PChar(GetCurrentDir+'\Fitur\Startup Optimization.exe'), nil, nil, SW_SHOWNORMAL);

      // Membuka program aplikasi Advanced SystemCare sebagai aplikasi ekternal
      WinExec('C:\Program Files (x86)\IObit\Advanced SystemCare\ASC.exe', SW_NORMAL);
      exit();
      end;

  // Jika pengguna menceklis checkbox System Optimization
  if ChkSystemOptimization.Checked then begin
      // Maka Label System Optimization akan menginsert ke menu Histori
      ListHistoryOptimize.Items.Add(Label4.Caption);

      // Melakukan Eksekusi ke file System Optimization.exe secara Run As Administrator
      // File tersebut adalah file macro yang telah dibuat sebelumnya yang berfungsi untuk menggerakkan cursor mouse sekaligus untuk mengklik tombol pada aplikasi eksternal
      ShellExecute(Handle, 'runas', PChar(GetCurrentDir+'\Fitur\System Optimization.exe'), nil, nil, SW_SHOWNORMAL);

      // Membuka program aplikasi Advanced SystemCare sebagai aplikasi ekternal
      WinExec('C:\Program Files (x86)\IObit\Advanced SystemCare\ASC.exe', SW_NORMAL);
      exit();
      end;

  // Jika pengguna menceklis checkbox Disk Optimization
  if ChkDiskOptimization.Checked then begin
      // Maka Label Disk Optimization akan menginsert ke menu Histori
      ListHistoryOptimize.Items.Add(Label5.Caption);

      // Melakukan Eksekusi ke file Disk Optimization.exe secara Run As Administrator
      // File tersebut adalah file macro yang telah dibuat sebelumnya yang berfungsi untuk menggerakkan cursor mouse sekaligus untuk mengklik tombol pada aplikasi eksternal
      ShellExecute(handle, 'runas', PChar(GetCurrentDir+'\Fitur\Disk Optimization.exe'), nil, nil, SW_SHOWNORMAL);

      // Membuka program aplikasi Advanced SystemCare sebagai aplikasi ekternal
      WinExec('C:\Program Files (x86)\IObit\Advanced SystemCare\ASC.exe', SW_NORMAL);
      exit();
  end;

  // Jika pengguna menceklis checkbox Disk Clean Up
  if ChkDiskCleanUp.Checked then begin
      // Maka Label Disk Clean Up akan menginsert ke menu Histori
      ListHistoryOptimize.Items.Add(Label7.Caption);

      // Membuka program aplikasi Advanced SystemCare sebagai aplikasi ekternal
      WinExec('C:\Windows\System32\cleanmgr.exe', SW_NORMAL);
  end;

  // Jika pengguna menceklis checkbox Disable Animation
  if ChkDisableAnimation.Checked then begin
      // Tampilkan Form yang berisikan tombol enable animation dan disable animation
      Form2.Show;
  end;

end;

// Tombol Reset
procedure TForm1.ResetClick(Sender: TObject);
begin
  // Mereset atau non ceklis semua fitur pada checkbox
  ChkRegistryClean.Checked:=False;
  ChkRegistryDefrag.Checked:=False;
  ChkJunkFileClean.Checked:=False;
  ChkStartupOptimization.Checked:=False;
  ChkSystemOptimization.Checked:=False;
  ChkDiskOptimization.Checked:=False;
  ChkDiskCleanUp.Checked:=False;
  ChkDisableAnimation.Checked:=False;
end;

end.


