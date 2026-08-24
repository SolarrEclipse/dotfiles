hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	name = "float-spotify",
	match = { initial_class = "Spotify" },
	size = { 1280, 720 },
	center = true, float = true, })

hl.window_rule({
	name = "float-discord",
	match = { initial_class = "discord" },
	size = { 1280, 720 },
	center = true,
	float = true,
})

hl.window_rule({
	name = "float-nautilus",
	match = { initial_class = "org.gnome.Nautilus" },
	size = { 1280, 720 },
	center = true,
	float = true,
})

hl.window_rule({
	name = "desktop-portal",
	match = { initial_class = "xdg-desktop-portal-gtk" },
	size = { 1270, 720 },
	center = true,
	float = true,
})

hl.window_rule({
	name = "swayimg",
	match = { initial_class = "swayimg" },
	size = { 1400, 720 },
	center = true,
	float = true,
})

hl.window_rule({
	name = "march-installer",
	match = { initial_class = "march-installer" },
	size = { 1100, 600 },
	center = true,
	float = true,
})
