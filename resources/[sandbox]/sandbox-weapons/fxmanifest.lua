
game("gta5")
lua54("yes")
fx_version("cerulean")
description("Stop Panda Fucking Complaining Like a Bitch")

client_script("@sandbox-base/components/cl_error.lua")
client_script("@sandbox-pwnzor/client/check.lua")

client_scripts({
	"client/**/*.lua",
})

server_scripts({
	"server/**/*.lua",
})
