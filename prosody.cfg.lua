-- Enable HTTP
http_ports = { 5280 }

modules_enabled = {
    "roster"; -- Needed for basic functionality
    "saslauth";
    "tls";
    "dialback";
    "disco";
    "carbons";
    "pep";
    "private";
    "blocklist";
    "vcard4";
    "vcard_legacy";
    "version";
    "uptime";
    "time";
    "ping";
    "register";
    "admin_adhoc";

    "http";         -- Enables mod_http
    "http_health";  -- Optional health check endpoint
}

-- Optional: Allow all users to register
allow_registration = true
