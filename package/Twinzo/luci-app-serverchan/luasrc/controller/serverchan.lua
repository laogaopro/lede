module("luci.controller.serverchan",package.seeall)
function index()
if not nixio.fs.access("/etc/config/serverchan") then
	return
end
entry({"admin","services","serverchan"},alias("admin","services","serverchan","serverchan"),_("微信推送"),30).dependent=true
entry({"admin","services","serverchan","serverchan"},cbi("serverchan/serverchan"),_("通用设置"),10).leaf=true
if nixio.fs.access("/etc/config/serverchan_custom") then
	entry({"admin","services","serverchan","custom"},cbi("serverchan/custom"),_("自定义消息"),30).leaf=true
end
entry({"admin","services","serverchan","status"},call("act_status")).leaf=true
end

function act_status()
  local e={}
  e.running=luci.sys.call("pgrep -f serverchan/serverchan >/dev/null")==0
  luci.http.prepare_content("application/json")
  luci.http.write_json(e)
end