# 'TV-ita' is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License,
# or any later version.
#
# 'TV-ita' is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with 'TV-ita'. If not, see <http://www.gnu.org/licenses/>.
#
# Main Author: Ivan Morgillo < imorgillo [at] sanniolug [dot] org >
#
# Graphic Author: Stefano Viola < 

#!/bin/bash

PLAYER=vlc

SCELTA=`zenity --title "TV-ITA Streaming" \
--text "Selection channel:" \
--list --radiolist \
--column="Selection" \
--column="Channel" \
--column "Description" \
true "Rai1" "Variety" \
false "Rai2" "Variety" \
false "Rai3" "Variety" \
false "Rainews24" "Information" \
false "Raisport" "Sport" \
false "Raiedu1" "Education" \
false "Raiedu2" "Education" \
false "Sportitalia" "Sport" \
false "Rtl" "Music" \
false "Allmusic" "Music" \
false "Radioitalia" "Music" \
false "Canale7" "Variety" \
--width=300 --height=430 `

case $SCELTA in
    "Rai1" ) url="mmsh://212.162.68.13/prodtvr1?MSWMExt=.asf";;
    "Rai2" ) url="mms://212.162.68.13/prodtvr2";;
    "Rai3" ) url="mms://212.162.68.13/prodtvr3";;
    "Rainews24" ) url="mms://a1509.l6934735508.c69347.e.lm.akamaistream.net/D/1509/69347/v0001/reflector:35508?auth=daEaPdkcidcb4b6aAb8cgbJaHa7c1cCaLdZ-bkp2zy-b4-BmrwzHp&aifp=V001";;
    "Raisport" ) url="mms://212.162.68.13/raisport+";;
    "Raiedu1" ) url="mms://212.162.68.13/EDU1";;
    "Raiedu2" )url="mms://212.162.68.13/EDU2";;
    "Sportitalia" ) url="mms://mms.cdn-tiscali.com/sportitalia";;
    "Rtl" ) url="mms://151.1.245.36/rtl102.5vs";;
    "Allmusic" ) url="mms://live.mediaserver.kataweb.it/retea?MSWMExt=.asf";;
    "Radioitalia" ) url="mms://radioitalialive.str.idc.extra.it/radioitaliatv?MSWMExt=.asf";;
    "Canale7" ) url="mms://151.1.245.65/canale7";;
       * ) zenity --info --text="Request Annulled" --width=250 & exit 1;;
esac
 
$PLAYER "$url"

