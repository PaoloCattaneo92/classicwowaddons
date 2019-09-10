-- **************************
-- Written By: Juju
-- 0.1:
-- - Initial Creation of Corduroy Addon
-- **************************

function round(float)
  return floor(float+0.5);
end

function Corduroy_OnLoad()

	if (not Corduroy) then
		Corduroy = {};
		Corduroy["map cursor"]=true;
	end
end

function CorduroyWorldMap_OnUpdate()
	local output = "";
	if (Corduroy["map cursor"] == true) then
		local x, y = GetCursorPosition();
		local scale = WorldMapFrame:GetScale();
		x = x / scale;
		y = y / scale;
		local width = WorldMapFrame:GetWidth();
		local height = WorldMapFrame:GetHeight();
		local centerX, centerY = WorldMapFrame:GetCenter();
		local adjustedX = (x - (centerX - (width/2))) / width;
		local adjustedY = (centerY + (height/2) - y) / height;
		x = (adjustedX + 0.0022) * 100;
		y = (adjustedY + -0.0262) * 100;
		text = "Cursor Location: "..format("%d,%d",x,y);
	end
	CorduroyWorldMap:SetText(text);
end
