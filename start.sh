#!/bin/bash
cd ./react_fe 
pm2 serve ./build 3000 --name 'react' --spa
# npm start

cd ../backend
pm2 start src/index.js --name 'backend'
# npm start

cd ../crawl-cd
pm2 start main.py --name 'crawl-server'
# WSL
# source myenv/bin/activate
# python3 main.py

cd ../ai
pm2 start main.py --name 'ai-server'
# py manage.py runserver
