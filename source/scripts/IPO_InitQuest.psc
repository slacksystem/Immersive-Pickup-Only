ScriptName IPO_InitQuest Extends Quest
{Adds perk IPO_BlockPickupPerk to the character once, then ends}

Perk Property IPO_MainPerk Auto
Actor Property PlayerRef Auto

Event OnInit()
  PlayerRef.AddPerk(IPO_MainPerk)
EndEvent
