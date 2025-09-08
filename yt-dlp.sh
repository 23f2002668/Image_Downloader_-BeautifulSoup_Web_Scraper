#!/usr/local/bin/bash
# Activate Python Virtual ENV which have installed yt-dlp
source /Users/shahzadamoon/python_envs/myenv/bin/activate



# ********************************************************** Information ***********************************************************************************


# Install Latest version of yt-dlp : pip3 install yt-dlp (If installing in script, then  -->   python3 -C pip3 install yt-dlp)
# Move yt-dlp into 'User Installed Package Directory' (/usr/local/bin) [If installing from github / manually] : sudo mv yt-dlp /usr/local/bin/yt-dlp
# Verify installation : yt-dlp --version
# Upgrade yt-dlp (Also in case of not installing latest version) : pip3 install --upgrade yt-dlp


# *************************************************************************** Python ***********************************************************************


get_proxy() {
export PROXY=$(python3 <<END_PYTHON

import os, requests
from bs4 import BeautifulSoup as bs

country = os.getenv("country")

def code(country):
    codes = [
                {"name": "Afghanistan", "code": "AF"},
                {"name": "Åland Islands", "code": "AX"},
                {"name": "Albania", "code": "AL"},
                {"name": "Algeria", "code": "DZ"},
                {"name": "American Samoa", "code": "AS"},
                {"name": "AndorrA", "code": "AD"},
                {"name": "Angola", "code": "AO"},
                {"name": "Anguilla", "code": "AI"},
                {"name": "Antarctica", "code": "AQ"},
                {"name": "Antigua and Barbuda", "code": "AG"},
                {"name": "Argentina", "code": "AR"},
                {"name": "Armenia", "code": "AM"},
                {"name": "Aruba", "code": "AW"},
                {"name": "Australia", "code": "AU"},
                {"name": "Austria", "code": "AT"},
                {"name": "Azerbaijan", "code": "AZ"},
                {"name": "Bahamas", "code": "BS"},
                {"name": "Bahrain", "code": "BH"},
                {"name": "Bangladesh", "code": "BD"},
                {"name": "Barbados", "code": "BB"},
                {"name": "Belarus", "code": "BY"},
                {"name": "Belgium", "code": "BE"},
                {"name": "Belize", "code": "BZ"},
                {"name": "Benin", "code": "BJ"},
                {"name": "Bermuda", "code": "BM"},
                {"name": "Bhutan", "code": "BT"},
                {"name": "Bolivia", "code": "BO"},
                {"name": "Bosnia and Herzegovina", "code": "BA"},
                {"name": "Botswana", "code": "BW"},
                {"name": "Bouvet Island", "code": "BV"},
                {"name": "Brazil", "code": "BR"},
                {"name": "British Indian Ocean Territory", "code": "IO"},
                {"name": "Brunei Darussalam", "code": "BN"},
                {"name": "Bulgaria", "code": "BG"},
                {"name": "Burkina Faso", "code": "BF"},
                {"name": "Burundi", "code": "BI"},
                {"name": "Cambodia", "code": "KH"},
                {"name": "Cameroon", "code": "CM"},
                {"name": "Canada", "code": "CA"},
                {"name": "Cape Verde", "code": "CV"},
                {"name": "Cayman Islands", "code": "KY"},
                {"name": "Central African Republic", "code": "CF"},
                {"name": "Chad", "code": "TD"},
                {"name": "Chile", "code": "CL"},
                {"name": "China", "code": "CN"},
                {"name": "Christmas Island", "code": "CX"},
                {"name": "Cocos (Keeling) Islands", "code": "CC"},
                {"name": "Colombia", "code": "CO"},
                {"name": "Comoros", "code": "KM"},
                {"name": "Congo", "code": "CG"},
                {"name": "Congo, The Democratic Republic of the", "code": "CD"},
                {"name": "Cook Islands", "code": "CK"},
                {"name": "Costa Rica", "code": "CR"},
                {"name": "Cote D\"Ivoire", "code": "CI"},
                {"name": "Croatia", "code": "HR"},
                {"name": "Cuba", "code": "CU"},
                {"name": "Cyprus", "code": "CY"},
                {"name": "Czech Republic", "code": "CZ"},
                {"name": "Denmark", "code": "DK"},
                {"name": "Djibouti", "code": "DJ"},
                {"name": "Dominica", "code": "DM"},
                {"name": "Dominican Republic", "code": "DO"},
                {"name": "Ecuador", "code": "EC"},
                {"name": "Egypt", "code": "EG"},
                {"name": "El Salvador", "code": "SV"},
                {"name": "Equatorial Guinea", "code": "GQ"},
                {"name": "Eritrea", "code": "ER"},
                {"name": "Estonia", "code": "EE"},
                {"name": "Ethiopia", "code": "ET"},
                {"name": "Falkland Islands (Malvinas)", "code": "FK"},
                {"name": "Faroe Islands", "code": "FO"},
                {"name": "Fiji", "code": "FJ"},
                {"name": "Finland", "code": "FI"},
                {"name": "France", "code": "FR"},
                {"name": "French Guiana", "code": "GF"},
                {"name": "French Polynesia", "code": "PF"},
                {"name": "French Southern Territories", "code": "TF"},
                {"name": "Gabon", "code": "GA"},
                {"name": "Gambia", "code": "GM"},
                {"name": "Georgia", "code": "GE"},
                {"name": "Germany", "code": "DE"},
                {"name": "Ghana", "code": "GH"},
                {"name": "Gibraltar", "code": "GI"},
                {"name": "Greece", "code": "GR"},
                {"name": "Greenland", "code": "GL"},
                {"name": "Grenada", "code": "GD"},
                {"name": "Guadeloupe", "code": "GP"},
                {"name": "Guam", "code": "GU"},
                {"name": "Guatemala", "code": "GT"},
                {"name": "Guernsey", "code": "GG"},
                {"name": "Guinea", "code": "GN"},
                {"name": "Guinea-Bissau", "code": "GW"},
                {"name": "Guyana", "code": "GY"},
                {"name": "Haiti", "code": "HT"},
                {"name": "Heard Island and Mcdonald Islands", "code": "HM"},
                {"name": "Holy See (Vatican City State)", "code": "VA"},
                {"name": "Honduras", "code": "HN"},
                {"name": "Hong Kong", "code": "HK"},
                {"name": "Hungary", "code": "HU"},
                {"name": "Iceland", "code": "IS"},
                {"name": "India", "code": "IN"},
                {"name": "Indonesia", "code": "ID"},
                {"name": "Iran, Islamic Republic Of", "code": "IR"},
                {"name": "Iraq", "code": "IQ"},
                {"name": "Ireland", "code": "IE"},
                {"name": "Isle of Man", "code": "IM"},
                {"name": "Israel", "code": "IL"},
                {"name": "Italy", "code": "IT"},
                {"name": "Jamaica", "code": "JM"},
                {"name": "Japan", "code": "JP"},
                {"name": "Jersey", "code": "JE"},
                {"name": "Jordan", "code": "JO"},
                {"name": "Kazakhstan", "code": "KZ"},
                {"name": "Kenya", "code": "KE"},
                {"name": "Kiribati", "code": "KI"},
                {"name": "Democratic People's Republic of Korea (North Korea)", "code": "KP"},
                {"name": "The Republic of Korea (South Korea)", "code": "KR"},
                {"name": "Kuwait", "code": "KW"},
                {"name": "Kyrgyzstan", "code": "KG"},
                {"name": "Lao People\"S Democratic Republic", "code": "LA"},
                {"name": "Latvia", "code": "LV"},
                {"name": "Lebanon", "code": "LB"},
                {"name": "Lesotho", "code": "LS"},
                {"name": "Liberia", "code": "LR"},
                {"name": "Libyan Arab Jamahiriya", "code": "LY"},
                {"name": "Liechtenstein", "code": "LI"},
                {"name": "Lithuania", "code": "LT"},
                {"name": "Luxembourg", "code": "LU"},
                {"name": "Macao", "code": "MO"},
                {"name": "Macedonia, The Former Yugoslav Republic of", "code": "MK"},
                {"name": "Madagascar", "code": "MG"},
                {"name": "Malawi", "code": "MW"},
                {"name": "Malaysia", "code": "MY"},
                {"name": "Maldives", "code": "MV"},
                {"name": "Mali", "code": "ML"},
                {"name": "Malta", "code": "MT"},
                {"name": "Marshall Islands", "code": "MH"},
                {"name": "Martinique", "code": "MQ"},
                {"name": "Mauritania", "code": "MR"},
                {"name": "Mauritius", "code": "MU"},
                {"name": "Mayotte", "code": "YT"},
                {"name": "Mexico", "code": "MX"},
                {"name": "Micronesia, Federated States of", "code": "FM"},
                {"name": "Moldova, Republic of", "code": "MD"},
                {"name": "Monaco", "code": "MC"},
                {"name": "Mongolia", "code": "MN"},
                {"name": "Montserrat", "code": "MS"},
                {"name": "Morocco", "code": "MA"},
                {"name": "Mozambique", "code": "MZ"},
                {"name": "Myanmar", "code": "MM"},
                {"name": "Namibia", "code": "NA"},
                {"name": "Nauru", "code": "NR"},
                {"name": "Nepal", "code": "NP"},
                {"name": "Netherlands", "code": "NL"},
                {"name": "Netherlands Antilles", "code": "AN"},
                {"name": "New Caledonia", "code": "NC"},
                {"name": "New Zealand", "code": "NZ"},
                {"name": "Nicaragua", "code": "NI"},
                {"name": "Niger", "code": "NE"},
                {"name": "Nigeria", "code": "NG"},
                {"name": "Niue", "code": "NU"},
                {"name": "Norfolk Island", "code": "NF"},
                {"name": "Northern Mariana Islands", "code": "MP"},
                {"name": "Norway", "code": "NO"},
                {"name": "Oman", "code": "OM"},
                {"name": "Pakistan", "code": "PK"},
                {"name": "Palau", "code": "PW"},
                {"name": "Palestinian Territory, Occupied", "code": "PS"},
                {"name": "Panama", "code": "PA"},
                {"name": "Papua New Guinea", "code": "PG"},
                {"name": "Paraguay", "code": "PY"},
                {"name": "Peru", "code": "PE"},
                {"name": "Philippines", "code": "PH"},
                {"name": "Pitcairn", "code": "PN"},
                {"name": "Poland", "code": "PL"},
                {"name": "Portugal", "code": "PT"},
                {"name": "Puerto Rico", "code": "PR"},
                {"name": "Qatar", "code": "QA"},
                {"name": "Reunion", "code": "RE"},
                {"name": "Romania", "code": "RO"},
                {"name": "Russian Federation", "code": "RU"},
                {"name": "RWANDA", "code": "RW"},
                {"name": "Saint Helena", "code": "SH"},
                {"name": "Saint Kitts and Nevis", "code": "KN"},
                {"name": "Saint Lucia", "code": "LC"},
                {"name": "Saint Pierre and Miquelon", "code": "PM"},
                {"name": "Saint Vincent and the Grenadines", "code": "VC"},
                {"name": "Samoa", "code": "WS"},
                {"name": "San Marino", "code": "SM"},
                {"name": "Sao Tome and Principe", "code": "ST"},
                {"name": "Saudi Arabia", "code": "SA"},
                {"name": "Senegal", "code": "SN"},
                {"name": "Serbia and Montenegro", "code": "CS"},
                {"name": "Seychelles", "code": "SC"},
                {"name": "Sierra Leone", "code": "SL"},
                {"name": "Singapore", "code": "SG"},
                {"name": "Slovakia", "code": "SK"},
                {"name": "Slovenia", "code": "SI"},
                {"name": "Solomon Islands", "code": "SB"},
                {"name": "Somalia", "code": "SO"},
                {"name": "South Africa", "code": "ZA"},
                {"name": "South Georgia and the South Sandwich Islands", "code": "GS"},
                {"name": "Spain", "code": "ES"},
                {"name": "Sri Lanka", "code": "LK"},
                {"name": "Sudan", "code": "SD"},
                {"name": "Suriname", "code": "SR"},
                {"name": "Svalbard and Jan Mayen", "code": "SJ"},
                {"name": "Swaziland", "code": "SZ"},
                {"name": "Sweden", "code": "SE"},
                {"name": "Switzerland", "code": "CH"},
                {"name": "Syrian Arab Republic", "code": "SY"},
                {"name": "Taiwan", "code": "TW"},
                {"name": "Tajikistan", "code": "TJ"},
                {"name": "Tanzania, United Republic of", "code": "TZ"},
                {"name": "Thailand", "code": "TH"},
                {"name": "Timor-Leste", "code": "TL"},
                {"name": "Togo", "code": "TG"},
                {"name": "Tokelau", "code": "TK"},
                {"name": "Tonga", "code": "TO"},
                {"name": "Trinidad and Tobago", "code": "TT"},
                {"name": "Tunisia", "code": "TN"},
                {"name": "Turkey", "code": "TR"},
                {"name": "Turkmenistan", "code": "TM"},
                {"name": "Turks and Caicos Islands", "code": "TC"},
                {"name": "Tuvalu", "code": "TV"},
                {"name": "Uganda", "code": "UG"},
                {"name": "Ukraine", "code": "UA"},
                {"name": "United Arab Emirates", "code": "AE"},
                {"name": "United Kingdom", "code": "GB"},
                {"name": "United States of America", "code": "US"},
                {"name": "United States Minor Outlying Islands", "code": "UM"},
                {"name": "Uruguay", "code": "UY"},
                {"name": "Uzbekistan", "code": "UZ"},
                {"name": "Vanuatu", "code": "VU"},
                {"name": "Venezuela", "code": "VE"},
                {"name": "Viet Nam", "code": "VN"},
                {"name": "Virgin Islands, British", "code": "VG"},
                {"name": "Virgin Islands, U.S.", "code": "VI"},
                {"name": "Wallis and Futuna", "code": "WF"},
                {"name": "Western Sahara", "code": "EH"},
                {"name": "Yemen", "code": "YE"},
                {"name": "Zambia", "code": "ZM"},
                {"name": "Zimbabwe", "code": "ZW"}
            ]

    for i in codes :
        if i["name"] == country :
            return i["code"]
        else :
            # Try if the full country name is not provided like 'Hong' instead of 'Hong Kong'
            if country in i["name"] :
                return i["code"]

    return "No country found !"

def proxy(country):
    type = "socks5"
    # country="IN"
    anonymity = 4  # Very high, i.e., it will completely hide our system IP and it is very hard to detect our server IP

    # Initialising URL
    url = f"https://www.freeproxy.world/?type={type}&anonymity={anonymity}&country={country}&speed=&port=&page=1"
    #print(url)

    # Defining headers so that the server thinks the request is from normal browser
    headers = {"User-Agent": "Mozilla/5.0"}

    # Sending request and getting html output
    response = requests.get(url=url, headers=headers)  # Returns 200 if Ok (e.g., <Response [200]>)
    response = bs(response.text, "html.parser")

    proxies, proxy = [], {}
    for row in response.select("table tbody tr"):
        cols = row.find_all("td")
        if len(cols) >= 7:
            proxy = {
                "ip": cols[0].text.strip(),
                "port": cols[1].text.strip(),
                "country": cols[2].text.strip(),
                "city": cols[3].text.strip(),
                "speed": cols[4].text.strip(),
                "type": cols[5].text.strip(),
                "anonymity": cols[6].text.strip(),
                "last_check": cols[7].text.strip(),
            }

            proxies.append(proxy)

    best_proxy = f"{proxies[0]['type']}://{proxies[0]['ip']}:{proxies[0]['port']}"
    best_speed = int(proxies[0]['speed'].split(" ")[0])

    for proxy in proxies:
        if int(proxy['speed'].split(" ")[0]) < best_speed:          # Proxy with least latency rate is the best as it takes minimum time to respond as compare to other proxies.
            best_speed = int(proxy['speed'].split(" ")[0])
            best_proxy = f"{proxy['type']}://{proxy['ip']}:{proxy['port']}"
        else :
            continue

    if best_proxy != "" :
        return best_proxy
    else :
        return "No best proxy found !"

def get_proxy(country) :
    try :
        country = country.strip().title()
        country_code = code(country)
        if country_code != "No country found !" :
            best_proxy = proxy(country_code)
            if proxy :
                return best_proxy
            else:
                return "No best proxy found !"
        else :
            return "Country code not found ! Please check your spelling."
    except :
        "Something went wrong !"

print(get_proxy(country))    # country is initialised at starting of Python script

END_PYTHON
)
}




