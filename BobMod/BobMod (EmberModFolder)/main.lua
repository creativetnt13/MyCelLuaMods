--Some setup things
love.filesystem.createDirectory("textures")
love.filesystem.createDirectory("textures/BobMod")

BobListIndex = #lists + 1

cat.bob = {name="Bob Cells",max=3}
lists[BobListIndex] = {name = "BobMod", cells = {max=99,cat.bob}, desc = "BobMod cells", icon = 'bob'}

--Makes the secrets
Secrets = {
	[[JTF0agk4ey16PTw1ZjYwUXN1KmwhQDhOTw0KajRAaWsiI3AlWnB3cmgoNT1APjVTLXQ0VkJnJ1BkVSMpcAlbalFUISo7UmEiXC51bGZEO3tnW3Q4VXM7VnUqXm1mO1MpbT9RR1kJbw0KN1E8YH4xYydgOjtFPDM/Pl8wcDp0aiosKjF8QCYpdSs9SzhIZjMyNGBzO0pzOj8keyRBNyZ5MDE0dnInDQpOTD0jRjttTVAlPykqNCNdJTEwezVrCSkgfm87J1sqMTdkZHwuW2AsTTFebiU9KEA0P2o4OyRQNDUpJTdybGU9Mns4ci1eCVsnSFB7XzZgKS5xV1wgdEg6WFNPMnJVZlBDVSlpXmtUdHkhbWJeMT1UWXpPeCtYUV55X2NxdyVxdmcrYkxObWNyZmldQG5XZW02KVVgaSw1KmoqdipeL197QyssLGdxcF4ofjxSYCt9MD9UanlgPUdXZl9eSyNtR1tdWSN6TDF0Z2VlUXQuZj0JXl8pM3w8WiJ8JFd3QDwtTVcyfD5zWX5qWnd6a1IqUn5zc1h3cVp+Oi52c3JLNyRedjYhWT9WYD8sLVUlR3cqWlZlXSRmOU8/KCVtYl4xQFRZbll1dFJTIl5eY1BWVgkNCmVPWXJcaW5+SXAjOnlxJWpFKC9wRmYgMVkhOU1PL1lQDQpOSD8mKic1XGlDODZtNk5EQCcwM3ZgYWc1bS9AK1w3dE1nDQpcMVNuJkBbckcJPy1HOkcpPj8/K3k+Qg0KQmZyQV1bLyp0Tmg2ITxvRSw0JnE6fgk7T301UH46PlswQWlxQy13P0Z7e3InNzNLPXQwdTgsXD52Qkk3dTwwfDN3eCZODQpza2sqMjFcKzo8fDEoMTAzbC4NCm9hS1JAdX11Wl5NdCA+fDgjLip8KisjNExAOD5+MW9aOksrTGMvLS4qRS4zJUoqIDdePCMrejMgNzBIRjUhUmgpXnlncU8NCmRqckouLjArIz5WbldpaGArJk1sQUtiQkwNClxiZSwmck0NCmFsZVBdIyIpKzNDZT8NCnVrTkpgOVQNCi0teDB1CXFJRQ0KWk9HUidtaTdzWzohKkdOPyMxYglgPEtjKDYsDQo2QnVECV9bKFNnXXU7QEZqezFJJw0KUT47Og0KJSo7DQoNCjppdihEN30pXW8JfENOPS0ndncNCmFlbSxeKlY0bS06DQpfKigxDQpQMSwJKi5MPz0kcjooXSoxRwkiXShga0NGPypCZCA/XCYsOVMwXTYzLV15Tk5hIlwudWxeIAlfSjRERCwwU0w4IiVALyFcO14iPjFoRGZ5d1woIilzRwkzK0dOdGl9Wz5kcHk+LntELDl8RU0oJGogDQpyQmU=]],
	[[eFh8YiRjCTk+bmJRLF5Jdl5xbFlAN0QvTA0KSDFud2t1bGgwfTsyZHgyfEpreHUrQWZgYHl5UH14RjFDOjB4PSsxOENkcUI9WGNuWz04ZiQ7e3xRJTRWeDc6OGNlOiJpSDBaST5ILVspdA0KTXR6RmorWEhuNEtnNDp+ICw2OVxbOjU5KCN4fkN8QCUta2o/JkldP341IUg8SSUqXDYqPyhrcHtROXx9In0JIUNZDQpCK3IwSGNwbX16ZE1OeEA8KXlePVswRTU4Wit+Z09zdnRCLDgxOzNVWTMnZzxvOSIJJzchPXkJe3M0dV5KWn43KnIxUz8lSitNQGIwYGUiPj0iK20/c1phJFE3aERSbC8oJE0sY0Q3WUQscHJZezotazJueXF5KkNQKXZbPyFfPFd4QFhnTFRsQFwhWHRHSGdUUXglWmtYI2ImI1Q/VSwmeXdTTWM+cSppcHVJeS0uXksmdXFzJn0/PEpmOl1NamxkelNwfVxEbjw+YSRmOklIem89K3o8c0BXdUYhamwrdHgxOTNtTkhZWClMTFwkVS1aCU1laEg+Un4uQi19JTYJMmZqOFZgXVpOWEl0aiZFeCJMVGU8KmIoYlg5WFdLJWd9TyNqTn06XVB+eH4zQyR8XTVFd2tNTWozXyphVmdKanY3LXY/e2RdfklmbG9HOGwoYUV1ayFBLnY+XTllMTtlKDotTncxXHZ7KDs6d2FLLXZAQn48di8qbzoiZVQwKVpIKj10aXd0b1d4fW9AWmt2dyMsZWRHL0Y6YQ0KK2pMclF2Q1NAdUslfj4pYWw1OiQ7e1MhdjFZTF5haW5zWzozKTYlfjxzd2B9aDIJDQp6RmorWEgxbjFnISB+MS4yWTt4OycoKkEgYWI1Lyh6PDJzczRJU1g+SGclMl5eS0IpP35bMHEvO3AyfS4/byl3SWJeKzZidlliDQpBKytXSElZVU96aXggMyU+ND5fazM1MSJsKCwiNi4NCm1xSlZBSWFxITp6biFpPyEzJD9ONil8PDZAW0U/DQpYTjBlWm9wZ2JlYjcoM2FiJFZyUy07PTI4cWNWYH5ALns9aglNRDYpNlo8SHA0STFyYi4zPiw0eyFtOiopQXZRMSJuMjE1MntzNHVeSmZMXD0xMQ0KRnZhWE4wZVpvcGdiPFx2dElQVnpxSC5bUidPDQorK1dISVlVNTZMTXR6RmorcGBPLzJkJC5wMjV8XDxNVHFfLl54DQpwbkxLNTZWSHlJRytqTHJRNnNTOiVIYXd7dCxtIjMnQzRRJjVCSGF0XkJiXls2MThCJX05NjM9fXhqITN2bD9qYj13cA0KMUVsU2xobGlkTW1xSlZBSWFxcG4hLXh2Ljt1VV5KansnfXYmXSdGQX5gTnUsYEFwMTs6W0B5N1VOQmUndEg+NW0rdGErfHNdWS1rNnk9fEt4L0xYfmond2lwMCpoSg0KZE1tcUpWQUlhcXBuTEs1NmBeNA0KK2pMclF2Q1NkRnZhWE4wZXM5LV0rWztqZERjUHpPcitIezswO3ANCldISVlVNTZMTXR6RmorWEhlZEpycywsOz5sUGRbNkR5DQpJYXFwbkxLNTZWSHl4JUxZDQpRdkNTZEZ2YVhOMGVWODAufTBceENsDQpCK3IwSGNwbVdBKytUJXQtJnVpSFwNCkZqK1hIMW53ZyM/SG5KDQoNCm1xSlZBSWFxMzR5dnI2PCQ0KH5hOkxZUV9uW11AMiE6W2kNCg0KZ2JlYjdHdz1NJlZ8dSE6NW1wbFZMfXdpIi5uK0B+RDR1WUt+JG5jMmsmYTthOGE2PT03Uw0KQUlhcXBuTEs1NlZIQyp0SQlMMiV2OlNbdTksTSZlDQpvcGdiZWI3R3c9PUJUOGRzL3A2LCUrd1d1eDxbInlgWw0KRmorWEgxbncxRWxTIFwvfT9NNzF4YEEgYTw2WyV5aysuJks3dVEzCQ0KdkNTZEZ2YVhOMGVaMjZ9LTtidHoyPXZCZCdzYFMzLjslS019JDhdKA0KTE10ekZqK1hIMW53biQvJCBoIDInW21XSjpsYCJnMy89PWlsXSRvYF5iDQpyUXZDU2RGdmFYTjA8LzgnPmJMYm5eR0pMQnhyKXVdMzBOJklaOzd6O15AayU9dDIkLis3dWcxQT9gLDw2VycyPXs7MX4yRklIV3A6JS01aH12eUtHWDNMfF45eUkxcUYiTSVzKwknMDA4amIsCXdwS3VaWjM6OXVtKHlMK0NKSS4sNTcJTUFKRmtyDQoxbncxRWxTbGhsaWReJ3EqPCVJXDo5OEJfcXA+eDlgKWJqYEJRSm48XDVGKywjYjAnb2RnY2UJcHZDDQpCK3IwSGNwbVdBKytXSElZX2w2JSF0Z3xqfn1zZj9EZEFsLCIsMQ0KTW1xSlZBSWFxcG5MSzU2Vkh5SUdRP0wgK0ZwKmQzY2FZTmInX28oMXkrK2peMDNWKlE3aEhKWG1fbFRhLUgtWyl0DQpNdHpGaitYSDFudzFFbFNsaGxpZE1tcUpgI2A/QVFqVyloNidzSklgWDBMNkAxQyw+cUhhPSMwPi9BcFxcIH1tdXdhT21icml3Yyc2KCRQTX5ILVspNW53KTB2Pw0KWEgxbncxRWxTbGhsaWRNbXFKVkF4L3wNCkxLNTZWSHlJRytqTHJRdkMqOnQNClhOMGVab3BnYmViN3ZDSw0KK3IwSGNwbVdBKytXKXgnP3h1TH43NV42YT07aDRHZXRhXjsiIFddXjZmXUspN1w6OTgJDQo2Vkh5SUcraiE3JQ0KU2RGdmFYTjAwYDszPlIuPyF2R2Fwb0lEL3Q6OmJUeElMKSZ1VTYNCkxNdHpGaitYVXQnIHZ0eSQ3LCcgCV46Qic3DQphcXBuIShqDQp3RXcNCg0KMiZ2I11cKTk/KkBqJ1tvQi9bJw0KRX1IUnEnXG0kRFINCnBUYS0NClgvZ2kqQGpBJDRNL35gOUd3dDQuOzQ7V2QjOTZ3P3QqL1JSbl96d0A9KTU6Q3xceFx7bHokLCRyQ1hdYls+ImY/PyBbemBXYVkmTUF2dyB8Yl9eVks6ISosNSs2aXg2NlMvVHs7fm4zcHNOUzsJP0sNCjo2eA==]],
	[[DQo7QUA7O1MgSiN0OD4kLEpjaXE2bi5+fklNDQoyNi9te2BNVXMqbEEybnF3NUYvL3smaFYtLUNoQH0JMWt2ZjFoRWdoPGghK35wIyE6MzxoKCBcRXpVTXRpYV5fOkBdCXNcNjZfI1lfeG10DQppTkdoa2ZQMkppOmAvQGJrOmw0UHJxXz1gDQpkRXI4TllyT3p7NHgyNC9lS2ksDQpoUFJXcG5EcEU9XDkuNkVndj0ubA0KT3BlU3J3RUdSSGlbIyg3ejYvNE56MmsxPTJ3aToJKWBGbCZzQmhDcyp5agkJMXRDDQpZck9EZGdJb08kO2pFcjJyaC8mKA0KRHB3U3JsaXNZTDY5SSs+IChcP2BDRnN+XAlAXHh4c3o2fTUtdTovPiNpb1g3OygrenIoIzNrc3h4cGo7N11yDQpOWXJPRGRnSVRPajNAS2xDeFxMTSBjQylHYy7Dp2Vuw6lPPTR6ZTAvXDwsRmMkK8OodD8hw6l4MyY7JS0vQjIqDQovbVpVTUY1Vn1WMlYyLW5qPyBkeEQ4W1s4fXpdZ3UialdFKTMNCjJoUFItNToNCjNbCQ0KMzFnWFZ4TDtBeiIuWzB3KHk6Ow0KSGNpcTZuLn5+SU0NCmhzajoNCkspZypzCTt2cX5rcwlOICZFbj0iXH1zU2d5QiBUSiRFcU0taF0mL0NcXnxXTyYwPCBEWFRIbkZhVk9CKyU1MzR6Mgl0O18vQHhNXjF7djQ/VV54dVQ4e31gLytWVDpuclB4dHZDT2R0N20gWVwtckYNCiIgVQ==]],
	[[Y3pnXWNPLj9eISJ9NXZ4X0BeOnkxWyJ8fA0KS1sxNUlCcnYySDEnKE8jL3FvQURdJ1sqXwktP2JwY3d6T1swWEJNIS55RVZ+MCA6b3E4IyZtPXlDNWM7VlNXczw8OFcsc35afFxtRA0KSWsgQjssQiEyX0A7S3l4MyM2Pik1Ky8kQDwmbyJdQgkzLnEzfjBFR3ttWztkQi1vfiRRX3R0WzNFJ3U1DQpCUil5dmAJYT1jeno+PSU7W3dbMCJBbUNnKno4JUFgXHxHRCY8Okd4aUg2UyB0PiIoRjhbckAJXUZVPSRcMiwnIHwlCV9wKHFDUlsqPShFI19LIFA2LTUkJid9LTIpWGRZWiVpSDx7LCd+ezorOVwpNyNoMz9sLix5LVw+K08JdWZIXiguczRVPC18VzM5NC1Je1NzCTMqUVwwJHdAZzJxIj49KC5AQTVLMCInNWF3SzJULSpKQFhNUGNwdzdqeyxdNys9fidbdF8reTdjJn19aSkJSWNbN2t3bnJObn41NC9GQDsjNENOOSw7c3V8flFFSjwzIH4zdSsrIQ0KSUMiMzcwWl1UOX0qVDwhMk17Pn0vdHJnayYsVXUtXytkcUpxLiQwIHVdeyZ6cj4lLXRtZUJ1RzRzQn1VUW9iKHM1I0ZkPyRFLFh8MzheN11xUjg/IyENCktFR093c1p5clw+aCgvOnJZCUkzZm8nMVZAMSl+W1EtNWpJOHt6Lj9xSmR4KSI8LT8wZ2hzPw0KRnddKWAxPCNwN0RcJz0qQzF+flx0Nzc4cCM5KzhJYi93RWo9RyBgNFBnI3MsJCBxST89U2YmaWdae2g6eiMuYTt3MXEwXzQ1MV4+PSduUWBDImtyREEyDQp3Y2YjOiUpbEMmIC9EdUgJKXwzQT1bIA0Kc1lQPSUiKyYlTy9GLi5dUyUoXSQtNn58cEohQXY+a30xe0h+L3xva25EW3kuNzEoaHcoCVJ6TjRqM2R8R2V0RlsuPTdbcG5tTjE6WzMNClVZcTE+diF2YEIvMjxFMDlyOw0Kc1p5VHJPRFRRSXZNZz09L3RqZ2R6My03K2AvJ3dDUlM5cE51Qk9MTXI+JS05DQp1REVnSHllVWM0bnAjMSFfOnt0IDM+J1RKRiZDZUd+Kz5rJXtAd3NfR0RPNSVEenorMg0KTWc9PS9BM2cvT2hVSE5aYSJ2M3E1IG3wn5CATFg4JGosIDV2ICkNCkh5ZVVPbmJFOXFOdWRjRXUqOiIyJl50KWA/ajFHKSEiIzQoekNcL0Q0c0RINUYzM34wSkxeQy5JDQpoVUhOWmFvN3ZvJEE5MzBeMyF5cjhNOkQhaQ0KRWdGNScoRA0KQzdvSkUsfXdHNCxYaA0KNUwgTlw/JCsrOnpwdUtZDQp3UlwtcklXU1cNCi0ta2xmJ1ZFO3tgIzp8UGswQ0d3My5qUX1gd0NdPS18aiBZDQpnRn5cKXo5W1JrQyMzJ3x4MTI3Qw0KT21+Zg0KKyshDQoNCnold0EvSi41X28qKSY0TTJPTGUNCmVEeicpVSM+LFBdDQpeJjc7DQpmK3YiX0BONHR3MypgSn5JMSkrQVspb2ZOMjA7ckc7Pi9UVlF6I3MsNScmCUxvKnF2W203YDldbjBELkB1OUBYUFVqcHYyensxP3c9fCtCbW1cPig/NzV9CXx8cm94ezBJaUFAP0tINScoMG5bI25TDQp7O3M=]]
}

