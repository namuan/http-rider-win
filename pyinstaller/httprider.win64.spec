#!/usr/bin/env python3
# -*- mode: python -*-

import os
import sys
import PyQt5

block_cipher = None

a = Analysis(['..\\httprider\\bin\\app'],
             pathex=[
                  os.path.join(sys.modules['PyQt5'].__path__[0], 'Qt', 'bin'),
                  'C:\\Program Files (x86)\\Windows Kits\\10\\Redist\\ucrt\\DLLs\\x64',
                 '..\\httprider'
             ],
             binaries=[],
             datas=[],
             hiddenimports=[],
             hookspath=[],
             runtime_hooks=[],
             excludes=['numpy'],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher)

pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)

exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          name='httprider',
          debug=False,
          strip=False,
          upx=False,
          console=False , icon='..\\httprider\\resources\\icons\\httprider.ico')