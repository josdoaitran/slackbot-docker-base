import logging
import os

# This is a minimal configuration to get you started with the Text mode.
# If you want to connect Errbot to chat microservices, checkout
# the options in the more complete config-template.py from here:
# https://raw.githubusercontent.com/errbotio/errbot/master/errbot/config-template.py

LOG_DIR='/err/logs/' + os.environ['HOSTNAME']
if not os.path.exists(LOG_DIR):
    os.makedirs(LOG_DIR)
BACKEND = 'Slack'
BOT_DATA_DIR = r'/err/data'
BOT_EXTRA_PLUGIN_DIR = r'/err/local_plugins'
BOT_EXTRA_BACKEND_DIR = r'/err/local_backends'
BOT_LOG_FILE = r'/err/logs/' + os.environ['HOSTNAME'] + '/botlog'
BOT_LOG_LEVEL = logging.DEBUG
BOT_IDENTITY = {}
BOT_IDENTITY['token'] = ''
# BOT_ADMINS = tuple(os.environ['bot_admin'].split(','))
BOT_ADMINS = ('@aaa','@bbb', '@dddd', )
CHATROOM_PRESENCE = ()


