
fx_version("cerulean")
games({ "gta5" })
lua54("yes")
client_script("@sandbox-base/components/cl_error.lua")
client_script("@sandbox-pwnzor/client/check.lua")

client_scripts({
	"client/**/*.lua",
})

ui_page("ui/dist/index.html")
files({ "ui/dist/index.html", "ui/dist/*.png", "ui/dist/*.js", "ui/dist/*.ttf" })
