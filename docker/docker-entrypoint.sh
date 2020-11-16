#!/bin/bash
echo "Start videoqualityanalysis AI module"
/opt/video-quality-prediction/dist/video-quality-analysis  /opt/video-quality-prediction/dist/ &

echo "Update API documentation"

python3 /opt/data_manager/swagger.py &
chmod +x /opt/videoqualityprobe_live/Release/videoqualityprobe
chmod +x /opt/videoqualityprobe_vod/Release/videoqualityprobe
echo "Run API"
cd /opt/data_manager/
# Issues when workers are less than 4. 10000 requests to handle playlists and 28800 seconds (8 hours) to upload files
gunicorn --worker-class=gevent --workers 4 --max-requests 10000 --graceful-timeout 5 --timeout 28800 --bind 0.0.0.0:${API_PORT} wsgi:application

exec "$@"

