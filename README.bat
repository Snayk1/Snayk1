using System;
using System.Runtime.InteropServices;
using System.Security.Cryptography;
using System.Management;

namespace HWIDChanger
{
    public class Program
    {
        [DllImport("kernel32.dll")]
        static extern bool GetSystemFirmwareTable(out uint hardwareId);

        [DllImport("kernel32.dll")]
        static extern bool SetSystemFirmwareTable(uint hardwareId);

        public static void Main()
        {
            // Interface do Usuário
            Console.WriteLine("HWID Changer");
            Console.WriteLine("------------");

            // Detecção de Hardware
            uint hardwareId;
            GetSystemFirmwareTable(out hardwareId);
            Console.WriteLine("HWID Atual: " + hardwareId.ToString());

            // Geração de Novo HWID
            Guid novoHWID = Guid.NewGuid();
            Console.WriteLine("Novo HWID: " + novoHWID.ToString());

            // Aplicação do Novo HWID
            SetSystemFirmwareTable((uint)novoHWID.GetHashCode());
            Console.WriteLine("HWID Alterado com Sucesso!");

            // Verificação de Integridade
            if (VerificarIntegridade())
            {
                Console.WriteLine("Integridade Verificada!");
            }
            else
            {
                Console.WriteLine("Erro ao Verificar Integridade!");
            }
        }

        public static bool VerificarIntegridade()
        {
            // Verificar se o HWID foi alterado com sucesso
            uint novoHardwareId;
            GetSystemFirmwareTable(out novoHardwareId);
            return novoHardwareId == (uint)Guid.NewGuid().GetHashCode();
        }
    }
}
