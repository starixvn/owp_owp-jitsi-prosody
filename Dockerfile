FROM hub.nexdev.net/base/jitsi/prosody:prosody-13.0.1

COPY ipv4-only.cfg.lua /defaults/conf.d/ipv4-only.cfg.lua

COPY prosody.cfg.lua /etc/prosody/prosody.cfg.lua

ENV JICOFO_AUTH_USER=focus \
    JICOFO_AUTH_PASSWORD=1234aa \
    JVB_AUTH_USER=jvb \
    JVB_AUTH_PASSWORD=1234aa \
    XMPP_DOMAIN=meet.jitsi \
    XMPP_AUTH_DOMAIN=auth.meet.jitsi \
    XMPP_MUC_DOMAIN=muc.meet.jitsi \
    XMPP_INTERNAL_MUC_DOMAIN=internal-muc.auth.meet.jitsi

EXPOSE 5222 5280
