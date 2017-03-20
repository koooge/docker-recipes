#!/bin/bash

export HUBOT_IRC_SERVER=irc.ircnet.ne.jp
export HUBOT_IRC_ROOMS=#kooogedev
export HUBOT_IRC_NICK=hubot
export HUBOT_IRC_SEND_NOTICE_MODE=true
export HUBOT_IRC_UNFLOOD=true
export HUBOT_IRC_DEBUG=true

bin/hubot -a irc
