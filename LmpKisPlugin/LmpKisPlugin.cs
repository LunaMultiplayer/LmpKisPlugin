using Harmony;
using System.Reflection;
using UnityEngine;

namespace LmpKisPlugin
{
    [KSPAddon(KSPAddon.Startup.Instantly, true)]
    public class LmpKisPlugin : MonoBehaviour
    {
        public static LmpKisPlugin Singleton { get; set; }

        public void Awake()
        {
            Singleton = this;
            DontDestroyOnLoad(this);

            Debug.Log("[LmpKisPlugin] LMP-KIS Plugin started!");

            HarmonyInstance.Create("LmpKisPlugin").PatchAll(Assembly.GetExecutingAssembly()); ;
        }
    }
}