# *************************************************************************** Script ***********************************************************************





# Automatically update yt-dlp latest version whenever script will run
#pip3 install --upgrade yt-dlp > /dev/null

# Display current version of yt-dlp
#echo -e "\nThe current yt-dlp version is : $(yt-dlp --version)"

# Get YouTube link from user
clear
echo
read -p "Enter the YouTube video link : " link
echo
read -p "Is the video restricted to an other specific country (Y/n) : " rest

if [[ $rest == "Y" || $rest == "y" ]]; then
    export country;
    read -p "Enter country name : " country;
    get_proxy > /dev/null
    PROXY=$(echo "$PROXY" | tr -d '\n' | sed -E 's/.*(socks5:\/\/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}:[0-9]{1,5})/\1/')
fi

# Edit link (e.g., playlist video link to simple video link
#link=$(echo "$link" | sed 's/www.youtube.com/youtu.be/g' | sed 's/watch?v=\(.*\)/\1/' | sed 's/watch?v=\(.*\)&list.*/\1/')?feature=shared
#link=$(echo "$link" | sed 's/www.youtube.com/youtu.be/g' | sed 's/&list.*//g')?feature=shared           # s/watch?v=//g; 
#echo "Correct link : $link"

# Best Audio and Video Formats
best_audio=""
best_video=""

