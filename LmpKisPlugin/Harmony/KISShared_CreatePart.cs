﻿using Harmony;
using KIS;
using LmpClient.Systems.VesselProtoSys;
using System;
using UnityEngine;
// ReSharper disable All

namespace LmpClient.ModuleStore.Harmony
{
    /// <summary>
    /// When dropping a KIS inventory item don't set it's type as "debris" as the server will remove it with the dekessler
    /// </summary>
    [HarmonyPatch(typeof(KIS_Shared))]
    [HarmonyPatch("CreatePart")]
    [HarmonyPatch(new Type[] { typeof(ConfigNode),typeof(Vector3), typeof(Quaternion), typeof(Part), typeof(Part),
        typeof(string), typeof(AttachNode), typeof(KIS_Shared.OnPartReady),typeof(bool)})]
    public class KISShared_CreatePart
    {
        [HarmonyPostfix]
        private static void PostfixCreatePart(Part __result)
        {
            if (__result.vessel.vesselType == VesselType.Debris)
                __result.vessel.vesselType = VesselType.Unknown;

            VesselProtoSystem.Singleton.MessageSender.SendVesselMessage(__result.vessel);
        }
    }
}
