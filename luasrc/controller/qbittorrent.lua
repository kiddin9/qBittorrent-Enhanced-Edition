-- Licensed to the public under the Apache License 2.0.

module("luci.controller.qbittorrent",package.seeall)

function index()
	if not nixio.fs.access("/etc/config/qbittorrent") then
		return
	end
	entry({"admin", "nas"}, firstchild(), _("NAS"), 45).dependent = false
	entry({"admin", "nas", "qbittorrent"}, view("qbittorrent"), _("qBittorrent")).acl_depends = { "luci-app-qbittorrent" }
end
