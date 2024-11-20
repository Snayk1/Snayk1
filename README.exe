using System;
using System.Runtime.InteropServices;
using System.Security.Cryptography;

class HWIDChanger {
  [DllImport("kernel32.dll")]
  static extern bool GetSystemFirmwareTable(out uint hardwareId);

  [DllImport("kernel32.dll")]
  static extern bool SetSystemFirmwareTable(uint hardwareId);

  public static void Main() {
    // Detecção de hardware
    uint hardwareId;
    GetSystemFirmwareTable(out hardwareId);

    // Geração de novo HWID
    Guid novoHWID = Guid.NewGuid();

    // Aplicação do novo HWID
    SetSystemFirmwareTable((uint)novoHWID.GetHashCode());
  }
}
