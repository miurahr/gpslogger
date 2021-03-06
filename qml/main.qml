import QtQuick 1.0
import com.nokia.meego 1.0

PageStackWindow {
    id: appWindow
    
   
    function show_Opt_In(){
	dialog_Opt_In.open()
    }  
    
    
    
    initialPage: mainPage
    MainPage{id: mainPage}


    Menu {
        id: myMenu
        MenuLayout {

            MenuItem {
                text: "About"
                onClicked: { about.open(); }
            }
            
            MenuItem {
                text: "Help"
                onClicked: { help.open(); }
            }
        }
    }



    QueryDialog {
        id: about
        icon: "../img/icon_80.png"
        titleText: "GPS Logger"
        message: "Version: " + gpslogger.get_version() + "\n" +
		 "Copyright 2012 by George Ruinelli\n"+
                 "Contact: george@ruinelli.ch\n"+
                 "Web: www.ruinelli.ch/gps-logger\n"+
                 "Modified 2013 by Hiroshi Miura"
	acceptButtonText: "Ok"
    }
    

    QueryDialog {
        id: help
        icon: "../img/icon_80.png"
        titleText: "GPS Logger"
        message: "The tracks will be saved in MyDocs/GPS-Logger."
	acceptButtonText: "Ok"
    }
    

    QueryDialog {
        id: dialog_Opt_In
        icon: "../img/icon_80.png"
        titleText: "GPS Logger"
        message: "How useful is a GPS-Logger without a GPS signal? You might think this is a stupid question. But Nokia still forces me to ask you:\nDo you accept that GPS-Logger uses your GPS and Location data?\nPlease push YES, else I have to die..."
	acceptButtonText: "YES"
        rejectButtonText: "Let me die..."  
        onAccepted: {
	    qml_to_python.Opt_In(true)
	}
        onRejected: {
	    qml_to_python.Opt_In(false)
	}
    }


}
