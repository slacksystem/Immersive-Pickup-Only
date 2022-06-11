scriptname IPO_ConfigMenu extends SKI_ConfigBase

; SCRIPT VERSION ----------------------------------------------------------------------------------

int function GetVersion()
	return 1 ; Default version
endFunction

; PROPERTIES -------------------------------------------------------------------------------

GlobalVariable Property IPO_ModEnabled Auto
Perk Property IPO_MainPerk Auto
Actor Property PlayerRef Auto

; PRIVATE VARIABLES -------------------------------------------------------------------------------

; OIDs (T:Text B:Toggle S:Slider M:Menu, C:Color, K:Key)
;/
int			_myTextOID_T
int			_myToggle_OID_B
int			_mySliderOID_S
int			_myMenuOID_M
int			_myColorOID_C
int			_myKeyOID_K
int			_myInputOID_I
/;
int OID_ModEnabled

; State

; ...

; Internal

; ...


; INITIALIZATION ----------------------------------------------------------------------------------

; @implements SKI_ConfigBase
;/
Event OnConfigInit()
	{Called when this config menu is initialized}

	; ...
EndEvent
/;

; @implements SKI_QuestBase
;/
Event OnVersionUpdate(int a_version)
	{Called when a version update of this script has been detected}

	; ...
endEvent
/;


; EVENTS ------------------------------------------------------------------------------------------

; @implements SKI_ConfigBase
event OnPageReset(string a_page)
	{Called when a new page iks selected, including the initial empty page}
  SetCursorFillMode(TOP_TO_BOTTOM)
  SetCursorPosition(0)

  AddHeaderOption("Prevent Vanilla Pickup Method")
  OID_ModEnabled = AddToggleOption("Prevent Default Item Pickup", 1)
	; ...
endEvent

; @implements SKI_ConfigBase

event OnOptionHighlight(int a_option)
	{Called when highlighting an option}
	If (a_option == OID_ModEnabled)
		SetInfoText("Enabling this well prevent the player from picking up items using the default method")
	EndIf
	; ...
endEvent


; @implements SKI_ConfigBase
event OnOptionSelect(int a_option)
	{Called when a non-interactive option has been selected}
		If (a_option == OID_ModEnabled)
			If IPO_ModEnabled.GetValue() == 0; ;If the toggle was not checked
				IPO_ModEnabled.SetValue(1)
				SetToggleOptionValue(OID_ModEnabled, 1)
				PlayerRef.AddPerk(IPO_MainPerk)
			ElseIf(IPO_ModEnabled.GetValue() == 1) ;If the toggle was checked
				IPO_ModEnabled.SetValue(0)
				SetToggleOptionValue(OID_ModEnabled, 0)
				PlayerRef.removePerk(IPO_MainPerk)
			EndIf
		Endif
	; ...
endEvent

; @implements SKI_ConfigBase
;/
event OnOptionDefault(int a_option)
	{Called when resetting an option to its default value}

	; ...
endEvent

; @implements SKI_ConfigBase
event OnOptionSliderOpen(int a_option)
	{Called when a slider option has been selected}

	; ...
endEvent

; @implements SKI_ConfigBase
event OnOptionSliderAccept(int a_option, float a_value)
	{Called when a new slider value has been accepted}

	; ...
endEvent

; @implements SKI_ConfigBase
event OnOptionMenuOpen(int a_option)
	{Called when a menu option has been selected}

	; ...
endEvent

; @implements SKI_ConfigBase
event OnOptionMenuAccept(int a_option, int a_index)
	{Called when a menu entry has been accepted}

	; ...
endEvent

; @implements SKI_ConfigBase
event OnOptionColorOpen(int a_option)
	{Called when a color option has been selected}

	; ...
endEvent

; @implements SKI_ConfigBase
event OnOptionColorAccept(int a_option, int a_color)
	{Called when a new color has been accepted}

	; ...
endEvent

; @implements SKI_ConfigBase
event OnOptionKeyMapChange(int a_option, int a_keyCode, string a_conflictControl, string a_conflictName)
	{Called when a key has been remapped}

	; ...
endEvent

; @implements SKI_ConfigBase
event OnOptionInputOpen(int a_option)
	{Called when a text input option has been selected}

	; ...
endEvent

; @implements SKI_ConfigBase
event OnOptionInputAccept(int a_option, string a_input)
	{Called when a new text input has been accepted}

	; ...
endEvent
/;
