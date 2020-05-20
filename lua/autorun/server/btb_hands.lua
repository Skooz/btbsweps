function SetBTBHands( ply , com , arg )

	if not arg then return end
	
	local SKINTOUSE = tonumber( arg[1] )
	
	file.CreateDir("Plyr_BTB_Hands")
	file.Write( "Plyr_BTB_Hands/"..ply:UniqueID()..".txt" , SKINTOUSE )
	
	ply:GetViewModel():SetBodygroup( 1 , tonumber( file.Read("Plyr_BTB_Hands/"..ply:UniqueID()..".txt" ) ) )
	
end

concommand.Add("SetBTBHands",SetBTBHands)