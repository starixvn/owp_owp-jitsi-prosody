-- Force Prosody to use only IPv4
network_default_interface = "0.0.0.0"
use_ipv6 = false

-- Ensure that IPv6 is disabled in network settings
network_settings = {
    ipv6 = false;
}
