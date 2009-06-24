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
# Authors:
# Ivan Morgillo < imorgillo [at] sanniolug [dot] org >
# Stefano Viola < EstebanSanninexstreme [at] hotmail [dot] it >

#!/bin/bash

# PLEAMBLE
PROJECT=tv-ita
if [ -e /usr/bin/cvlc ]; then
    PLAYER=/usr/bin/cvlc
elif [ -e  /usr/bin/vlc ]; then 
    PLAYER=/usr/bin/vlc
else
    echo "Hai bisogno di installare VLC o CVLC"
    exit 1
fi

# Shows a guide
function usage {
    echo "TV-ita - Guarda le tv italiane in streaming"
    echo
    echo -e "--gui \t Lancia l'interfaccia grafica"
    echo -e "--help \t Visualizza questa guida"
    echo
    echo "Puoi anche lanciare un canale rapidamente da console"
    echo "scegliendolo dalla lista:"
    echo -e "\t rai1, rai2, rai3, rainews24, raisport, raiedu1"
    echo -e "\t sportitalia, rtl, allmusic, radioitalia, canale7"
    echo
    echo "Ti bastera' scrivere:"
    echo -e "\t $PROJECT canale"
    echo "Buona visione!"
    exit 0
}

# Shows GUI
function gui {
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
	* ) exit 0;;
    esac
    
    $PLAYER --http-user-agent="Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.6) Gecko/2009020911 Ubuntu/8.10 (intrepid) Firefox/3.0.6" "$url"
}

function console {
    case $1 in
	"rai1" ) url="http://mediapolis.rai.it/relinker/relinkerServlet.htm?cont=983";;
	"rai2" ) url="http://mediapolis.rai.it/relinker/relinkerServlet.htm?cont=984";;
	"rai3" ) url="http://mediapolis.rai.it/relinker/relinkerServlet.htm?cont=986";;
	"rainews24" ) url="http://mediapolis.rai.it/relinker/relinkerServlet.htm?cont=1";;
	"raisport" ) url="http://mediapolis.rai.it/relinker/relinkerServlet.htm?cont=4145";;
	"raiedu1" ) url="http://mediapolis.rai.it/relinker/relinkerServlet.htm?cont=24268";;
	"sportitalia" ) url="mms://mms.cdn-tiscali.com/sportitalia";;
	"rtl" ) url="mms://151.1.245.36/rtl102.5vs";;
	"allmusic" ) url="mms://live.mediaserver.kataweb.it/retea?MSWMExt=.asf";;
	"radioitalia" ) url="mms://radioitalialive.str.idc.extra.it/radioitaliatv?MSWMExt=.asf";;
	"canale7" ) url="mms://151.1.245.65/canale7";;
	* ) usage;;
    esac
    
    $PLAYER --http-user-agent="Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.6) Gecko/2009020911 Ubuntu/8.10 (intrepid) Firefox/3.0.6" "$url"
}

# Command line arguments check
if [ -z "$1" ]; then 
    usage
elif [ "$1" = "--help" ]; then
    usage
elif [ "$1" = "--gui" ]; then
    gui
else
    console "$1"
fi