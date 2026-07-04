import time
import requests
import subprocess
import base64

CIDER_HOST = "where cider located, should be local host and port"
API_TOKEN = "place your api token from cider here"
POLL_INTERVAL = 3

headers = {"apitoken": API_TOKEN} if API_TOKEN else {}
last_song = None

def notify(title, artist):
    clean_title = title.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace('"', "&quot;").replace("'", "&apos;")
    clean_artist = artist.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace('"', "&quot;").replace("'", "&apos;")
    
    xml_payload = f'<toast><visual><binding template="ToastGeneric"><text>Now Playing</text><text>{clean_title} by {clean_artist}</text></binding></visual></toast>'
    
    script = f"""
    [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
    [Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] | Out-Null
    $xml = [Windows.Data.Xml.Dom.XmlDocument]::new()
    $xml.LoadXml('{xml_payload}')
    $toast = [Windows.UI.Notifications.ToastNotification]::new($xml)
    [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier('{{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}}\\WindowsPowerShell\\v1.0\\powershell.exe').Show($toast)
    """
    
    encoded_script = base64.b64encode(script.encode('utf-16-le')).decode('utf-8')
    subprocess.run(["powershell", "-EncodedCommand", encoded_script], capture_output=True, creationflags=subprocess.CREATE_NO_WINDOW)

def get_now_playing():
    try:
        r = requests.get(f"{CIDER_HOST}/api/v1/playback/now-playing", headers=headers, timeout=3)
        if r.status_code == 200:
            return r.json().get("info")
    except requests.exceptions.ConnectionError:
        pass
    return None

while True:
    info = get_now_playing()
    if info:
        song_id = info.get("playParams", {}).get("id")
        if song_id and song_id != last_song:
            last_song = song_id
            title = info.get("name", "Unknown")
            artist = info.get("artistName", "Unknown")
            notify(title, artist)
    time.sleep(POLL_INTERVAL)
