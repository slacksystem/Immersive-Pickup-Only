scriptname IPO_PowerScript extends ActiveMagicEffect

GlobalVariable Property IPO_ModEnabled Auto
Perk Property IPO_MainPerk Auto
Actor Property PlayerRef Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    {Toggles the Main Perk on the player}
    if IPO_ModEnabled.GetValue()
        IPO_ModEnabled.SetValue(0)
        PlayerRef.RemovePerk(IPO_MainPerk)
        Debug.Notification("Default Pickup has been permitted")
    else 
        IPO_ModEnabled.SetValue(1)
        PlayerRef.AddPerk(IPO_MainPerk)
        Debug.Notification("Default Pickup has been disallowed")
    EndIf
EndEvent
