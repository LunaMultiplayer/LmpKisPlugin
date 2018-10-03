using Harmony;
using KIS;

// ReSharper disable All

namespace LmpClient.ModuleStore.Harmony
{
    /// <summary>
    /// When dropping a KIS inventory item don't set it's type as "debris" as the server will remove it with the dekessler
    /// </summary>
    [HarmonyPatch(typeof(KIS_Shared))]
    [HarmonyPatch("CreatePart")]
    public class KISShared_CreatePart
    {
        [HarmonyPostfix]
        private static void PostfixCreatePart(Part __result)
        {
            if (__result.vessel.vesselType == VesselType.Debris)
                __result.vessel.vesselType = VesselType.Unknown;
        }
    }
}
