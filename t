player = game.Players.LocalPlayer
wait()
script.Parent=nil
active = true
Settings = {
	Prefix = "";
	LerpSpeed = 0.9;
	MusicLerp = .3;
	Distance = 60;
	Range = 100;
	Height = 0;
}

function cycle(num)
    local section=num % 1 * 3;
    local secondary=0.5 * math.pi * (section % 1);
    if section < 1 then
        return 1,1 - math.cos(secondary),1 - math.sin(secondary);
    elseif section < 2 then
        return 1 - math.sin(secondary),1,1 - math.cos(secondary);
    else
        return 1 - math.cos(secondary),1 - math.sin(secondary),1;
    end
end

function SpawnBars()
	partmiddle = Instance.new("Part")
	partmiddle.Name = "Bars___"..player.Name
	partmiddle.Size = Vector3.new(.2,4,.2)
	partmiddle.Parent = player.Character
	partmiddle.Anchored = true
	partmiddle.Material = "Neon"
	partmiddle.Transparency = 0.35
	partmiddle.BrickColor = BrickColor.new(Color3.new(cycle(tick())));
	partmiddle.CanCollide = false
	partleft = partmiddle:Clone()
	partright = partmiddle:Clone()
	partleftfar = partmiddle:Clone()
	partrightfar = partmiddle:Clone()
	partleftfarfar = partmiddle:Clone()
	partrightfarfar = partmiddle:Clone()
	partleftfarfarfar = partmiddle:Clone()
	partrightfarfarfar = partmiddle:Clone()
	partleftfarest = partmiddle:Clone()
	partrightfarest = partmiddle:Clone()
	partleft.Parent = partmiddle
	partright.Parent = partmiddle
	partleftfar.Parent = partmiddle
	partrightfar.Parent = partmiddle
	partleftfarfar.Parent = partmiddle
	partrightfarfar.Parent = partmiddle
	partleftfarfarfar.Parent = partmiddle
	partrightfarfarfar.Parent = partmiddle
	partleftfarest.Parent = partmiddle
	partrightfarest.Parent = partmiddle
end
function SpawnMusic()
	Sound = Instance.new('Sound',partmiddle)
	Sound.EmitterSize = Settings.Range
	Sound.Looped = true
	Sound.Volume = 10
	Sound:Play()
end

