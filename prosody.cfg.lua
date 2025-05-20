-- Enable HTTP
http_ports = { 5280 }
consider_bosh_secure = true;
cross_domain_bosh = false;
modules_enabled = {
    "roster"; "saslauth"; "tls"; "dialback"; "disco"; "carbons";
    "pep"; "private"; "blocklist"; "vcard4"; "vcard_legacy";
    "version"; "uptime"; "time"; "ping"; "register"; "admin_adhoc";
	"websocket";
    "http";         -- Enables mod_http
    "http_health";  `-- Optional health check endpoint
}

-- Allow all users to register (optional)
allow_registration = true

-- Main virtual host for clients
VirtualHost "meet.jitsi"
    authentication = "anonymous"
   

-- Auth domain for services (focus, jvb)
VirtualHost "auth.meet.jitsi"
    authentication = "internal_hashed"

-- Optional if using JWT or secure domain: authentication = "token" or "internal_hashed"
VirtualHost "meet.jitsi"
    authentication = "token"
    app_id = "owp-jitsi"
    app_secret = "1234aa"
    allow_empty_token = false

-- Internal MUC for services like Jicofo
Component "internal-muc.meet.jitsi" "muc"
    storage = "memory"
    modules_enabled = { "ping" }
    admins = { "focus@auth.meet.jitsi" }
    muc_room_locking = false
    muc_room_default_public_jids = true

-- Public MUC component
Component "muc.meet.jitsi" "muc"
    storage = "memory"
    modules_enabled = { "ping" }
    muc_room_locking = false
    muc_room_default_public_jids = true

-- Optional breakout/lobby/stats components (depends on your deployment)
-- Component "conference.meet.jitsi" "muc"
-- Component "speakerstats.meet.jitsi" "speakerstats_component"
-- Component "conferenceduration.meet.jitsi" "conference_duration_component"
