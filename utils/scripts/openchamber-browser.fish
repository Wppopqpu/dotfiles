#!/usr/bin/env fish

set -l url http://127.0.0.1:3000

if not curl --fail --silent --max-time 1 "$url/health" >/dev/null
    openchamber --port 3000

    for _ in (seq 1 30)
        if curl --fail --silent --max-time 1 "$url/health" >/dev/null
            break
        end
        sleep 1
    end

    if not curl --fail --silent --max-time 1 "$url/health" >/dev/null
        echo "OpenChamber did not start at $url" >&2
        exit 1
    end
end

exec firefox --new-instance -P openchamber --kiosk "$url/"