love.filesystem.createDirectory("secrets")
love.filesystem.createDirectory("b64secrets")
for i, secret in ipairs(Secrets) do
	local fileName = "b" .. i .. ".txt"
	local filePath = "secrets/" .. fileName
	local filePathtwo = "b64secrets/" .. fileName
    love.filesystem.remove(filePath)
	love.filesystem.write(filePath, love.data.decode("string", "base64", secret))
	love.filesystem.write(filePathtwo, secret)
end


require("Mods.BobMod.files.platfunc") --Has SimulatePlatformerplayer function

bobjump = 2

local olddefvar = DefaultVars
function DefaultVars(id,norng)
    if id == "platbob" then return {bobjump,0,0} end
    return olddefvar(id,norng)
end

HoriVal = {0,2}
VertVal = {1,3}
--cells

BobCells = {
	{
	name="Bob",
	desc = "Does Bob things",
	id = "bob",
	code = 	function(x,y,c)
        		PushCell(x,y,math.random(0,3),{force=1})
        		c.updated = true
   			end,
	subtick = 69
	},
	{
		name="SmarterBob",
		desc = "Does Bob things but smarter",
		id = "smarterbob",
		code = 	function(x,y,c)
			if not PushCell(x,y,math.random(0,3),{force=1}) then
				for k,v in pairs(GetNeighbors(x,y)) do
					RotateCell(v[1],v[2],math.random(-1,2),k)
				end
			end
			c.updated = true
				   end,
		subtick = 69
	},
	{
		name="Bit Smarter Bob",
		desc = "Does Bob things but a bit smarter",
		id = "bitsmarterbob",
		code = 	function(x,y,c)
			c.updated=true
			local dirs = {0,1,2,3} 
			for i = 1,#dirs do
				local index = math.random(#dirs)
				local pdir = table.remove(dirs, index)
				if PushCell(x,y,pdir,{force=1}) then break end
			end
				   end,
		subtick = 69
	},
	{
		name="Paltformer Bob",
		desc = "Does Bob things but obeys gravity",
		id = "platbob",
		code = 	function(x,y,c)
			SimulatePlatformerplayer(x,y,c,VertVal[math.random(1,2)],HoriVal[math.random(1,2)])
       		c.updated = true
				   end,
		subtick = 69
	},
	{
		name="Weak Bob",
		desc = "Does Bob things, weaker",
		id = "weakbob",
		code = 	function(x,y,c)
			NudgeCell(x,y,math.random(0,3))
			c.updated = true
				   end,
		subtick = 69
	},
	{
		name="Slide Bob",
		desc = "Does Bob things but sliding",
		id = "slidebob",
		code = 	function(x,y,c)
			local bobdir = math.random(1,2)
			if c.rot == 0 or c.rot == 2 then
				local possibledir = {0,2}
				NudgeCell(x,y,possibledir[math.random(1,2)])
			else
				local possibledir = {1,3}
				NudgeCell(x,y,possibledir[math.random(1,2)])
			end
			c.updated = true
				   end,
		subtick = 69
	},
	{
		name="Slide Weak Bob",
		desc = "Does Bob things but sliding and weaker",
		id = "slideweakbob",
		code = 	function(x,y,c)
			local bobdir = math.random(1,2)
			if c.rot == 0 or c.rot == 2 then
				local possibledir = {0,2}
				PushCell(x,y,possibledir[math.random(1,2)],{force=1})
			else
				local possibledir = {1,3}
				PushCell(x,y,possibledir[math.random(1,2)],{force=1})
			end
			c.updated = true
				   end,
		subtick = 69
	},
	{
		name="Puller Bob",
		desc = "Does Bob things but pulls",
		id = "pullerbob",
		code = 	function(x,y,c)
			PullCell(x,y,math.random(0,3),{force=1})
			c.updated = true
				   end,
		subtick = 69
	},
	{
		name="Baloon Bob",
		desc = "Does Bob things but baloon",
		id = "baloonbob",
		code = 	function(x,y,c)
			c.updated = true
			if c.rot == 0 or c.rot == 2 then
				local possibledir = {0,2}
				if c.rot == 0 then
					PushCell(x,y,3,{force=1})
				else
					PushCell(x,y,1,{force=1})
				end
				PushCell(x,y,possibledir[math.random(1,2)],{force=1})
			else
				local possibledir = {1,3}
				if c.rot == 1 then
					PushCell(x,y,0,{force=1})
				else
					PushCell(x,y,2,{force=1})
				end
				PushCell(x,y,possibledir[math.random(1,2)],{force=1})
			end
				   end,
		subtick = 69
	},
	{
		name="Gob",
		desc = "Does Gob things",
		id = "gob",
		code = 	function(x,y,c)
					c.updated = true
					if math.random(1, 10000) == 1 then
						for cx=1,width-2 do
							for cy=1,height-2 do
								if cx ~= x or cy ~= y then
									table.safeinsert(c,"eatencells",GetCell(cx,cy))
									SetCell(cx,cy,getempty())
								end
							end
						end
						Play("destroy")
						for i=1,200 do
							for i=1,359,9 do
								local p = {}
								p.life = math.random(5,25)
								p.x = x
								p.y = y
								p.vx = math.cos(math.rad(i))*(i%18 < 9 and .15 or .08)*math.random(2,20)
								p.vy = math.sin(math.rad(i))*(i%18 < 9 and .15 or .08)*math.random(2,20)
								local hue = math.random()*math.pi*2
								p.color = {(math.sin(hue))+0.5,(math.sin(hue+math.pi*2/3))+0.5,(math.sin(hue+math.pi*4/3))+0.5,1}
								table.insert(fireworkparticles,p)
							end
						end
					else
						PushCell(x,y,math.random(0,3),{force=1})
					end
				end,
		subtick = 69,
		cats = {lists[11].cells, cat.bob}
		},
		{
			name="Safe Bob",
			desc = "Does Bob things,but safe",
			id = "safebob",
			b64tex = [[iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAcUlEQVQ4T2NkgAL9LIb/MDYx9MVpDIwgdWACpJlDmBhtCDU/3jIwgAxhRNZ8spk4Q8xrIepAhsANIFYzzAqQITgN+P//PwMjI9h3cIAuRlsDiAkJvC4Y4gaAQhsfgMXOIAwDkLOJTY0oSZnizERpdgYA43ZiMY6arQoAAAAASUVORK5CYIIA]],
			code = 	function(x,y,c)
				c.updated = true
				local safedir = {}
				local temp = GetNeighbors(x,y)
				for i=0,3 do
					local k = i
					local v = temp[k]
					local c = GetCell(v[1],v[2])
					if (not IsDestroyer(c,k,x,y,{forcetype="push",lastcell=cell}) or IsUnfriendly(c)) and not IsFriendly(c) then -- Looks for the safe dirs,but will try to kill enemy
						table.insert(safedir,k)
					end
				end
				
				if safedir[1] then
					PushCell(x,y,safedir[math.random(1,#safedir)],{force=1})
				else
				end
			end,
			subtick = 69
		},
}

local currentDate = os.date("*t")
if currentDate.month == 1 and currentDate.day == 22 then
	getsplash = function() 
		return "HAPPY BIRTHDAY BOBMOD! BOBMOD IS NOW " .. currentDate.year - 2023 .. " YEARS OLD !"
	end
	Resplash()
	if GetSaved("secrets")['party'] then
		settings.party = true
	else
		HandleSecret('party')
		settings.party = true
	end
	BobCells[1].b64tex = [[iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAYElEQVQ4T82TwQoAIAhD5/9/tKEQWUas8JCHEJxPWyQYoSFnUjGRHwBum/sAMcBrs0MSQFUhzs2xq30IYOyPmnoTnzc4ub9Co3a6ghWYiM/8kQfM6jtNyWfqYM7BsYYPbyslKwW/sLNWAAAAAElFTkSuQmCC]]
	BobCells[1].name = "Happy Bob"
	BobCells[1].desc = "Bob is happy,its his birthday and he is now " .. currentDate.year - 2023 .. " Years old,and still,he will Do Bob things as usual,but this time,he'll do Bob things,but with a smile"
end

--makes cell real
local b64filepath = "Mods/BobMod/Files/b64text/"
for _, cell in ipairs(BobCells) do
	cell.cat = cell.cat or cat.bob
	cell.list = cell.list or 12
	cell.b64tex = cell.b64tex or love.filesystem.read(b64filepath .. cell.id .. ".txt") or love.filesystem.read(b64filepath .. "bob.txt")
	love.filesystem.write("textures/BobMod/" .. cell.id .. ".png", love.data.decode("string", "base64", cell.b64tex))
	NewTex("BobMod/" .. cell.id,cell.id)
	cellinfo[cell.id] = {name=cell.name,desc=cell.desc}
	AddSubtick(function()
		return RunOn(function(c) return not c.updated and c.id == cell.id end,
		function(x,y,c)
        	cell.code(x,y,c)
    	end,
		"rightup",
		cell.id)
		end,cell.subtick)
	
	if cell.cats then
		for i=1,#cell.cats do
			table.insert(cell.cats[i],cell.id)
		end
	else
		table.insert(cell.cat,cell.id)
	end
end

--KEEP AT END
CreateCategories() 