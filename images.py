import os, subprocess, requests
from bs4 import BeautifulSoup as bs

def save_img_different_pages(URL, total, folder):
    # Create Folder
    count = 1
    temp = f'./Images/{folder}'
    while os.path.exists(temp):
        temp = f"./Images/{folder} - {count}"
        count += 1
    path = temp

    subprocess.run(f"mkdir -p '{path}'", shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

    # Images List
    images = []

    # Defining headers so that the server thinks the request is from normal browser
    headers = {"User-Agent": "Mozilla/5.0"}

    for i in range(1, total+1) :
        if URL.endswith('/') :                                    # Change url logic according to the website
            url = f"{URL}gallery-page-{i}"
        else :
            url = f"{URL}/gallery-page-{i}"

        # Sending request and getting html output
        response = requests.get(url=url, headers=headers)         # Returns 200 if Ok (e.g., <Response [200]>)
        response = bs(response.text, "html.parser")

        for img in response.select("div a img"):                  # Change according to web-page
            img_link = img['src']  # Sometimes img['href']
            if img_link and img_link.lower().endswith((".jpg", ".jpeg", ".png", ".gif", ".webp", ".avif")) :
                ext = img_link.split('.')[-1]
                filename = f"{folder} - {i}.{ext}"
                subprocess.run(f'curl -L "{img_link}" -o "{filename}"', shell=True, cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
                print(f"Image - {i} downloaded successfully : {filename}")

    print(f"Image Folder : {path}/{filename}")
    subprocess.run(f"sleep 3; open '{path}'", shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)


def save_img_same_page(url, folder):
    # Create Folder
    count = 1
    temp = f'./Images/{folder}'
    while os.path.exists(temp):
        temp = f"./Images/{folder} - {count}"
        count += 1
    path = temp

    subprocess.run(f"mkdir -p '{path}'", shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

    # Images List
    images = []

    # Defining headers so that the server thinks the request is from normal browser
    headers = {"User-Agent": "Mozilla/5.0"}

    # Sending request and getting html output
    response = requests.get(url=url, headers=headers)                # Returns 200 if Ok (e.g., <Response [200]>)
    response = bs(response.text, "html.parser")

    count = 1
    for img in response.select("main article div p img"):     # Change according to web-page
        img_link = img['src']  # Sometimes img['href']
        if img_link and img_link.lower().endswith((".jpg", ".jpeg", ".png", ".gif", ".webp", ".avif")) :
            #print(img_link)
            ext = img_link.split('.')[-1]
            filename = f"{folder} - {count}.{ext}"
            subprocess.run(f'curl -L "{img_link}" -o "{filename}"', shell=True, cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            print(f"Image - {count} downloaded successfully : {filename}")
            count += 1

    subprocess.run(f"sleep 3; open '{path}'", shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)



cond = input("Are all images present on same web page (Y/n) : ")

if (cond.lower() == 'y' or cond.lower() == 'yes'):
    URL = input("Enter the main page url : ").strip()
    folder = input("Enter folder name for downloaded images : ")
    save_img_same_page(URL, folder)


else :
    URL = input("Enter the main page url (which do not have ***/gallery-page-1) : ").strip()
    total = int(input("Enter total number of images (only integers like - 1, 2, . . . 100, 101, . . .) : "))
    folder = input("Enter folder name for downloaded images : ")
    save_img_different_pages(URL, total, folder)


"""
import cloudscraper

scraper = cloudscraper.create_scraper()
html = scraper.get("<link>").text
print(html[:500])  # Preview

"""
