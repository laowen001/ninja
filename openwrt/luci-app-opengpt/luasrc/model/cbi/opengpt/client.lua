local m, s

m = Map("opengpt", translate("OpenGPT"))
m.description = translate("<a>A unofficial ChatGPT proxy (bypass Cloudflare 403 Access Denied)</a> | <a href=\"https://github.com/gngpp/nas-opengpt\" target=\"_blank\">Project GitHub URL</a>")

m:section(SimpleSection).template = "opengpt/opengpt_status"

s = m:section(TypedSection, "opengpt")
s.addremove = false
s.anonymous = true

o = s:option(Flag, "enabled", translate("Enabled"))
o.rmempty = false

o = s:option(Value, "level", translate("Log Level"), translate("info/debug/warn/trace/error"))
o.rmempty = "info"

o = s:option(Value, "host", translate("Host"))
o.default = "0.0.0.0"
o.datatype = "ipaddr"

o = s:option(Value, "port", translate("Port"))
o.datatype = "and(port,min(1))"
o.default = "7999"

o = s:option(Value, "workers", translate("Workers"))
o.default = "1"

o = s:option(Value, "proxy", translate("Proxy"))

o = s:option(Value, "tcp_keepalive", translate("TCP Keep-Alive"))
o.default = "5"

o = s:option(Value, "tls_cert", translate("TLS certificate file path"))

o = s:option(Value, "tls_key", translate("TLS private key file path"))

o = s:option(Value, "sign_secret_key", translate("API Signature Secret Key"))

o = s:option(Flag, "tb_enable", translate("Enable Token Bucket Limit"))
o.rmempty = false

o = s:option(Value, "tb_store_strategy", translate("Token Bucket Storage Strategy"), translate("Token bucket storage strategy, memory/redis"))

o = s:option(Value, "tb_capacity", translate("Token Bucket Capacity"), translate("Token bucket capacity, the default is 60"))

o = s:option(Value, "tb_fill_rate", translate("Token Bucket Fill Rate"), translate("Token bucket fill rate, the default is 1"))

o = s:option(Value, "tb_expired", translate("Token Bucket Expired"), translate("Token bucket expired time, the default is 86400 seconds"))

return m