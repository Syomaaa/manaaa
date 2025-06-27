surface.CreateFont("jujutsu_head", {
    font = "Ninja Naruto",
    extended = false,
    size = 20,
    weight = 500,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = false,
    additive = false,
    outline = false,
});

local function DrawName( ply )
	if ( !IsValid( ply ) ) then return end 
	if ( ply == LocalPlayer() ) then return end -- Don't draw a name when the player is you
	if ( !ply:Alive() ) then return end -- Check if the player is alive 
 
	local Distance = LocalPlayer():GetPos():Distance( ply:GetPos() ) --Get the distance between you and the player
	local infoocculte = ply:GetNWInt("DISLPMOCCULTE")
	local grade = ""
	
	if ( Distance < 400 ) then --If the distance is less than 1000 units, it will draw the name

            if tonumber(infoocculte) <= 200 and tonumber(infoocculte) <= 400 then
                grade = "Faible"
				colorgrade = Color(0, 237, 237, 255)
 	    elseif tonumber(infoocculte) >= 400 and tonumber(infoocculte) <= 4500 then
                grade = "Aguerris"
				colorgrade = Color(74,25,161,255)
            elseif tonumber(infoocculte) >= 4500 and tonumber(infoocculte) <= 9000 then
                grade = "Puissant"
				colorgrade = Color(140,86,86,255)
			elseif tonumber(infoocculte) >= 9000 and tonumber(infoocculte) <= 13500 then
                grade = "Agressif"
				colorgrade = Color(171,92,207,255)
			elseif tonumber(infoocculte) >= 13500 and tonumber(infoocculte) <= 18000 then
                grade = "Menacant"
				colorgrade = Color(255,0,0,255)
			elseif tonumber(infoocculte) >= 18000 and tonumber(infoocculte) <= 22500 then
                grade = "Redoutable"
				colorgrade = Color(255,255,255,255)
			elseif tonumber(infoocculte) >= 22500 and tonumber(infoocculte) <= 27000 then
                grade = "Terrifiant"
				colorgrade = Color(105,4,4,255)
			elseif tonumber(infoocculte) >= 27000 and tonumber(infoocculte) <= 32000 then
                grade = "Legende"
				colorgrade = Color(59,58,58,255)
	                elseif tonumber(infoocculte) >= 32000 and tonumber(infoocculte) <= 2000000 then
                grade = "Amiral"
				colorgrade = Color(0,0,0,255)
			end
 
		local offset = Vector( 0, 0, 80 )
		local ang = LocalPlayer():EyeAngles()
		local pos = ply:GetPos() + offset + ang:Up()
	 
		ang:RotateAroundAxis( ang:Forward(), 90 )
		ang:RotateAroundAxis( ang:Right(), 90 )
	 	
		cam.Start3D2D( pos, Angle( 0, ang.y, 90 ), 0.25 )

			draw.DrawText( grade, "jujutsu_head", 2, 2, colorgrade, TEXT_ALIGN_CENTER )

		cam.End3D2D()
	end
end
hook.Add( "PostPlayerDraw", "DrawName", DrawName )