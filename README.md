#include <Windows.h>
#include <uuid/uuid.h>

int main() {
  // Detecção de hardware
  DWORD dwHardwareId;
  GetSystemFirmwareTable(&dwHardwareId);

  // Geração de novo HWID
  uuid_t novoHWID;
  uuid_generate_random(novoHWID);

  // Aplicação do novo HWID
  SetSystemFirmwareTable(novoHWID);

  return 0;
}
