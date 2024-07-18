ws = http.websocket("ws://<IP>:<PORT>")
while true do
    ws.send(">")
    command = tostring(ws.receive())
    ran = shell.run(command)
    ws.send(tostring(ran))
end
