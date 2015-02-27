#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals
import os

AUTHOR = u'The GSBS Boostrappers'
SITENAME = u'Sneakers'
SITEURL = ''

PATH = 'content'

SITEURL = '.'

TIMEZONE = 'America/New_York'

DEFAULT_LANG = u'en'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

# Blogroll
LINKS = (
    ('UMMSBioinfo', 'http://bioinfo.umassmed.edu'),
    ('Biostars', 'http://biostars.org/'),
)

# Social widget
SOCIAL = (('github', 'https://github.com/GSBS-Bootstrappers/'),
          ('Another social link', '#'),)

DEFAULT_PAGINATION = False

# Uncomment following line if you want document-relative URLs when developing
#RELATIVE_URLS = True

# Theme to use to produce the output. Can be a relative or absolute path to a 
# theme folder
this_directory = os.path.dirname(os.path.abspath(__file__))

THEME = os.path.join(this_directory,  'theme', 'pelican-bootstrap3')

# Destination directory in the output path where Pelican will place the files
# collected from THEME_STATIC_PATHS. Default is theme.
THEME_STATIC_DIR = 'theme'	

OUTPUT_PATH = os.path.join(os.path.split(this_directory)[0], 'blog')

# Static theme paths you want to copy. Default value is static, but if your 
# theme has other static paths, you can put them here. If files or directories 
# with the same names are included in the paths defined in this settings, they 
# will be progressively overwritten.
THEME_STATIC_PATHS = ['static']	

#Specify the CSS file you want to load.
#CSS_FILE = 'main.css'

PYGMENTS_STYLE = 'colorful'