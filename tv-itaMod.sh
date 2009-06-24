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

PLAYER=cvlc

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
false "Sportitalia" "Sport" \
false "Rtl" "Music" \
false "Allmusic" "Music" \
false "Radioitalia" "Music" \
false "Canale7" "Variety" \
--width=300 --height=430 `

case $SCELTA in
    "Rai1" ) url="http://mediapolis.rai.it/relinker/relinkerServlet.htm?cont=983";;
    "Rai2" ) url="http://mediapolis.rai.it/relinker/relinkerServlet.htm?cont=984";;
    "Rai3" ) url="http://mediapolis.rai.it/relinker/relinkerServlet.htm?cont=986";;
    "Rainews24" ) url="http://mediapolis.rai.it/relinker/relinkerServlet.htm?cont=1";;
    "Raisport" ) url="http://mediapolis.rai.it/relinker/relinkerServlet.htm?cont=4145";;
    "Raiedu1" ) url="http://mediapolis.rai.it/relinker/relinkerServlet.htm?cont=24268";;
    "Sportitalia" ) url="mms://mms.cdn-tiscali.com/sportitalia";;
    "Rtl" ) url="mms://151.1.245.36/rtl102.5vs";;
    "Allmusic" ) url="mms://live.mediaserver.kataweb.it/retea?MSWMExt=.asf";;
    "Radioitalia" ) url="mms://radioitalialive.str.idc.extra.it/radioitaliatv?MSWMExt=.asf";;
    "Canale7" ) url="mms://151.1.245.65/canale7";;
       * ) zenity --info --text="Request Annulled" --width=250 & exit 1;;
esac
 
$PLAYER --http-user-agent="Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.6) Gecko/2009020911 Ubuntu/8.10 (intrepid) Firefox/3.0.6" "$url"