local Songs = {
{SongName = 'Trigger', SongDesc = 'Nil', Creator = 'Ayeekillerpro', ID = 301999080};
{SongName = 'Lindsey Sterling - Crystallize', SongDesc = 'Nil', Creator = 'Nil', ID = 165000427};
{SongName = 'Charli XCX - Boom clap', SongDesc = 'Nil', Creator = 'brightnikki', ID = 160594536};
{SongName = 'Elle King - Exs & Ohs', SongDesc = 'Nil', Creator = 'Nil', ID = 270207539};
{SongName = 'Burnt Rice - Shawn Wasabi', SongDesc = 'Nil', Creator = 'Nil', ID = 327095350};
{SongName = 'KSI', SongDesc = 'Nil', Creator = 'Violisse', ID = 455542293};
{SongName = 'Desiigner - Timmy Turner (Official Audio)', SongDesc = 'Nil', Creator = 'Nil', ID = 469009274};
{SongName = 'Fall Out Boy - Centuries', SongDesc = 'Nil', Creator = 'Nil', ID = 181547615};
{SongName = 'Black Beatles', SongDesc = 'Nil', Creator = 'Nil', ID = 492272696};
{SongName = 'Tristam & Braken - Frame of Mind', Creator = 'Nil', ID = 453388373};
{SongName = 'Tristam - Crave', Creator = 'Nil', ID = 453400867};
{SongName = 'Kent - Don\'t Mind', Creator = 'Nil', ID = 400157162};
{SongName = 'Pegboard Nerds - Disconnected', Creator = 'Nil', ID = 146006186};
{SongName = 'Razihel & Virtual Riot - One For All, All For One', Creator = 'Nil', ID = 142314944};
{SongName = 'Tristam - I Remember', Creator = 'Nil', ID = 179356541};
{SongName = 'Tristam - Once Again', Creator ='Nil', ID = 174373804};
{SongName = 'Tristam - Devotion', Creator ='Nil', ID = 385834758};
{SongName = 'Tristam & Braken - Flight', Creator ='Nil', ID = 326260126};
{SongName = 'Tristam & Rogue - Rewel', Creator= 'Nil', ID = 202972804};
{SongName = 'Tristam - Before We Fade', Creator= 'Nil', ID = 457004310};
{SongName = 'Tristam - The Vine', Creator ='Nil', ID = 332854144};
{SongName = 'Tristam & Braken - Far Away', Creator ='Nil', ID = 227991842};
{SongName = 'Tristam - My Friend', Creator= 'Nil', ID = 204411450};
{SongName = 'Tristam - Till It\'s Over', Creator ='Nil', ID = 186430325};
{SongName = 'Tokyo Machine - Party', Creator= 'Nil', ID = 499446130};
{SongName = 'Subtact - Anomaly', Creator= 'Nil', ID = 296804412};
{SongName = 'Tep No - It\'s Alright (NGHTMARE Remix)[feat. Liz Kellerman]', Creator ='Nil', ID = 296339290};
}
function PlayList()
	local sng = Songs[math.random(1,#Songs)]
	Sound.SoundId = 'rbxassetid://'..sng.ID
	Sound:Play()
	repeat wait() until Sound.IsPaused == true
    if play == false then return end
    if Pause == true then return end
	PlayList()
end
local Loop = false
local Locked
p = game:GetService('Players').LocalPlayer
p.Chatted:connect(function(msg)
	if msg:sub(1,5):lower()=='play ' then
		play = true
		local val = Instance.new("NumberValue", p.Character)
		val.Name = "SongID"
		val.Value = tonumber(msg:sub(6))
		local id = val.Value
		Sound:Stop()
		Sound.SoundId='rbxassetid://'..id
		Sound:Play()
		wait(1)
		val:Remove()
	elseif msg:sub(1,4):lower()=='vol ' then
		local val = Instance.new("NumberValue", p.Character)
		val.Name = "VolID"
		val.Value = tonumber(msg:sub(5))
		if val.Value > 10 then val.Value = 10
		end
		local id = val.Value
		Sound.Volume = id
		val:Remove()
		
	elseif msg:sub(1,6) == 'start ' then
		play = true
		PlayList()

	elseif msg:sub(1,5) == 'loop ' and Loop == false then
		Loop = true
		game.Players.LocalPlayer.Character.Torso.Sound.Looped = true

	elseif msg:sub(1,5) == 'loop ' and Loop == true then
		Loop = false
		game.Players.LocalPlayer.Character.Torso.Sound.Looped = false

	elseif msg:sub(1,6) == 'pause ' and Pause == false then
		Pause = true
		game.Players.LocalPlayer.Character.Torso.Sound:Pause()

	elseif msg:sub(1,6) == 'pause ' and Pause == true then
		Pause = false
		game.Players.LocalPlayer.Character.Torso.Sound:Resume()

	elseif msg:sub(1,5) == 'skip ' then
		play = false
	    	Sound:Stop()
		play = true
	   	 PlayList()

	elseif msg:sub(1,5) == 'stop ' then
		play = false
	    	Sound:Stop()
	end

end)

game:GetService'RunService'.RenderStepped:connect(function()
	if not active then return end
	if not player.Character:FindFirstChild('Bars___'..player.Name) then
		SpawnBars()
		wait()
	end
	if not player.Character:FindFirstChild('Bars___'..player.Name):FindFirstChild('Sound') then
		SpawnMusic()
		wait()
	else
		if Sound.PlaybackLoudness >= 400 then
			partmiddle.BrickColor = BrickColor.new(Color3.new(cycle(tick())));
		end
	end
	pcall(function()
		partmiddle.CFrame = partmiddle.CFrame:Lerp(game.workspace.Base.CFrame*CFrame.new(0,Settings.Height,350),Settings.LerpSpeed)
		partleft.CFrame = partleft.CFrame:Lerp(partmiddle.CFrame*CFrame.new(-Settings.Distance,0,0),Settings.LerpSpeed)
		partright.CFrame = partright.CFrame:Lerp(partmiddle.CFrame*CFrame.new(Settings.Distance,0,0),Settings.LerpSpeed)
		partleftfar.CFrame = partleftfar.CFrame:Lerp(partleft.CFrame*CFrame.new(-Settings.Distance,0,0),Settings.LerpSpeed)
		partrightfar.CFrame = partrightfar.CFrame:Lerp(partright.CFrame*CFrame.new(Settings.Distance,0,0),Settings.LerpSpeed)
		partleftfarfar.CFrame = partleftfarfar.CFrame:Lerp(partleftfar.CFrame*CFrame.new(-Settings.Distance,0,0),Settings.LerpSpeed)
		partrightfarfar.CFrame = partrightfarfar.CFrame:Lerp(partrightfar.CFrame*CFrame.new(Settings.Distance,0,0),Settings.LerpSpeed)
		partleftfarfarfar.CFrame = partleftfarfarfar.CFrame:Lerp(partleftfarfar.CFrame*CFrame.new(-Settings.Distance,0,0),Settings.LerpSpeed)
		partrightfarfarfar.CFrame = partrightfarfarfar.CFrame:Lerp(partrightfarfar.CFrame*CFrame.new(Settings.Distance,0,0),Settings.LerpSpeed)
		partleftfarest.CFrame = partleftfarest.CFrame:Lerp(partleftfarfarfar.CFrame*CFrame.new(-Settings.Distance,0,0),Settings.LerpSpeed)
		partrightfarest.CFrame = partrightfarest.CFrame:Lerp(partrightfarfarfar.CFrame*CFrame.new(Settings.Distance,0,0),Settings.LerpSpeed)
	end)
	local Color =  partmiddle.BrickColor
	local Color_2 = partleft.BrickColor
	local Color_3 = partleftfar.BrickColor
	local Color_4 = partleftfarfar.BrickColor
	local Color_5 = partleftfarfarfar.BrickColor
	local Prev_Size = partmiddle.Size
	local Prev_Size2 = partleft.Size
	local Prev_Size3 = partleftfar.Size
	local Prev_Size4 = partleftfarfar.Size
	local Prev_Size5 = partleftfarfarfar.Size
	partmiddle.Size = partmiddle.Size:Lerp(Vector3.new(30,Sound.PlaybackLoudness/1.3,.3),Settings.MusicLerp)
	wait()
	partleft.Size = partleft.Size:Lerp(Prev_Size,Settings.MusicLerp)
	partright.Size = partright.Size:Lerp(Prev_Size,Settings.MusicLerp)
	partleft.BrickColor = Color
	partright.BrickColor = Color
	wait()
	partleftfar.Size = partleftfar.Size:Lerp(Prev_Size2,Settings.MusicLerp)
	partrightfar.Size = partrightfar.Size:Lerp(Prev_Size2,Settings.MusicLerp)
	partleftfar.BrickColor = Color_2
	partrightfar.BrickColor = Color_2
	wait()
	partleftfarfar.Size = partleftfarfar.Size:Lerp(Prev_Size3,Settings.MusicLerp)
	partrightfarfar.Size = partrightfarfar.Size:Lerp(Prev_Size3,Settings.MusicLerp)
	partleftfarfar.BrickColor = Color_3
	partrightfarfar.BrickColor = Color_3
	wait()
	partleftfarfarfar.Size = partleftfarfarfar.Size:Lerp(Prev_Size4,Settings.MusicLerp)
	partrightfarfarfar.Size = partrightfarfarfar.Size:Lerp(Prev_Size4,Settings.MusicLerp)
	partleftfarfarfar.BrickColor = Color_4
	partrightfarfarfar.BrickColor = Color_4
	wait()
	partleftfarest.Size = partleftfarest.Size:Lerp(Prev_Size5,Settings.MusicLerp)
	partrightfarest.Size = partleftfarest.Size:Lerp(Prev_Size5,Settings.MusicLerp)
	partleftfarest.BrickColor = Color_5
	partrightfarest.BrickColor = Color_5
end)