declare -A audio;
declare -A video;
declare -A size;
declare -A format;
declare -A audio_codec;

# Display quality options for YouTube video
if [[ $rest == "Y" || $rest == "y" ]]; then
  echo "Proxy : $PROXY"
    while IFS='|' read -r f1 f2 f3 f4 f5 f6 f7 f8; do
        if [[ $f3 == "audio" ]]; then
            audio["$f1"]="$f3";
            size["$f1"]="$f5";
            format["$f1"]="$f2";
            audio_codec["$f1"]="$f7 $f8";
            if [[ $f3 > $best_audio ]]; then
                best_audio=$f1
            fi
        else
            video["$f1"]="$f3 ($f2)";
            size["$f1"]="$f5";
            format["$f1"]="$f2";
            audio_codec["$f1"]="$f7 $f8";
            if [[ $f1 > $best_video ]]; then
                best_video="$f1 ($f2)"
            fi
        fi
    done < <(yt-dlp --proxy "$PROXY" -F --no-playlist "$link" | sed -E -n '/^[0-9]{2,3}/,$p' | awk '{print $1 "|" $2 "|" $3 "|" $4 "|" $7 "|" $16 "|" $12 "|" $13}' | sed '/html/d')

else
    while IFS='|' read -r f1 f2 f3 f4 f5 f6 f7 f8; do
        if [[ $f3 == "audio" ]]; then
            audio["$f1"]="$f3";
            size["$f1"]="$f5";
            format["$f1"]="$f2";
            audio_codec["$f1"]="$f7 $f8";
            if [[ $f3 > $best_audio ]]; then
                best_audio=$f1
            fi
        else
            video["$f1"]="$f3 ($f2)";
            size["$f1"]="$f5";
            format["$f1"]="$f2";
            audio_codec["$f1"]="$f7 $f8";
            if [[ $f1 > $best_video ]]; then
                best_video="$f1 ($f2)"
            fi
        fi
    done < <(yt-dlp -F --no-playlist "$link" | sed -E -n '/^[0-9]{2,3}/,$p' | awk '{print $1 "|" $2 "|" $3 "|" $4 "|" $7 "|" $16 "|" $12 "|" $13}' | sed '/html/d')
