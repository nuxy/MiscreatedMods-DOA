System.ExecuteCommand("log_WriteToFile 1")
System.ExecuteCommand("log_WriteToFileVerbosity 4")
System.ExecuteCommand("log_IncludeTime 1")

System.SetCVar("g_debugRMI", 1)
System.SetCVar("log_Verbosity", 4)
System.SetCVar("net_disconnect_on_rmi_error", 0)
System.SetCVar("net_log_remote_methods", 1)

--
-- Global callbacks.
--
RegisterCallback(_G, "OnInitAllLoaded", nil,
	function()
		--Log(">> OnInitAllLoaded")

		RemoteInventoryInit()
	end
)