fi

# clear

echo -e "\n\nAll Audio Formats :-\n"
echo "|--------------------------|--------------------------|---------------------------|--------------------------|"
printf "| %*s%s%*s | %*s%s%*s | %*s%s%*s | %*s%s%*s |\n" 11 "" "ID" 11 "" 9 "" "FORMAT" 9 "" 7 "" "Audio Codec" 7 "" 10 "" "Size" 10 ""
echo "|--------------------------|--------------------------|---------------------------|--------------------------|"
for i in "${!audio[@]}"; do
    l1_pad=$(( (24 - ${#i}) / 2 )); r1_pad=$(( 24 - ${#i} - l1_pad ));
    l3_pad=$(( (25 - ${#audio_codec[$i]}) / 2 )); r3_pad=$(( 25 - ${#audio_codec[$i]} - l3_pad ));
    printf "| %*s%s%*s | %-24s | %*s%s%*s | %-24s |\n" "$l1_pad" "" "$i" "$r1_pad" "" "${video[$i]}" "$l3_pad" "" "${audio_codec[$i]}" "$r3_pad" "" "${size[$i]}"
done | sort -k2,2
echo "|--------------------------|--------------------------|---------------------------|--------------------------|"

echo -e "\n\nAll Video Formats :-\n"
echo "|--------------------------|--------------------------|---------------------------|--------------------------|"
printf "| %*s%s%*s | %*s%s%*s | %*s%s%*s | %*s%s%*s |\n" 11 "" "ID" 11 "" 9 "" "FORMAT" 9 "" 7 "" "Audio Codec" 7 "" 10 "" "Size" 10 ""
echo "|--------------------------|--------------------------|---------------------------|--------------------------|"
for i in "${!video[@]}"; do
    l1_pad=$(( (24 - ${#i}) / 2 )); r1_pad=$(( 24 - ${#i} - l1_pad ));
    l3_pad=$(( (25 - ${#audio_codec[$i]}) / 2 )); r3_pad=$(( 25 - ${#audio_codec[$i]} - l3_pad ));
    printf "| %*s%s%*s | %-24s | %*s%s%*s | %-24s |\n" "$l1_pad" "" "$i" "$r1_pad" "" "${video[$i]}" "$l3_pad" "" "${audio_codec[$i]}" "$r3_pad" "" "${size[$i]}"
done | sort -k2,2
echo "|--------------------------|--------------------------|---------------------------|--------------------------|"

echo -e "\n\n"
read -p "Enter ID of video format to download : " id
echo
read -p "Enter new name of downloaded video (Press 'Enter' for default) : " name
echo
download_dir=$(osascript -e 'POSIX path of (choose folder with prompt "Select Video Download Folder : ")')
echo "Path : $download_dir"
echo
if [[ $name != "" ]]; then
    filename="$download_dir$name.%(ext)s"
else
    filename="$download_dir%(title)s.%(ext)s"
fi


if [[ $rest == "Y" || $rest == "y" ]]; then
    if [[ "${audio_codec[$id]}" == "video only" ]]; then
        yt-dlp --newline --proxy "$PROXY" --no-playlist -f "$id+$best_audio" --merge-output-format "${format["$id"]}" -o "$filename" --exec 'echo -e "\n\n{} downloaded successfully !" && open "{}"' "$link" 2>&1 | egrep -e "^\[download\]" -e "downloaded successfully !$"   #> /dev/null
    else
        yt-dlp --proxy "$PROXY" --no-playlist -f "$id" -o "$filename" --exec 'echo -e "\n\n{} downloaded successfully !" && open "{}"' "$link" 2>&1 | egrep -e "^\[download\]" -e "downloaded successfully !$"   #> /dev/null
    fi
else
    if [[ "${audio_codec[$id]}" == "video only" ]]; then
        yt-dlp --newline --no-playlist -f "$id+$best_audio" --merge-output-format "${format["$id"]}" -o "$filename" --exec 'echo -e "\n\n{} downloaded successfully !" && open "{}"' "$link" 2>&1 | egrep -e "^\[download\]" -e "downloaded successfully !$"    #> /dev/null
    else
        yt-dlp --newline --no-playlist -f "$id" -o "$filename" --exec 'echo -e "\n\n{} downloaded successfully !" && open "{}"' "$link" 2>&1 | egrep -e "^\[download\]" -e "downloaded successfully !$"   #> /dev/null
    fi
fi

echo -e "\n"
read -p "Do you want to merge two files (Y/n) : " cond

if [[ "$cond" == "Y" || "$cond" == "y" ]]; then
    path="$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)"
    filename="$path/merge.sh"
    $filename
fi

echo -e "\n\n************************************************************************* Complete ****************************************************************************\n\n"

